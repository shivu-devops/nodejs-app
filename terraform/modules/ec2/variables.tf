variable "ami_id" {
  description = "ID of the AMI to use for the EC2 instance"
  type = string
}

variable "instance_type" {
  description = "Type of EC2 instance to launch"
  type = string
}

variable "vpc_id" {
  description = "VPC ID"
  type = string
}

variable "subnet_id" {
  description = "Subnet ID"
  type = string
}

variable "key_name" {
  description = "Name of the key pair to use for the EC2 instance"
  type = string
}