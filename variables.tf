variable "common_tags" {
  description = "This is to help you add tags to your cloud objects"
  type        = map(any)
}

variable "function_name" {
  description = "value"
  type        = string
}

variable "name" {
  description = "value"
  type        = string
}

variable "allowed_range" {
  description = "List of allowed CIDR"
  type        = list(any)
}

variable "authorization" {
  description = "What Auth to use for the method"
  type        = string
  default     = "AWS_IAM"
}
