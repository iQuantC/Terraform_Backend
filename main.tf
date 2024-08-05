# Amazon EC2 Instance Resource 

resource "aws_instance" "terra_ec2" {
  ami                    = var.AMI
  instance_type          = var.TYPE
  key_name               = var.KEY
  vpc_security_group_ids = ["sg-040c1fca5fe860748"]
  tags = {
    "Name"        = "Terra EC2"
    "Environment" = "Dev"
  }
}

# Amason s3 bucket for backend
resource "aws_s3_bucket" "iquant_s3" {
  bucket = "my-iquant-test-bucket"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

# Versioning S3 bucket
resource "aws_s3_bucket_versioning" "iquant_versioning" {
  bucket = aws_s3_bucket.iquant_s3.id
  versioning_configuration {
    status = "Enabled"
  }
}

# s3 bucket encryption
resource "aws_s3_bucket_server_side_encryption_configuration" "iquant_encryption" {
  bucket = aws_s3_bucket.iquant_s3.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "AES256"
    }
  }
}