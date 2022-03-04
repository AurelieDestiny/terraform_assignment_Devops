provider "aws" {
  region = "us-east-1"
}


resource "aws_s3_bucket" "devzbucketz" {
  bucket = "dev-20220225"
  tags = {
    Descriptioin = "Dev projects"  }
}

resource "aws_s3_object" "awsdocs" {
  source = "D:/TERRAFORM/Terraform aws_s3/aws.txt"
  bucket = "dev-20220225"
  key    = "aws.txt"
  
}

