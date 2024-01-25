provider "aws" {
  region = "us-east-1"
}

data "aws_caller_identity" "current" {}


terraform {
  
  required_providers {
    http = {
      source  = "hashicorp/http"
      version = "3.4.0"
    }
  }
}
