resource "aws_api_gateway_integration_response" "proxy_integration_response" {

  http_method = aws_api_gateway_method.options_method.http_method
  resource_id = aws_api_gateway_resource.messages_resource.id
  rest_api_id = aws_api_gateway_rest_api.api.id
  status_code = "200"

  response_parameters = {
    "method.response.header.Access-Control-Allow-Headers" = "'Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,X-Requested-With, Origin, Accept, Client-Security-Token,Accept-Encoding, Access-Control-Allow-Origin,X-Csrf-Token,Access-Control-Allow-Headers,Access-Control-Allow-Methods,Gateway-Url'"
    "method.response.header.Access-Control-Allow-Methods" = "'GET,OPTIONS,POST,PUT'"
  }

  depends_on = [
    aws_api_gateway_integration.messages_integration,
  ]


}
