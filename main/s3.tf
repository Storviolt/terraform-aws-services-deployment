resource "aws_s3_bucket" "bucket" {
  for_each = { for bucket in var.s3_buckets : bucket.name => bucket }

  bucket = each.value.name
}