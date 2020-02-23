terraform {
  required_version = ">= 0.12"
  backend	"s3" {
    bucket  = "co.rdig.tf.state.us-east-2"
		key     = "home-state"
		region  = "us-east-2"
  }
}

