variable "common_tags" {
  description = "This is to help you add tags to your cloud objects"
  type        = map
}

variable "function_name" {
  type = string
}

variable "name" {
  type = string
}

variable "allowed_range" {
  type = list
}

variable "authorization" {
  description = "What Auth to use for the method"
  type        = string
  default     = "AWS_IAM"
}
