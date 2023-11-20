# environment variables
variable "instance_type" {
  type    = string
  default = "t2.micro"
}
variable "region" {
  type    = string
  default = "us-east-1"
}
variable "image_id" {
  type    = string
  default = "ami-0715c1897453cabd1"
}
variable "project_name" {
  type        = string
  description = "This configures the project name"
}

# vpc variables
variable "vpc_cidr" {
  description = "CIDR range for VPC"
  type        = string
}
variable "public_subnet1" {}
variable "public_subnet2" {}
variable "public_subnet3" {}
variable "private_subnet1" {}
variable "private_subnet2" {}