# 1. Provider Configuration
provider "aws" {
  region = "ap-southeast-1"
}

terraform {
  backend "s3" {
    bucket         = "sctp-ce12-tfstate-bucket"
    key            = "state/terraform.tfstate"
    region         = "ap-southeast-1"
    encrypt        = true
    # dynamodb_table = "terraform-lock" # Optional: For state locking
  }
}

# 3. S3 Bucket Resource
resource "aws_s3_bucket" "my_bucket" {
  bucket = "ee-s3-bucket-3-1" # Ensure this is globally unique

  tags = {
    Name        = "EE S3 Bucket"
  }
}