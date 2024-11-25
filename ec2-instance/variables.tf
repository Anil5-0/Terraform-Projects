variable "ami_value" {
    description = "value of ami-id to be used by EC2 instance"
}

variable "instance_type_value" {
    description = "value of the instance type to be used by EC2 instance"
    default = "t2.micro"
}

variable "associate_public_ip_address_value" {
    description = "whether public ip is needed or not"
    default = "false"
  
}