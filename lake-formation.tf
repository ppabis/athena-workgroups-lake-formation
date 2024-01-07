resource "aws_lakeformation_data_lake_settings" "LakeSettings" {
  admins = [data.aws_caller_identity.current.arn]
}

resource "aws_lakeformation_resource" "SourceS3" {
  arn = aws_s3_bucket.data-source.arn
}
