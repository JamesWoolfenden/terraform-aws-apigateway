resource "aws_api_gateway_usage_plan" "api" {
  name = var.name

  api_stages {
    api_id = aws_api_gateway_rest_api.api.id
    stage  = aws_api_gateway_deployment.stage_api.stage_name
  }
}
