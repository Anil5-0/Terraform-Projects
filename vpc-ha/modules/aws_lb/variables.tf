variable "lb_type" {
    description = "name the type of load balancer, for example application or network"
}

variable "vpc_id" {
  description = "id of the vpc in which lb should be created"
}

variable "subnet1_id" {
  description = "id of the subnet1 in which lb should be created"
}

variable "subnet2_id" {
  description = "id of the subnet2 in which lb should be created"
}

variable "instance1_id" {
  description = "id of the ec2 instance1"
}

variable "instance2_id" {
  description = "id of the ec2 instance2"
}

variable "sg_id" {
  description = "value of the sg id to be attached with ec2"
}