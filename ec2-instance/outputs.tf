output "ec2_public_ip" {
    value = aws_instance.tf-server.public_ip
}