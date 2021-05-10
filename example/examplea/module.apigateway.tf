module "apigateway" {
  source          = "../../"
  allowed_range   = var.allowed_range
  common_tags     = var.common_tags
  lambda_function = aws_lambda_function.examplea
  name            = var.name
}
