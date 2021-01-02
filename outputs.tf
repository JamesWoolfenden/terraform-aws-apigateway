output "url" {
  value = "https://${aws_api_gateway_deployment.stage_api.rest_api_id}.execute-api.${data.aws_region.current.name}.amazonaws.com/${aws_api_gateway_deployment.stage_api.stage_name}"
}

output "api" {
  value = aws_api_gateway_rest_api.api
}
