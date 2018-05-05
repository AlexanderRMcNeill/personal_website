resource "aws_s3_bucket" "redirection" {
  bucket = "www.alexandermcneill.com"
  acl    = "private"

  website {
    redirect_all_requests_to = "https://alexandermcneill.com"
  }
}
