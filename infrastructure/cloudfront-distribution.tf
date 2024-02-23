resource "aws_cloudfront_distribution" "live_stream_web_app_cfd" {
  origin {
    domain_name = aws_s3_bucket.live_stream_web_app_bucket.bucket_regional_domain_name
    origin_id   = aws_s3_bucket.live_stream_web_app_bucket.bucket_regional_domain_name
    origin_access_control_id = aws_cloudfront_origin_access_control.live_stream_web_app_cfd_access-control.id
  }

  enabled             = true
  is_ipv6_enabled     = true
  default_root_object = "index.html"



  default_cache_behavior {
    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = aws_s3_bucket.live_stream_web_app_bucket.bucket_regional_domain_name

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
      locations        = []
    }
  }
}


resource "aws_cloudfront_origin_access_control" "live_stream_web_app_cfd_access-control" {
  name                              = aws_s3_bucket.live_stream_web_app_bucket.bucket_regional_domain_name
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}