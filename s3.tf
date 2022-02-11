resource "aws_s3_bucket" "this" {
  bucket = "${var.resource_prefix}-Bucket"
  acl    = "private"
}
