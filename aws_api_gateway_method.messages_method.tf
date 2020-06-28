resource "aws_api_gateway_method" "messages_method" {
  rest_api_id   = aws_api_gateway_rest_api.api.id
  resource_id   = aws_api_gateway_resource.messages_resource.id
  http_method   = "POST"
  authorization = var.authorization

  request_models = {
    "application/json" = "Empty"
  }
}
