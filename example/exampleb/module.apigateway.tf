# holden:ignore:HLD_TF_073
# holden:ignore:HLD_TF_026
module "apigateway" {
  source          = "../../"
  allowed_range   = var.allowed_range
  lambda_function = aws_lambda_function.examplea
  name            = var.name
  kms_key_id      = aws_kms_key.apigateway.arn
}

data "aws_caller_identity" "current" {}

resource "aws_kms_key" "apigateway" {
  #checkov:skip=CKV2_AWS_64: For example only
  enable_key_rotation     = true
  deletion_window_in_days = 7

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "Allow administration of the key"
        Effect = "Allow"
        Principal = {
          AWS = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
        }
        Action   = "kms:*"
        Resource = "*"
      }
    ]
  })

  lifecycle {
    prevent_destroy = true
  }
}
