variable "s3_bucket_domain_name" {
  description = "The domain name of the S3 bucket"
}

variable "acm_certificate_arn" {
  description = "The ARN of the ACM certificate for SSL/TLS"
}

variable "logging_bucket" {
  description = "The S3 bucket to store CloudFront logs"
}
