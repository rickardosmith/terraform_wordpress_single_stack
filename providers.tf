terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = ">= 3.0.0"
  }
}

provider "aws" {
  alias  = "us"
  region = "us-east-1"
}

provider "aws" {
  alias  = "ca"
  region = "ca-central-1"
}
