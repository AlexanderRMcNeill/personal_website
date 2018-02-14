terraform {
    backend "s3" {
        bucket = "150089068054-ap-southeast-2-terraform-backend"
        key    = "cv_website/terraform.tfstate"
        region = "ap-southeast-2"
        dynamodb_table = "TerraformLockTable"
    }
}

provider "aws" {
    region = "us-east-1"
}

data "aws_route53_zone" "alexandermcneill_com" {
  name         = "alexandermcneill.com."
  private_zone = false
}
