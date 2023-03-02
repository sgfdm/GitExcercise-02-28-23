terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.56.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}  

resource "aws_s3_bucket" "for_each_example" {
    for_each = toset(var.s3_names)
    bucket = "${var.bucket_name}-${each.value}"
     
}

resource "aws_s3_bucket" "count_example"{
    bucket = "${var.bucket_name}-${count.index}"
    count = var.number_of_buckets
}

variable "s3_names"{
    default = ["black", "white"]
}

variable "bucket_name"{
    default = "s3-bucket-example-sathu"
}

variable "number_of_buckets"{
    default = 3
}