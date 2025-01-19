variable "vpc_cidr" {
    type = string
    default = "10.1.0.0/16"
  
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

variable "ami" {
    type = string
    default = "ami-00c39f71452c08778"
  
}
variable "instance_type" {
    type = string
    default = "t2.micro"
  
}

variable "availability_zone" {
    type = string
    default = "us-east-1a"
  
}




