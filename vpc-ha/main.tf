module "instance_profile" {
  source = "./modules/aws_instance_profile_s3"

  s3_bucket_name = var.s3_bucket_name
}

module "vpc" {
  source = "./modules/aws_vpc"

  vpc_cidr_block     = var.vpc_cidr_block
  subnet1_cidr_block = var.subnet1_cidr_block
  subnet2_cidr_block = var.subnet2_cidr_block
  availabilty_zone1  = var.availabilty_zone1
  availabilty_zone2  = var.availabilty_zone2
}

module "sg" {
  source = "./modules/aws_sg"

  vpc_id = module.vpc.vpc_id
}

module "ec2" {
  source = "./modules/aws_ec2"

  ami_id                = var.ami_id
  instance_type         = var.instance_type
  vpc_id                = module.vpc.vpc_id
  subnet1_id            = module.vpc.subnet1_id
  subnet2_id            = module.vpc.subnet2_id
  instance_profile_name = module.instance_profile.ec2_instance_profile_name
  sg_id                 = module.sg.sg_id
}

module "lb" {
  source = "./modules/aws_lb"

  lb_type      = var.lb_type
  vpc_id       = module.vpc.vpc_id
  subnet1_id   = module.vpc.subnet1_id
  subnet2_id   = module.vpc.subnet2_id
  instance1_id = module.ec2.instance1_id
  instance2_id = module.ec2.instance2_id
  sg_id        = module.sg.sg_id
}