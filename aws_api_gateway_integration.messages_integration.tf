resource "aws_api_gateway_integration" "messages_integration" {
  rest_api_id             = aws_api_gateway_rest_api.api.id
  resource_id             = aws_api_gateway_resource.messages_resource.id
  http_method             = aws_api_gateway_method.messages_method.http_method
  type                    = "AWS"
  uri                     = data.aws_lambda_function.lambda.invoke_arn
  integration_http_method = "POST"

  request_templates = {
    "application/json" = ""
  }
}
