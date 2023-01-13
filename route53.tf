resource "aws_route53_zone" "gccc" {
  name = local.domain

  tags = merge(local.default_tags, {
    "Name" : local.domain,
    "Environment" : "prod"
  })

  lifecycle {
    ignore_changes = [tags]
  }
}

resource "aws_route53_record" "gccc-txt" {
  zone_id = aws_route53_zone.gccc.zone_id
  name    = "."
  type    = "TXT"
  ttl     = local.extra_low_ttl

  records = [
    "v=spf1 mx include:mail.zendesk.com include:amazonses.com -all"
  ]
}

resource "aws_route53_record" "gccc-no-reply-mx" {
  zone_id = aws_route53_zone.gccc.zone_id
  name    = "no-reply"
  type    = "MX"
  ttl     = local.extra_low_ttl

  records = [
    "10 feedback-smtp.eu-west-1.amazonses.com"
  ]
}

resource "aws_route53_record" "gccc-no-reply-txt" {
  zone_id = aws_route53_zone.gccc.zone_id
  name    = "no-reply"
  type    = "TXT"
  ttl     = local.extra_low_ttl

  records = [
    "v=spf1 include:amazonses.com -all"
  ]
}
