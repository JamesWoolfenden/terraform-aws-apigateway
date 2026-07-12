
variable "lambda_function" {
  description = "The Lambda function invoked by API Gateway (e.g. aws_lambda_function.this)."
  type = object({
    arn        = string
    invoke_arn = string
  })

  validation {
    condition     = length(trimspace(var.lambda_function.arn)) > 0 && length(trimspace(var.lambda_function.invoke_arn)) > 0
    error_message = "lambda_function.arn and lambda_function.invoke_arn must be non-empty strings."
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
  description = "List of allowed CIDR"
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

variable "authorization" {
  description = "What Auth to use for the method"
  type        = string
  default     = "AWS_IAM"

  validation {
    condition     = contains(["AWS_IAM", "NONE", "CUSTOM"], var.authorization)
    error_message = "authorization must be one of AWS_IAM, NONE, or CUSTOM."
  }
}

variable "kms_key_id" {
  description = "The arn of the KMS key used to encrypt the API Gateway execution log group."
  type        = string
  sensitive   = true

  validation {
    condition     = length(trim(var.kms_key_id, " ")) > 0
    error_message = "kms_key_id must be a non-empty KMS key ARN."
  }
}

variable "retention" {
  description = "The number of days to retain API Gateway execution logs."
  type        = number
  default     = 365

  validation {
    condition     = var.retention > 0
    error_message = "retention must be a positive number of days."
  }
}

variable "validator" {
  description = "Configuration for the API Gateway request validator (name and which parts of a request it validates)."
  type = object({
    name                        = string
    validate_request_body       = bool
    validate_request_parameters = bool
  })
  default = {
    name                        = "requests"
    validate_request_body       = true
    validate_request_parameters = true
  }

  validation {
    condition     = length(trimspace(var.validator.name)) > 0
    error_message = "validator.name must be a non-empty string."
  }
}

variable "throttle" {
  description = "Throttle settings applied to the API Gateway usage plan (requests per second)."
  type = object({
    burst_limit = number
    rate_limit  = number
  })
  default = {
    burst_limit = 100
    rate_limit  = 50
  }

  validation {
    condition     = var.throttle.burst_limit > 0 && var.throttle.rate_limit > 0
    error_message = "throttle.burst_limit and throttle.rate_limit must be positive numbers."
  }
}

variable "stage_name" {
  description = "The name of the API Gateway stage."
  type        = string
  default     = "test"

  validation {
    condition     = length(var.stage_name) > 0
    error_message = "The stage_name variable must not be empty."
  }
}
