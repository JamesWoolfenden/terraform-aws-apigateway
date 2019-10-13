resource "aws_api_gateway_integration_response" "messages_response" {
  http_method = aws_api_gateway_method.messages_method.http_method
  resource_id = aws_api_gateway_resource.messages_resource.id
  rest_api_id = aws_api_gateway_rest_api.api.id
  status_code = aws_api_gateway_method_response.ok.status_code

  response_parameters = {
    "method.response.header.Access-Control-Allow-Origin" = "'*'"
  }
}
