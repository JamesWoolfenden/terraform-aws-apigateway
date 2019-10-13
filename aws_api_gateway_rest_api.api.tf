resource "aws_api_gateway_rest_api" "api" {
  name = var.name

  policy = data.aws_iam_policy_document.api_gateway_resource_policy.json

  endpoint_configuration {
    types = ["REGIONAL"]
  }
}
