resource "aws_api_gateway_method" "options_method" {
  rest_api_id          = aws_api_gateway_rest_api.api.id
  resource_id          = aws_api_gateway_resource.messages_resource.id
  http_method          = "OPTIONS"
  authorization        = "NONE"
  request_validator_id = aws_api_gateway_request_validator.example.id
}
