module "apigateway" {
  source        = "../../"
  allowed_range = var.allowed_range
  common_tags   = var.common_tags
  function_name = var.function_name
  name          = var.name
}
