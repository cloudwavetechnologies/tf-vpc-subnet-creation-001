terraform {
  backend "s3" {
    bucket = "s3-terraform-state-bucket-000"
    key    = "Infra/simple-network.tfstate"
    region = "us-east-1"
  }
}
