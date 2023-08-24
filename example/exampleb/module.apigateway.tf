module "apigateway" {
  source          = "git::https://github.com/JamesWoolfenden/terraform-aws-apigateway.git?ref=87a8ac3b548615d170c9f56cb30e92f11667c85c"
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
