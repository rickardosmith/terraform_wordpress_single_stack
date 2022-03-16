terraform {
  required_version = ">= 0.12.0"

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
