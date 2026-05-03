module "apigateway" {
  source          = "JamesWoolfenden/apigateway/aws"
  version         = "0.1.65"
  allowed_range   = var.allowed_range
  common_tags     = var.common_tags
  lambda_function = aws_lambda_function.examplea
  name            = var.name
  kms_key_id      = aws_kms_key.example.arn
}

resource "aws_kms_key" "example" {
  #checkov:skip=CKV2_AWS_64: For example only
  enable_key_rotation = true
}
