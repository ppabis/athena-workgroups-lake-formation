data "aws_caller_identity" "current" {}

resource "aws_iam_role" "AthenaWorkgroupUserRole" {
  name = "AthenaWorkgroupUserRole"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action    = "sts:AssumeRole"
      Effect    = "Allow"
      Principal = { AWS = data.aws_caller_identity.current.arn }
    }]
  })
}

resource "aws_iam_role_policy_attachment" "AthenaWorkgroupPermissions" {
  policy_arn = aws_iam_policy.AthenaWorkgroupPermissions.arn
  role       = aws_iam_role.AthenaWorkgroupUserRole.name
}
