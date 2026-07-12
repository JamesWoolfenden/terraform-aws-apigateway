# holden:ignore:HLD_AWS_193 CORS preflight, MOCK-backed with no business logic; api_key_required is not a
# substitute for auth (AWS API keys don't authenticate callers) and would break preflight requests, which
# can't attach an x-api-key header. Real access control lives on messages_method (authorization = var.authorization).
resource "aws_api_gateway_method" "options_method" {
  rest_api_id          = aws_api_gateway_rest_api.api.id
  resource_id          = aws_api_gateway_resource.messages_resource.id
  http_method          = "OPTIONS"
  authorization        = "NONE"
  request_validator_id = aws_api_gateway_request_validator.requests.id
}
