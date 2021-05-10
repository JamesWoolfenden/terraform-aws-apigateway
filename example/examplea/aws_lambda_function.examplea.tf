resource "aws_lambda_function" "examplea" {
  # checkov:skip=CKV_AWS_115: JUST A DUMMY
  # checkov:skip=CKV_AWS_116: JUST A DUMMY
  # checkov:skip=CKV_AWS_117: JUST A DUMMY

  function_name = var.function_name
  role          = ""
  handler       = "exports.handler"

  filename = "function.zip"
  tracing_config {
    mode = "PassThrough"
  }

}
