locals {
  bucket_private_acl = var.bucket_private_acl ? "private" : "public-read"
}
