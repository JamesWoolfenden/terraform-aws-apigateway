
variable "function_name" {
  description = "The name to give the example Lambda function."
  type        = string

  validation {
    condition     = length(trimspace(var.function_name)) > 0
    error_message = "function_name must be a non-empty string."
  }
}

variable "name" {
  description = "The name to give the API Gateway REST API, API key, and usage plan."
  type        = string

  validation {
    condition     = length(trimspace(var.name)) > 0
    error_message = "name must be a non-empty string."
  }
}

variable "allowed_range" {
  description = "List of CIDR ranges allowed to invoke the API."
  type        = list(string)

  validation {
    condition     = alltrue([for cidr in var.allowed_range : cidr != ""])
    error_message = "allowed_range must be a list of non-empty CIDR strings."
  }

  validation {
    condition     = alltrue([for cidr in var.allowed_range : !contains(["0.0.0.0/0", "::/0"], cidr)])
    error_message = "allowed_range must not include 0.0.0.0/0 or ::/0."
  }
}
