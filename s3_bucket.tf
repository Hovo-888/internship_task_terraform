//Stexcuma S3 bucket
resource "aws_s3_bucket" "logs_bucket" {
  bucket = var.s3_bucket_vars.bucket_name
}

// Stexcuma S3 logeri confignery
resource "aws_s3_bucket_lifecycle_configuration" "logs_bucket_lifecycle" {
  bucket = aws_s3_bucket.logs_bucket.id

  rule {
    id     = "log"
    status = "Enabled"

    expiration {
      days = 50 //50 oric heto jnje logery
    }
  }
}