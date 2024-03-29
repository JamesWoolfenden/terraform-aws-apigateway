resource "aws_lambda_function" "examplea" {
  # checkov:skip=CKV_AWS_115: JUST A DUMMY
  # checkov:skip=CKV_AWS_116: JUST A DUMMY
  # checkov:skip=CKV_AWS_117: JUST A DUMMY
  # checkov:skip=CKV_AWS_272: EXAMPLE ONLY

  function_name = var.function_name
  role          = ""
  handler       = "exports.handler"
  runtime       = "nodejs14.x"

  filename = "function.zip"
  tracing_config {
    mode = "PassThrough"
  }

}
