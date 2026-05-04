resource "aws_lambda_function" "examplea" {
  # checkov:skip=CKV_AWS_289: X-Ray tracing not required for this Lambda
  # checkov:skip=CKV_AWS_288: Reserved concurrency not configured for this Lambda
  # checkov:skip=CKV_AWS_284: Log group retention managed separately
  # checkov:skip=CKV_AWS_286: Log group encryption managed separately
  # checkov:skip=CKV_AWS_115: JUST A DUMMY
  # checkov:skip=CKV_AWS_116: JUST A DUMMY
  # checkov:skip=CKV_AWS_117: JUST A DUMMY
  # checkov:skip=CKV_AWS_272: EXAMPLE ONLY

  function_name = var.function_name
  role          = ""
  handler       = "exports.handler"
  runtime       = "nodejs20.x"

  filename = "function.zip"
  tracing_config {
    mode = "PassThrough"
  }

}
