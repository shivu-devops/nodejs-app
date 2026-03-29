variable "region" {
  default = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR block for vpc"
  type = string
  default = "10.0.0.0/16"
}

variable "availability_zones" {
  description = "List of availability zones for the VPC"
  type = string
  default = "us-east-1a"
}

variable "public_subnet_cidr" {
  description = "CIDR block for public subnets"
  type = string 
  default = "10.0.1.0/24"
}

variable "instance_type" {
  default = "t2.large"
}

variable "ami_id" {
  description = "ID of the AMI to use for the EC2 instance"
  type = string
  default = "ami-0ec10929233384c7f"
}

variable "key_name" {
  description = "aws key pair name"
  type = string
}




