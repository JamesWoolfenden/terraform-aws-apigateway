resource "aws_api_gateway_usage_plan_key" "main" {
  key_id        = aws_api_gateway_api_key.apikey.id
  key_type      = "API_KEY"
  usage_plan_id = aws_api_gateway_usage_plan.api.id
}
