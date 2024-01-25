provider "aws" {
  region = "us-east-1"
}

data "aws_caller_identity" "current" {}


terraform {
  # http provider
  required_providers {
    http = {
      source  = "hashicorp/http"
      version = "3.4.0"
    }
  }
}
