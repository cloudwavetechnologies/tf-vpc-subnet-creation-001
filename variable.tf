variable "aws_region" {
  default = "eu-north-1"
}

variable "vpc_name" {
  description = "Name of the VPC"
}
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
}
variable "subnet_cidr" {
  description = "CIDR block value for subnet"
}
variable "availability_zone" {
  description = "Name of the availability zone"
}
variable "subnet_name" {
  description = "Name of the subnet"
}