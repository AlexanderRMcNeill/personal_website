terraform {
  backend "s3" {
    bucket         = "150089068054-ap-southeast-2-terraform-backend"
    key            = "cv_website/terraform.tfstate"
    region         = "ap-southeast-2"
    dynamodb_table = "TerraformLockTable"
  }
}

provider "aws" {
  version             = "~> 1.17.0"
  allowed_account_ids = ["150089068054"]
  region              = "ap-southeast-2"
}
