resource "aws_s3_bucket" "athena" {
  bucket = var.athena_results_bucket
}
