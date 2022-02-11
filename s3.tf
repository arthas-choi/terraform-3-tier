resource "aws_s3_bucket" "bucket" {
  bucket = lower("${var.resource_prefix}-bucket")
}

resource "aws_s3_bucket_acl" "bucket-acl" {
  bucket = aws_s3_bucket.bucket.id
  acl    = "private"
}
