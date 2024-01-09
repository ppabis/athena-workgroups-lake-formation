data "aws_iam_policy_document" "LakeFormationGlueTablesAccess" {
  statement {
    effect = "Allow"
    actions = [
      "lakeformation:GetDataAccess",
      "lakeformation:GetResourceLFTags",
      "lakeformation:ListLFTags",
      "lakeformation:GetLFTag",
      "lakeformation:SearchDatabasesByLFTags"
    ]
    resources = ["*"]
  }
}

resource "aws_iam_policy" "LakeFormationGlueTablesAccess" {
  name        = "LakeFormationGlueTablesAccess"
  description = "Lakeformation access to cloudfront_logs table"
  policy      = data.aws_iam_policy_document.LakeFormationGlueTablesAccess.json
}

resource "aws_iam_role_policy_attachment" "LakeFormationGlueTablesAccess" {
  policy_arn = aws_iam_policy.LakeFormationGlueTablesAccess.arn
  role       = aws_iam_role.AthenaWorkgroupUserRole.name
}
