module "website" {
    source  = "AlexanderRMcNeill/secured-static-website/aws"
    version = "1.0.0"

    bucket_name = "150089068054-us-east-1-cv-website"

    hosted_zone_id = "${data.aws_route53_zone.alexandermcneill_com.id}"
    domain_names   = [
        "alexandermcneill.com"
    ]

    acm_certificate_arn = "${aws_acm_certificate_validation.cv_website_cert_validation.certificate_arn}"

    custom_error_response_objects = [
        {
            error_code = "404"
            error_caching_min_ttl = 0
            response_code = "200"
            response_page_path = "/index.html"
        }
    ]
}