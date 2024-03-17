# code for terraform backend state file with state locking  
terraform {
  backend "s3" {
    bucket         = "zoeencloud-tf-state-backend"
    key            = "terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "zoeencloud-tf-state-table"
  }
}

data "aws_region" "current" {}





