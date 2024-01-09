resource "aws_lakeformation_data_lake_settings" "LakeSettings" {
  admins = [data.aws_caller_identity.current.arn]
}

resource "aws_lakeformation_resource" "SourceS3" {
  arn = aws_s3_bucket.data-source.arn
}

data "aws_glue_catalog_table" "cloudfront_logs" {
  database_name = "default"
  name          = "cloudfront_logs"
}

resource "aws_lakeformation_permissions" "TestRoleSelect" {
  permissions = ["SELECT"]
  principal   = aws_iam_role.AthenaWorkgroupUserRole.arn
  table {
    database_name = data.aws_glue_catalog_table.cloudfront_logs.database_name
    name          = data.aws_glue_catalog_table.cloudfront_logs.name
  }
}
