<a href=https://magnetarconsulting.co.uk><img src="https://magnetarconsulting.co.uk/wp-content/uploads/2020/04/small-helping-you-innovate-magnetar.png" width="300"></a>


# terraform-acm-public-certificate
Terraform (>= 0.12.0) module to request a AWS certificate manager public certificate and create a r53 validation record

[![Build Status](https://dev.azure.com/MagnetarIT/terraform-acm-public-certificate/_apis/build/status/MagnetarIT.terraform-acm-public-certificate?branchName=master)](https://dev.azure.com/MagnetarIT/terraform-acm-public-certificate/_build/latest?definitionId=14&branchName=master) ![Latest Release](https://img.shields.io/github/release/MagnetarIT/terraform-acm-public-certificate.svg)


- [Intro](#Intro)
- [Example](#Example)
- [Inputs](#Inputs)
- [Outputs](#Outputs)
- [Support](#Support)
- [License](#License)

----

## Example
```hcl

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

```

----

## Intro
This module will create the following resources
- AWS Certificate Manager (ACM) public certificate
- r53 CNAME validation record 

---

## Providers

| Name | Version |
|------|---------|
| aws | ~> 2.0 |

---

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| attributes | Additional attributes (e.g. `1`) | `list(string)` | `[]` | no |
| environment | Environment, e.g. 'prod', 'staging', 'dev', 'pre-prod', 'UAT' | `string` | n/a | yes |
| name | Solution name, e.g. 'app' or 'jenkins' | `string` | n/a | yes |
| namespace | Namespace, which could be your team, business name or abbreviation, e.g. 'mag' or 'tar' | `string` | n/a | yes |
| r53\_record\_name | Route53 record name to create e.g. test.example.com | `string` | n/a | yes |
| r53\_zone\_name | A domain name for which the certificate should be issued e.g. example.com | `string` | n/a | yes |
| subject\_alternative\_names | A list of domains that should be SANs in the issued certificate | `list` | `[]` | no |
| tags | Additional tags (e.g. `map('BusinessUnit','XYZ')` | `map(string)` | `{}` | no |
| validation\_method | Which method to use for validation. DNS or EMAIL are valid, NONE can be used for certificates that were imported into ACM and then into Terraform. | `string` | `"DNS"` | no |

---

## Outputs

| Name | Description |
|------|-------------|
| cert\_arn | The ARN of the certificate |
| cert\_domain\_name | The domain name for which the certificate is issued |
| cert\_domain\_validation\_options | A list of attributes to feed into other resources to complete certificate validation. Can have more than one element, e.g. if SANs are defined. Only set if DNS-validation was used. |
| cert\_id | The ARN of the certificate |
| cert\_resource\_record\_name | The name of the DNS record to create to validate the certificate |
| cert\_resource\_record\_type | The type of DNS record to create |
| cert\_resource\_record\_value | The value the DNS record |
| cert\_validation\_emails | A list of addresses that received a validation E-Mail. Only set if EMAIL-validation was used. |

---

## Support

Reach out to me at one of the following places!

- Website at <a href="https://magnetarconsulting.co.uk" target="_blank">`magnetarconsulting.co.uk`</a>
- Twitter at <a href="https://twitter.com/magnetarIT" target="_blank">`@magnetarIT`</a>
- LinkedIn at <a href="https://www.linkedin.com/company/magnetar-it-consulting" target="_blank">`magnetar-it-consulting`</a>

---

## License 

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0) 

See [LICENSE](LICENSE) for full details.

    Licensed to the Apache Software Foundation (ASF) under one
    or more contributor license agreements.  See the NOTICE file
    distributed with this work for additional information
    regarding copyright ownership.  The ASF licenses this file
    to you under the Apache License, Version 2.0 (the
    "License"); you may not use this file except in compliance
    with the License.  You may obtain a copy of the License at

      https://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing,
    software distributed under the License is distributed on an
    "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
    KIND, either express or implied.  See the License for the
    specific language governing permissions and limitations
    under the License.
