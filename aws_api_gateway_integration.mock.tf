resource "aws_api_gateway_integration" "mock" {
  rest_api_id = aws_api_gateway_rest_api.api.id
  resource_id = aws_api_gateway_resource.messages_resource.id
  http_method = aws_api_gateway_method.options_method.http_method
  type        = "MOCK"
}
