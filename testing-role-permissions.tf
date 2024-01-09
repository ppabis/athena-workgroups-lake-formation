data "aws_iam_policy_document" "AthenaWorkgroupPermissions" {
  statement {
    // Prevent user from creating or editing workgroups
    effect = "Deny"
    actions = [
      "athena:DeleteWorkGroup",
      "athena:UpdateWorkGroup",
      "athena:CreateWorkGroup"
    ]
    resources = ["*"]
  }

  statement {
    effect = "Allow"
    actions = [
      "athena:ListEngineVersions",
      "athena:ListWorkGroups",
      "athena:ListDataCatalogs",
      "athena:ListDatabases",
      "athena:ListTableMetadata",
      "athena:GetTableMetadata"
    ]
    resources = ["*"]
  }

  statement {
    effect = "Allow"
    actions = [
      "athena:GetWorkGroup",
      "athena:GetQueryResults",
      "athena:GetNamedQuery",
      "athena:GetQueryExecution",
      "athena:GetPreparedStatement",
      "athena:GetQueryResultsStream",
      "athena:BatchGetNamedQuery",
      "athena:BatchGetQueryExecution",
      "athena:ListQueryExecutions",
      "athena:ListNamedQueries",
      "athena:ListPreparedStatements",
      "athena:StartQueryExecution",
      "athena:StopQueryExecution",
      "athena:CreateNamedQuery",
      "athena:DeleteNamedQuery",
      "athena:CreatePreparedStatement",
      "athena:DeletePreparedStatement",
      "athena:UpdatePreparedStatement"
    ]
    resources = [
      aws_athena_workgroup.limited-wg.arn
    ]
  }

  statement {
    effect    = "Allow"
    actions   = ["glue:*"]
    resources = ["*"]
  }

  statement {
    effect = "Allow"
    actions = [
      "s3:GetBucketLocation",
      "s3:ListBucket",
      "s3:ListBucketMultipartUploads",
      "s3:ListBucketVersions",
    ]
    resources = [
      aws_s3_bucket.athena.arn,
      aws_s3_bucket.data-source.arn
    ]
  }

  statement {
    effect = "Allow"
    actions = [
      "s3:GetObject",
      "s3:ListMultipartUploadParts",
      "s3:AbortMultipartUpload",
      "s3:PutObject",
      "s3:DeleteObject"
    ]
    resources = ["${aws_s3_bucket.athena.arn}/limited-wg/*"]
  }
}

resource "aws_iam_policy" "AthenaWorkgroupPermissions" {
  name        = "AthenaWorkgroupPermissions"
  description = "Permissions limiting access to single Athena workgroup"
  policy      = data.aws_iam_policy_document.AthenaWorkgroupPermissions.json
}
