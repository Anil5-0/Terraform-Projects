resource "aws_vpc" "app-vpc" {
  cidr_block = var.vpc_cidr_block
}

resource "aws_internet_gateway" "app-igw" {
  vpc_id = aws_vpc.app-vpc.id
}

resource "aws_subnet" "app-sub-1" {
  vpc_id                  = aws_vpc.app-vpc.id
  cidr_block              = var.subnet1_cidr_block
  availability_zone       = var.availabilty_zone1
  map_public_ip_on_launch = true
}

resource "aws_subnet" "app-sub-2" {
  vpc_id                  = aws_vpc.app-vpc.id
  cidr_block              = var.subnet2_cidr_block
  availability_zone       = var.availabilty_zone2
  map_public_ip_on_launch = true
}

resource "aws_route_table" "app-rt" {
  vpc_id = aws_vpc.app-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.app-igw.id
  }
}

resource "aws_route_table_association" "app-rta-1" {
  route_table_id = aws_route_table.app-rt.id
  subnet_id      = aws_subnet.app-sub-1.id
}

resource "aws_route_table_association" "app-rta-2" {
  route_table_id = aws_route_table.app-rt.id
  subnet_id      = aws_subnet.app-sub-2.id
}