output "ec2_public_ip" {
  value = aws_instance.app-test-server.public_ip
}