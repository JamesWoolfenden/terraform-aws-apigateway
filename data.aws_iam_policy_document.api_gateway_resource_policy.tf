data "aws_iam_policy_document" "api_gateway_resource_policy" {
  statement {
    principals {
      type        = "*"
      identifiers = ["*"]
    }

    effect    = "Allow"
    actions   = ["execute-api:Invoke"]
    resources = ["execute-api:/*/*/*"]

    condition {
      test     = "IpAddress"
      variable = "aws:SourceIp"

      values = var.allowed_range
    }
  }
}
