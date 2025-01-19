variable "vpc_id" {
    type = string
  
}

variable "public_subnet_cidr" {
    type = string
    default = "10.1.1.0/24"
  
}

variable "private_subnet_cidr" {
    type = string
    default = "10.1.10.0/24"
  
}

variable "public_az" {
    type = string
    default = "us-east-1a"
  
}

variable "private_az" {
    type = string
    default = "us-east-1b"
  
}