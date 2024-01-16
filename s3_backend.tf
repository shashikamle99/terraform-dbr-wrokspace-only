terraform {
  backend "s3" {
    bucket = "dbr-s3-bucket"
    key    = "dbr-dev-ws-terra"
    region = "us-east-1"
  }
}