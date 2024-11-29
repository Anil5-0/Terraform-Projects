data "aws_iam_policy_document" "app-assume-role" {
  statement {
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_instance_profile" "app-profile" {
  name = "app-profile"
  role = aws_iam_role.app-iam-role.name
}

resource "aws_iam_role" "app-iam-role" {
  name               = "app-iam-role-s3-access"
  assume_role_policy = data.aws_iam_policy_document.app-assume-role.json
}

data "aws_iam_policy_document" "app-s3-access-policy-doc" {
  statement {
    effect  = "Allow"
    actions = [
      "s3:GetObject",
      "s3:GetObjectTagging"
    ]

    resources = [
      "arn:aws:s3:::${var.s3_bucket_name}",
      "arn:aws:s3:::${var.s3_bucket_name}/*",
    ]
  }
}

resource "aws_iam_policy" "app-s3-access-policy" {
  name   = "app-s3-access-policy"
  policy = data.aws_iam_policy_document.app-s3-access-policy-doc.json
}

resource "aws_iam_role_policy_attachment" "app-policy-attach" {
  role       = aws_iam_role.app-iam-role.name
  policy_arn = aws_iam_policy.app-s3-access-policy.arn
}