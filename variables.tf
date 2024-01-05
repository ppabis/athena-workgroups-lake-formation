variable "source_bucket" {
  type        = string
  description = "Bucket where the source data is stored"
  validation {
    error_message = "Bucket name must be alphanumeric with dashes"
    condition     = can(regex("^[a-zA-Z0-9][a-zA-Z0-9-]+$", var.source_bucket))
  }
}

variable "athena_results_bucket" {
  type        = string
  description = "Bucket where Athena will store query results of the workgroup"
  validation {
    error_message = "Bucket name must be alphanumeric with dashes"
    condition     = can(regex("^[a-zA-Z0-9][a-zA-Z0-9-]+$", var.athena_results_bucket))
  }
}
