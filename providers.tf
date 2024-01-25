# AWS provider
provider "aws" {
  region = "us-east-1"
}

data "aws_caller_identity" "current" {}

// http providery ogtagorcumenq nra hamar vor SSH anenq mer IP ic vor mer IP dynamic vercni
terraform {
  # http provider
  required_providers {
    http = {
      source  = "hashicorp/http"
      version = "3.4.0"
    }
  }
}