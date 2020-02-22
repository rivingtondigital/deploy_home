terraform {
  required_version = ">= 0.12"
  backend	"s3" {
    bucket  = "co.rdig.tf.state"
		key     = "peering-state"
		region  = "us-west-2"
  }
}

