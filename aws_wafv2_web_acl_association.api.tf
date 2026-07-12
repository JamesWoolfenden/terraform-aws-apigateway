resource "aws_wafv2_web_acl_association" "api" {
  resource_arn = aws_api_gateway_stage.examplea.arn
  web_acl_arn  = aws_wafv2_web_acl.api.arn
}
