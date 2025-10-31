terraform {
  backend "s3" {
    bucket = "statefile-bucket-002"
    key    = "Infra/simple-network.tfstate"
    region = "ap-south-1"
  }
}
