
variable "common_tags" {
  description = "This is to help you add tags to your cloud objects"
  type        = map(any)
}

variable "function_name" {
  type = string
}

variable "name" {
  type = string
}

variable "allowed_range" {
  type = list(any)
}
