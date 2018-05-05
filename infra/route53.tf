data "aws_route53_zone" "hosted_zone" {
  name         = "alexandermcneill.com."
  private_zone = false
}

resource "aws_route53_record" "apex" {
  zone_id = "${data.aws_route53_zone.hosted_zone.zone_id}"
  name    = "alexandermcneill.com"
  type    = "A"
  ttl     = "300"

  records = [
    "185.199.108.153",
    "185.199.109.153",
    "185.199.110.153",
    "185.199.111.153",
  ]
}

resource "aws_route53_record" "www" {
  zone_id = "${data.aws_route53_zone.hosted_zone.zone_id}"
  name    = "www.alexandermcneill.com"
  type    = "A"

  alias {
    name                   = "${aws_s3_bucket.redirection.website_domain}"
    zone_id                = "${aws_s3_bucket.redirection.hosted_zone_id}"
    evaluate_target_health = false
  }
}
