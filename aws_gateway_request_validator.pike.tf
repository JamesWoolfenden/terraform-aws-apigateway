resource "aws_api_gateway_request_validator" "example" {
  name                        = var.validator.name
  rest_api_id                 = aws_api_gateway_rest_api.api.id
  validate_request_body       = var.validator.validate_request_body
  validate_request_parameters = var.validator.validate_request_parameters
}
variable "validator" {
  type = object({
    name                        = string
    validate_request_body       = bool
    validate_request_parameters = bool
  })
  default = {
    name                        = "example"
    validate_request_body       = true
    validate_request_parameters = true
  }
}
