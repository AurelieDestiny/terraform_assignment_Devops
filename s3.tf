provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "Devbucket" {
  bucket = "dev-20220225"
  tags = {
    Descriptioin = "Dev projects"  }
}

resource "aws_s3_bucket_object" "aws-txt" {
  bucket = "aws_s3_bucket.Devbucket.id"
  key    = "aws.txt"
 
} 