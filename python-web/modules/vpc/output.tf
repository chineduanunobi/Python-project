# export the region
output "region" {
  value = var.region
}

# export the project name
output "project_name" {
  value = var.project_name
}

# export the vpc id
output "vpc_id" {
  value = aws_vpc.vpc.id
}

# export the internet gateway
output "igw" {
  value = aws_internet_gateway.igw
}

# export the public subnet1
output "public_subnet1" {
  value = aws_subnet.public_subnet1.id
}

# export the public subnet2
output "public_subnet2" {
  value = aws_subnet.public_subnet2.id
}

# export the public subnet2
output "public_subnet3" {
  value = aws_subnet.public_subnet2.id
}

# export the first availability zone
output "availability_zone_1" {
  value = data.aws_availability_zones.availability_zones.names[0]
}

# export the second availability zone
output "availability_zone_2" {
  value = data.aws_availability_zones.availability_zones.names[1]
}

# export the second availability zone
output "availability_zone_3" {
  value = data.aws_availability_zones.availability_zones.names[2]
}