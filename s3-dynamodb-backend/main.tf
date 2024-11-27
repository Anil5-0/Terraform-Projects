provider "aws" {
    region = "ap-southeast-1"
}

resource "aws_s3_bucket" "tf-lock-bkt" {
    bucket = var.bucket_name
}

resource "aws_s3_bucket_versioning" "tf-lock-bkt-v" {
    bucket = aws_s3_bucket.tf-lock-bkt.id
    versioning_configuration {
      status = "Enabled"
    }
}

resource "aws_dynamodb_table" "tf-lock-db" {
    name = var.dynamodb_table_name
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "LockID"
    attribute {
      name = "LockID"
      type = "S"
    }
}

