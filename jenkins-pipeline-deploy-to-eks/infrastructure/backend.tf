terraform {
  backend "s3" {
    bucket = "new-state-file-west-2-516"
    key    = "infrastructure"
   region = "us-west-2"
  }
}


