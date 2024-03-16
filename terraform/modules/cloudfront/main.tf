# modules/cloudfront/main.tf

resource "aws_cloudfront_distribution" "my_distribution" {
  origin {
    domain_name = var.s3_bucket_domain_name
    origin_id   = "S3Origin"
  }

  default_cache_behavior {
    target_origin_id = "S3Origin"

    viewer_protocol_policy = "redirect-to-https"
    allowed_methods        = ["GET", "HEAD", "OPTIONS"]
    cached_methods         = ["GET", "HEAD", "OPTIONS"]

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }

    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  enabled             = true
  is_ipv6_enabled     = true
  price_class         = "PriceClass_100"

  # Add more configuration as needed

  # Viewer Certificate Configuration
  viewer_certificate {
    acm_certificate_arn      = var.acm_certificate_arn
    ssl_support_method       = "sni-only"
    minimum_protocol_version = "TLSv1.2_2019"
  }

  # Logging Configuration
  logging_config {
    bucket         = var.logging_bucket
    include_cookies = false
    prefix         = "cloudfront/"
  }

  # Restrictions
  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }
}
