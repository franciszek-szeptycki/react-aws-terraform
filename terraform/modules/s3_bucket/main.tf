resource "aws_s3_bucket" "static_website_bucket" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_website_configuration" "static_website_bucket" {
  bucket = aws_s3_bucket.static_website_bucket.id

  index_document {
    suffix = "index.html"
  }
}
