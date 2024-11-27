variable "bucket_name" {
    description = "name of s3 bucket to be used as remote backend"
}

variable "dynamodb_table_name" {
    description = "name of the dynamodb table used for locking"
}