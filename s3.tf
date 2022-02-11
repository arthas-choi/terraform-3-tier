resource "aws_s3_bucket" "bucket" {
  bucket = "${var.resource_prefix}-Bucket"
}

resource "aws_s3_bucket_acl" "bucket-acl" {
  bucket = aws_s3_bucket.bucket.id
  acl    = "private"
}
