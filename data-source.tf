resource "aws_s3_bucket" "data-source" {
  bucket = var.source_bucket
}
