resource "aws_key_pair" "app-key-pair" {
  key_name   = "app-ec2-login"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_instance" "app-instance1" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [var.sg_id]
  subnet_id              = var.subnet1_id
  key_name               = aws_key_pair.app-key-pair.key_name
  iam_instance_profile   = var.instance_profile_name
  user_data              = base64encode(file("${path.module}/scripts/userdata1.sh"))
}

resource "aws_instance" "app-instance2" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [var.sg_id]
  subnet_id              = var.subnet2_id
  key_name               = aws_key_pair.app-key-pair.key_name
  iam_instance_profile   = var.instance_profile_name
  user_data              = base64encode(file("${path.module}/scripts/userdata2.sh"))
}