variable "namespace" {
  type        = string
  description = "Namespace, which could be your team, business name or abbreviation, e.g. 'mag' or 'tar'"
}

variable "environment" {
  type        = string
  description = "Environment, e.g. 'prod', 'staging', 'dev', 'pre-prod', 'UAT'"
}

variable "name" {
  type        = string
  description = "Solution name, e.g. 'app' or 'jenkins'"
}

variable "attributes" {
  type        = list(string)
  default     = []
  description = "Additional attributes (e.g. `1`)"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags (e.g. `map('BusinessUnit','XYZ')`"
}

variable "r53_zone_name" {
  type        = string
  description = "A domain name for which the certificate should be issued e.g. example.com"
}

variable "r53_record_name" {
  type        = string
  description = "Route53 record name to create e.g. test.example.com"
}

variable "subject_alternative_names" {
  type        = list
  default     = []
  description = "A list of domains that should be SANs in the issued certificate"
}

variable "validation_method" {
  type        = string
  default     = "DNS"
  description = "Which method to use for validation. DNS or EMAIL are valid, NONE can be used for certificates that were imported into ACM and then into Terraform."
}


