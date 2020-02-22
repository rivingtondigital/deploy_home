terraform {
  required_version = ">= 0.12"
  backend	"s3" {
    bucket  = "co.rdig.tf.state"
		key     = "home-state"
		region  = "us-east-2"
  }
}

