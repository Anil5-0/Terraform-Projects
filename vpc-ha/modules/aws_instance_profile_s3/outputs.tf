output "ec2_instance_profile_name" {
    value = aws_iam_instance_profile.app-profile.name
}