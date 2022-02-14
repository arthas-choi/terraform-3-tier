resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name

  versioning = {
    enabled = var.bucket_versioning
  }

  force_destroy = true
}

resource "aws_s3_bucket_acl" "bucket-acl" {
  bucket = aws_s3_bucket.bucket.id
  acl    = local.bucket_private_acl
}
