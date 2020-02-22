# main.tf

module "vpcA" {
    source          = "./modules/private_network"
    providers       = {
      aws = aws.A
    }
    region          = var.regionA 
    zone            = var.zoneA
    cidr_block      = "10.2.0.0/16"
}

module "vpcB" {
    source          = "./modules/public_network"
    providers       = {
      aws = aws.B
    }
    region          = var.regionB 
    zone            = var.zoneB
    cidr_block      = "10.1.0.0/16"
    public_ip       = true 
}

data "template_file" "user_dataA"{
  template = "${file("./peer_user_data.tmpl")}"
  vars = {
    hostname = var.regionA
  }
}

module "instanceA" {
  source          = "./modules/single_ec2"
  providers       = {
    aws  = aws.A
  }
  name            = module.vpcA.subnet.availability_zone
  project_domain  = var.project_domain
  public_key      = var.public_key
  role            = aws_iam_role.default_role
  subnet          = module.vpcA.subnet 
  instance_type   = var.instance_type_A
  ami_id          = var.ami_A
  user_data       = data.template_file.user_dataA
  tcp_ports       = ["22", "27017"]
  ebs_size        = 30
}

module "bucketA"{
  source      = "./modules/bucket"
  providers   = {
    aws = aws.A
  }
  bucket_name = "newser.rdig.co" 
  role        = aws_iam_role.default_role
}

data "template_file" "user_dataB"{
  template = "${file("./bastion_user_data.tmpl")}"
  vars = {
    hostname      = "bastion"
    peer_role     = "data"
    peer_internal = module.instanceA.private_ip
  }
  depends_on      = [module.instanceA]
}

module "instanceB" {
  source          = "./modules/single_ec2"
  providers       = {
    aws  = aws.B
  }
  name            = module.vpcB.subnet.availability_zone
  project_domain  = var.project_domain
  public_key      = var.public_key
  role            = aws_iam_role.default_role
  subnet          = module.vpcB.subnet 
  ami_id          = var.ami_B
  instance_type   = var.instance_type_B
  user_data       = data.template_file.user_dataB
  tcp_ports       = ["22"]
}

module "peeringA_B"{
  source        = "./modules/peering"
  providers     = {
    A = aws.A
    B = aws.B
  }
  subA      = module.vpcA.subnet
  subB      = module.vpcB.subnet
  
  regionA   = var.regionA
  regionB   = var.regionB
} 

