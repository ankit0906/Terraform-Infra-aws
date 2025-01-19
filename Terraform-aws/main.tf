module "vpc" {
    source = "./vpc"
    
  
}

module "subnet" {
    source = "./subnet"
    vpc_id = module.vpc.vpc_id

    
  
}

module "IG" {
    source = "./IG"
    vpc_id = module.vpc.vpc_id
  
}

module "NG" {
    source = "./NG"
    subnet_id  = module.subnet.subnet_id      
  
}

module "ec2" {
    source = "./ec2"
    ami = var.ami
    instance_type = var.instance_type
    
  
}

module "SG" {
    source = "./SG"
    vpc_id = module.vpc.vpc_id
    
    
  
}

module "route" {
    source = "./route"
    vpc_id = module.vpc.vpc_id
    IGW_id = module.IG.IGW_id
    
    
  
}

module "EBS" {
    source = "./EBS"
    availability_zone = var.availability_zone
  
}

module "ASG" {
    source = "./ASG"
  
}

module "NACL" {
  source = "./NACL"
  vpc_cidr = var.vpc_cidr
  vpc_id = module.vpc.vpc_id

}

module "s3" {
    source = "./s3"
  
}

module "LB" {
  source = "./LB"
  vpc_id = module.vpc.vpc_id
  security_groups = module.SG.SG_id
  subnet_id =   module.subnet.subnet_id
  private_subnet_id =  module.subnet.private_subnet_id
  
}