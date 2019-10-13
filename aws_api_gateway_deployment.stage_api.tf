resource "aws_api_gateway_deployment" "stage_api" {
  depends_on = [
    "aws_api_gateway_method.messages_method",
    "aws_api_gateway_integration.messages_integration",
  ]

  rest_api_id = aws_api_gateway_rest_api.api.id
  stage_name  = "api"
}
