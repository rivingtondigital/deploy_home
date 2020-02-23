# main.tf

module "vpc_east" {
    source          = "./modules/tf_public_network"
    region          = "us-east-2"
    zone            = "b"
    cidr_block      = "10.2.0.0/16"
    public_ip       = true
}

data "template_file" "user_data"{
  template = "${file("./home_deploy_user_data.tmpl")}"
  vars = {
    hostname = var.project_domain
  }
}

module "ubuntu_ami"{
  source    = "./modules/tf_find_ubuntu_ami"

}

module "instance_rdig" {
  source          = "./modules/tf_single_instance"
  name            = "rdig_home" 
  project_domain  = var.project_domain
  public_key      = var.public_key
  role            = aws_iam_role.default_role
  subnet          = module.vpc_east.subnet 
  instance_type   = var.instance_type
  ami_id          = module.ubuntu_ami.ami_id 
  user_data       = data.template_file.user_data
  tcp_ports       = ["80", "22", "443"]
  ebs_size        = 30
}

module "bucket_rdig"{
  source      = "./modules/tf_buckets"
  bucket_name = "bucket.${var.project_domain}" 
  role        = aws_iam_role.default_role
}

output "instance_ip"{
  value = module.instance_rdig.public_ip
}

