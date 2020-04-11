output "cert_id" {
  value       = aws_acm_certificate.cert.id
  description = "The ARN of the certificate"
}

output "cert_arn" {
  value       = aws_acm_certificate.cert.arn
  description = "The ARN of the certificate"
}

output "cert_domain_name" {
  value       = aws_acm_certificate.cert.domain_name
  description = "The domain name for which the certificate is issued"
}

output "cert_domain_validation_options" {
  value       = aws_acm_certificate.cert.domain_validation_options
  description = "A list of attributes to feed into other resources to complete certificate validation. Can have more than one element, e.g. if SANs are defined. Only set if DNS-validation was used."
}

output "cert_validation_emails" {
  value       = aws_acm_certificate.cert.validation_emails
  description = "A list of addresses that received a validation E-Mail. Only set if EMAIL-validation was used."
}

output "cert_resource_record_name" {
  value       = lookup(aws_acm_certificate.cert.domain_validation_options[0], "resource_record_name", "")
  description = "The name of the DNS record to create to validate the certificate"
}

output "cert_resource_record_type" {
  value       = lookup(aws_acm_certificate.cert.domain_validation_options[0], "resource_record_type", "")
  description = "The type of DNS record to create"
}

output "cert_resource_record_value" {
  value       = lookup(aws_acm_certificate.cert.domain_validation_options[0], "resource_record_value", "")
  description = "The value the DNS record"
}



