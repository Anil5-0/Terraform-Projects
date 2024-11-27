provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_vpc" "app-test-vpc" {
  cidr_block = var.vpc_cidr_block
}

resource "aws_internet_gateway" "app-test-igw" {
  vpc_id = aws_vpc.app-test-vpc.id
}

resource "aws_subnet" "app-test-subnet" {
  vpc_id                  = aws_vpc.app-test-vpc.id
  cidr_block              = var.subnet_cidr_block
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = true
}

resource "aws_route_table" "app-test-route-table" {
  vpc_id = aws_vpc.app-test-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.app-test-igw.id
  }
}

resource "aws_route_table_association" "app-test-route-table-association" {
  route_table_id = aws_route_table.app-test-route-table.id
  subnet_id      = aws_subnet.app-test-subnet.id
}

resource "aws_security_group" "app-test-sg" {
  vpc_id = aws_vpc.app-test-vpc.id

  ingress {
    description = "Incoming http traffic to app"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "ssh access to instance"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_key_pair" "app-test-keypair" {
  key_name   = "app-test-ec2-login"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_instance" "app-test-server" {
  ami                    = var.ami_value
  instance_type          = var.instance_type
  key_name               = aws_key_pair.app-test-keypair.key_name
  vpc_security_group_ids = [aws_security_group.app-test-sg.id]
  subnet_id              = aws_subnet.app-test-subnet.id

  connection {
    host        = self.public_ip
    type        = "ssh"
    private_key = file("~/.ssh/id_rsa")
    user        = "ubuntu"
  }

  provisioner "file" {
    source      = "scripts/"
    destination = "/home/ubuntu"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x start-up.sh",
      "sh start-up.sh",
      "sleep 1"
    ]
  }
}




