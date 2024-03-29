resource "aws_cloudwatch_log_group" "example" {
  name              = "API-Gateway-Execution-Logs_${aws_api_gateway_rest_api.api.id}/${var.stage_name}"
  retention_in_days = var.retention
  kms_key_id        = var.kms_key_id
}
variable "retention" {
  type    = number
  default = 365
}
