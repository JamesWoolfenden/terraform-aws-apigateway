resource "aws_api_gateway_request_validator" "requests" {
  name                        = var.validator.name
  rest_api_id                 = aws_api_gateway_rest_api.api.id
  validate_request_body       = var.validator.validate_request_body
  validate_request_parameters = var.validator.validate_request_parameters
}
