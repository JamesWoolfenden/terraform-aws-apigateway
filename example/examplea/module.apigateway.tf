module "apigateway" {
  source          = "../../"
  allowed_range   = var.allowed_range
  common_tags     = var.common_tags
  lambda_function = aws_lambda_function.examplea
  name            = var.name
  kms_key_id      = aws_kms_key.example.arn
}


resource "aws_kms_key" "example" {
  enable_key_rotation = true
}
