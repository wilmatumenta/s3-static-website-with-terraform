# create an s3 bucket
resource "aws_s3_bucket" "mybucket" {
  bucket = var.bucketname

  tags = {
    Name        = "My bucket"
    Environment = var.environment
  }
}
## specifying the owner of the bucket

resource "aws_s3_bucket_ownership_controls" "ownership-controls" {
  bucket = aws_s3_bucket.mybucket.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}
## making the bucket public
resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.mybucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

## making the acl public
resource "aws_s3_bucket_acl" "mybucket-acl" {
  depends_on = [aws_s3_bucket_ownership_controls.ownership-controls]

  bucket = aws_s3_bucket.mybucket.id
  acl    = "public-read"
}

## too add the index file to s3
resource "aws_s3_object" "object" {
    bucket = aws_s3_bucket.mybucket.id
    key = "index.html"
    source = "index.html"
    acl    = "public-read"
    content_type = "text/html"
  
}
# uploading the picture to the bucket

resource "aws_s3_object" "picture" {
    bucket = aws_s3_bucket.mybucket.id
    key = "pic1.png"
    source = "pic1.png"
    acl    = "public-read"
    content_type = "text/html"
  
}

##website configuration
resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.mybucket.id

  index_document {
    suffix = "index.html"
  }

  depends_on = [ aws_s3_bucket_acl.mybucket-acl ]
}
