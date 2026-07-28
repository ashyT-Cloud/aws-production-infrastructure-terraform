terraform {
  backend "s3" {
    bucket         = "ashytcloud-tf-state-487054650859"
    key            = "dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-lock"
    encrypt        = true
  }
}
