# main.tf

module "vpc_east" {
    source          = "./modules/private_network"
    providers       = {
      aws = aws.A
    }
    region          = "us-east-2"
    zone            = "b"
    cidr_block      = "10.2.0.0/16"
}

data "template_file" "user_data"{
  template = "${file("./peer_user_data.tmpl")}"
  vars = {
    hostname = var.regionA
  }
}

module "instance_rdig" {
  source          = "./modules/single_ec2"
  providers       = {
    aws  = aws.A
  }
  name            = "rdig_home" 
  project_domain  = var.project_domain
  public_key      = var.public_key
  role            = aws_iam_role.default_role
  subnet          = module.vpc_east.subnet 
  instance_type   = var.instance_type
  ami_id          = var.ami
  user_data       = data.template_file.user_data
  tcp_ports       = ["80", "22", "443"]
  ebs_size        = 30
}

module "bucket_rdig"{
  source      = "./modules/bucket"
  providers   = {
    aws = aws.A
  }
  bucket_name = "home.rdig.co" 
  role        = aws_iam_role.default_role
}

