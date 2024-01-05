resource "aws_s3_bucket" "athena" {
  bucket = var.athena_results_bucket
}

resource "aws_athena_workgroup" "limited-wg" {
  name = "limited-wg"
  configuration {
    enforce_workgroup_configuration    = true
    publish_cloudwatch_metrics_enabled = true
    bytes_scanned_cutoff_per_query     = 1024 * 1024 * 20
    result_configuration {
      output_location = "s3://${aws_s3_bucket.athena.id}/limited-wg/"
    }
  }
}
