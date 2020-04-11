output "cert_id" {
  value       = module.acm-public.cert_id
  description = "The ARN of the certificate"
}

output "cert_arn" {
  value       = module.acm-public.cert_arn
  description = "The ARN of the certificate"
}

output "cert_domain_name" {
  value       = module.acm-public.cert_domain_name
  description = "The domain name for which the certificate is issued"
}

output "cert_domain_validation_options" {
  value       = module.acm-public.cert_domain_validation_options
  description = "A list of attributes to feed into other resources to complete certificate validation. Can have more than one element, e.g. if SANs are defined. Only set if DNS-validation was used."
}

output "cert_validation_emails" {
  value       = module.acm-public.cert_validation_emails
  description = "A list of addresses that received a validation E-Mail. Only set if EMAIL-validation was used."
}

output "cert_resource_record_name" {
  value       = module.acm-public.cert_resource_record_name
  description = "The name of the DNS record to create to validate the certificate"
}

output "cert_resource_record_type" {
  value       = module.acm-public.cert_resource_record_type
  description = "The type of DNS record to create"
}

output "cert_resource_record_value" {
  value       = module.acm-public.cert_resource_record_value
  description = "The value the DNS record"
}
