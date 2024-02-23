resource "aws_s3_bucket" "live_stream_web_app_bucket" {
  bucket = "live-stream-web-app-bucket"

  tags = {
    Name = "live-stream-web-app"
  }
}

resource "aws_s3_bucket_public_access_block" "live_stream_web_app_bucket_public_access" {
  bucket = aws_s3_bucket.live_stream_web_app_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}


resource "aws_s3_bucket_policy" "live_stream_web_app_bucket_policy" {
  bucket = aws_s3_bucket.live_stream_web_app_bucket.id

  policy = <<POLICY
  {
        "Version": "2008-10-17",
        "Id": "PolicyForCloudFrontPrivateContent",
        "Statement": [
            {
                "Sid": "AllowCloudFrontServicePrincipal",
                "Effect": "Allow",
                "Principal": {
                    "Service": "cloudfront.amazonaws.com"
                },
                "Action": "s3:GetObject",
                "Resource": "${aws_s3_bucket.live_stream_web_app_bucket.arn}/*",
                "Condition": {
                    "StringEquals": {
                      "AWS:SourceArn": "${aws_cloudfront_distribution.live_stream_web_app_cfd.arn}"
                    }
                }
            }
        ]
      
}
POLICY

}
