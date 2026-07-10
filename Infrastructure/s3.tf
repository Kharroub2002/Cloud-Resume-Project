# 1. Random String
resource "random_string" "suffix" {
  length  = 6
  special = false
  upper   = false
}

# 2. Create Bucket
resource "aws_s3_bucket" "website_bucket" {
  bucket = "mohammad-resume-bucket-${random_string.suffix.result}"
}

# 3. Turn on S3 Website Hosting
resource "aws_s3_bucket_website_configuration" "website_config" {
  bucket = aws_s3_bucket.website_bucket.id

  index_document {
    suffix = "index.html"
  }
}

# 4. Turn OFF the Public Access Block (Because we WANT the public to see the website now)
resource "aws_s3_bucket_public_access_block" "website_bucket" {
  bucket = aws_s3_bucket.website_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# 5. Create a Policy that allows anyone on the internet to read the files
resource "aws_s3_bucket_policy" "public_read" {
  bucket = aws_s3_bucket.website_bucket.id
  
  # We use depends_on to make sure Terraform turns off the block BEFORE trying to attach the policy
  depends_on = [aws_s3_bucket_public_access_block.website_bucket]

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.website_bucket.arn}/*"
      },
    ]
  })
}