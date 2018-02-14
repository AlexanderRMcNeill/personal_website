resource "aws_acm_certificate" "cv_website" {
  domain_name = "alexandermcneill.com"
  validation_method = "DNS"
}

resource "aws_route53_record" "cv_website_cert_validation" {
  name = "${aws_acm_certificate.cv_website.domain_validation_options.0.resource_record_name}"
  type = "${aws_acm_certificate.cv_website.domain_validation_options.0.resource_record_type}"
  zone_id = "${data.aws_route53_zone.alexandermcneill_com.id}"
  records = ["${aws_acm_certificate.cv_website.domain_validation_options.0.resource_record_value}"]
  ttl = 300
}

resource "aws_acm_certificate_validation" "cv_website_cert_validation" {
  certificate_arn = "${aws_acm_certificate.cv_website.arn}"
  validation_record_fqdns = ["${aws_route53_record.cv_website_cert_validation.fqdn}"]
}