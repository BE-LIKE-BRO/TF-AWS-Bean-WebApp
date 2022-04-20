terraform {
  backend "s3" {
    bucket = "tf-state-belikebro"
    key    = "terraform/backend"
    region = "us-east-2"
  }
}