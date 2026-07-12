resource "aws_cloudwatch_log_group" "waf" {
  name              = "aws-waf-logs-${var.name}"
  retention_in_days = var.retention
  kms_key_id        = var.kms_key_id
}
