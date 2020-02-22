provider "aws"{
  profile = "default"
  region  = "us-east-1"
}

provider "aws"{
	profile	= "default"
  alias   = "A"
	region	= var.regionA
}

provider "aws"{
	profile	= "default"
	alias	  = "B"
	region  = var.regionB
}

