module "naming" {
  source      = "git::https://github.com/MagnetarIT/terraform-naming-standard.git?ref=tags/0.1.0"
  namespace   = var.namespace
  environment = var.environment
  name        = var.name
  attributes  = var.attributes
  tags        = var.tags
}

resource "aws_acm_certificate" "cert" {
  domain_name               = var.r53_record_name
  subject_alternative_names = var.subject_alternative_names
  validation_method         = var.validation_method
  tags                      = module.naming.tags

  lifecycle {
    create_before_destroy = true
  }
}

data "aws_route53_zone" "selected" {
  name = var.r53_zone_name
}

resource "aws_route53_record" "cname_record" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = lookup(aws_acm_certificate.cert.domain_validation_options[0], "resource_record_name", "")
  type    = "CNAME"
  ttl     = "5"
  records = [lookup(aws_acm_certificate.cert.domain_validation_options[0], "resource_record_value", "")]

  lifecycle {
    create_before_destroy = true
  }
}
