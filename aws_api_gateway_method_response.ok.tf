resource "aws_api_gateway_method_response" "ok" {
  rest_api_id = aws_api_gateway_rest_api.api.id
  resource_id = aws_api_gateway_resource.messages_resource.id
  http_method = aws_api_gateway_method.messages_method.http_method
  status_code = "200"

  response_parameters = {
    "method.response.header.Access-Control-Allow-Origin" = "0"
  }
}
