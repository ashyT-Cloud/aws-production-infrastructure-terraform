provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Project     = "Aws-Production-Infrastructure"
      Environment = var.environment
      ManagedBy   = "Terraform"
      Owner       = "Ashish"
    }
  }
}
