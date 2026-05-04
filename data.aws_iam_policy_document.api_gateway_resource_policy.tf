data "aws_iam_policy_document" "api_gateway_resource_policy" {
  # checkov:skip=CKV_AWS_290: IAM policy requires broad write access for this module to function
  # checkov:skip=CKV_AWS_355: IAM policy requires wildcard resource for this module to function
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
