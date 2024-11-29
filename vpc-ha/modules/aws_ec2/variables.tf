variable "vpc_id" {
  description = "id of the vpc"
}

variable "ami_id" {
  description = "value of ami id to be used, for example ami-047126e50991d067b"
}

variable "instance_type" {
  description = "value of the instance type, for example t2.micro"
}

variable "subnet1_id" {
  description = "value of the subnet id associated with subnet1"
}

variable "subnet2_id" {
  description = "value of the subnet id associated with subnet2"
}

variable "instance_profile_name" {
  description = "name of ec2 instance profile"
}

variable "sg_id" {
  description = "value of the sg id to be attached with ec2"
}