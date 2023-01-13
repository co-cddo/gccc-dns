data "aws_caller_identity" "current" {}

locals {
  domain         = "gccc.security.gov.uk"

  default_tags   = {
    "Service" : "gccc.security.gov.uk",
    "Reference" : "https://github.com/co-cddo/tbd",
  }

  extra_low_ttl  = 30
  low_ttl        = 30 # 300
  standard_ttl   = 30 # 3600
  long_ttl       = 30 # 86400
}
