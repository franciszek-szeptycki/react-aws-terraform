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

