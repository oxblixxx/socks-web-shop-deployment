terraform {
  backend "s3" {
    bucket = "slave-pipeline"
    region = "us-east-2"
    key = "slave-pipeline"
  }
}