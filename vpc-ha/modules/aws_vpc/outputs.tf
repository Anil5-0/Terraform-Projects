output "vpc_id" {
  value = aws_vpc.app-vpc.id
}

output "subnet1_id" {
  value = aws_subnet.app-sub-1.id
}

output "subnet2_id" {
  value = aws_subnet.app-sub-2.id
}

