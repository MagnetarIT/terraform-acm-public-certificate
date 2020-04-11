provider "aws" {
  region = "eu-west-2"
}

module "acm-public" {
  source          = "../"
  namespace       = "mag"
  environment     = "test"
  name            = "app"
  attributes      = ["alb"]
  r53_zone_name   = "magnetar.it"
  r53_record_name = "dev.magnetar.it"
}
