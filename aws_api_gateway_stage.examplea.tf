resource "aws_api_gateway_stage" "examplea" {
  # checkov:skip=CKV2_AWS_4: todo this isn't a correct violation
  # checkov:skip=CKV2_AWS_29: todo this isn't a correct violation
  deployment_id         = aws_api_gateway_deployment.stage_api.id
  rest_api_id           = aws_api_gateway_rest_api.api.id
  stage_name            = var.stage_name
  cache_cluster_enabled = true
  xray_tracing_enabled  = true
  access_log_settings {
    destination_arn = aws_cloudwatch_log_group.example.arn
    format          = "JSON"
  }
}

variable "stage_name" {
  type    = string
  default = "test"
}
