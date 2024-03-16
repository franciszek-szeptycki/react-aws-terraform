terraform {
  backend "s3" {
    bucket = "terraform-bucket-franeksz"
    key    = "terraform.tfstate"
    region = "eu-central-1"
  }
}

resource "aws_s3_bucket" "terraform-bucket" {
  bucket = "terraform-bucket-franeksz"
}

resource "aws_s3_bucket_versioning" "versioning-terraform-bucket" {
  bucket = aws_s3_bucket.terraform-bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

######################
#  S3 Bucket Module  #
######################

module "static_website" {
  source      = "./modules/s3_bucket"
  bucket_name = "static-website-franeksz"
}

# #######################
# #  CloudFront Module  #
# #######################

# module "cloudfront" {
#   source = "./modules/cloudfront"

#   s3_bucket_domain_name = "static-website-franeksz.s3-website.eu-central-1.amazonaws.com"
#   acm_certificate_arn  = "arn:aws:acm:us-west-2:123456789012:certificate/abcd1234-abcd-1234-abcd-1234abcd1234"
#   logging_bucket       = "aws-cloudtrail-logs-471112538384-7512a7cd"
# }
