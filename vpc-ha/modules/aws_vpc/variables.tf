variable "vpc_cidr_block" {
  description = "cidr value for vpc, for example 10.0.0.0/16"
}

variable "subnet1_cidr_block" {
  description = "cidr value for subnet1, for example 10.0.0.0/24"
}

variable "subnet2_cidr_block" {
  description = "cidr value for subnet2, for example 10.0.1.0/24"
}

variable "availabilty_zone1" {
  description = "name of the availability zone where the instance should run, for example ap-southeast-1"
}

variable "availabilty_zone2" {
  description = "name of the availability zone where the instance should run, for example ap-southeast-2"
}
