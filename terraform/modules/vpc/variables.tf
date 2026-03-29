variable "vpc_cidr" {
  description = "CIDR block for vpc"
  type = string
}

variable "availability_zones" {
  description = "List of availability zones for the VPC"
  type = string
}

variable "public_subnet_cidr" {
  description = "CIDR block for public subnets"
  type = string 
}
