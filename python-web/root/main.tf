module "vpc" {
  source = "../modules/vpc"

  region = var.region

  project_name = var.project_name

  vpc_cidr = var.vpc_cidr

  public_subnet1  = var.public_subnet1
  public_subnet2  = var.public_subnet2
  public_subnet3  = var.public_subnet3
  private_subnet1 = var.private_subnet1
  private_subnet2 = var.private_subnet2
}

#security group resource to allow traffic to/from ports
resource "aws_security_group" "python-web-sg" {
  name        = "${module.vpc.project_name}-SG"
  description = "Security Group for the python website"
  vpc_id      = module.vpc.vpc_id

  #allow incoming traffic on specified ports:
  ingress {
    description = "HTTP from Internet"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "access from exposed port"
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  #allow all outbound traffic.
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${module.vpc.project_name}-SG"
  }
}

#asg to ensure 2 instances are always running
resource "aws_autoscaling_group" "python-web-asg" {
  name             = "${module.vpc.project_name}-ASG"
  min_size         = 2
  max_size         = 4
  desired_capacity = 2
  #AWS waits 300secs before EC2 instance is deemed unhealthy
  health_check_grace_period = 300
  health_check_type         = "EC2"
  termination_policies      = ["OldestInstance"]

  #use the launch template created created in the lt resource
  launch_template {
    id      = aws_launch_template.python-web-lt.id
    version = "$Latest"
  }
  vpc_zone_identifier = [module.vpc.public_subnet1, module.vpc.public_subnet2, module.vpc.public_subnet3]

  tag {
    key                 = "Name"
    value               = "${module.vpc.project_name}-instance"
    propagate_at_launch = true
  }
}

#used to create the instances
resource "aws_launch_template" "python-web-lt" {
  name = "${module.vpc.project_name}-LT"
  # Uses the custom AMI
  image_id               = var.image_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.python-web-sg.id]

  user_data = filebase64("launch.sh")
}

#this target group is used for the instances
resource "aws_lb_target_group" "python-web-tg" {
  name        = "${module.vpc.project_name}-TG"
  port        = 5000
  protocol    = "HTTP"
  vpc_id      = module.vpc.vpc_id
  target_type = "instance"

  health_check {
    path     = "/"
    protocol = "HTTP"
    port     = "5000"
    interval = 30
    timeout  = 10
  }
}

#associate target group to asg
resource "aws_autoscaling_attachment" "python-web-asg-attachment" {
  autoscaling_group_name = aws_autoscaling_group.python-web-asg.id
  lb_target_group_arn    = aws_lb_target_group.python-web-tg.arn
}

#create lb that points to the target group
resource "aws_lb" "python-web-lb" {
  name               = "${module.vpc.project_name}-LB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.python-web-sg.id]
  subnets            = [module.vpc.public_subnet1, module.vpc.public_subnet2, module.vpc.public_subnet3]
}

#create listener for the load balancer
resource "aws_lb_listener" "route_listener" {
  load_balancer_arn = aws_lb.python-web-lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.python-web-tg.arn
  }

  tags = {
    Name = "${module.vpc.project_name}-LB"
  }
}