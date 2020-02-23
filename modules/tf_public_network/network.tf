# network.tf

resource "aws_vpc" "main"{
	cidr_block						= var.cidr_block 
	enable_dns_hostnames	= true
}	

resource "aws_subnet" "public"{
	vpc_id						      = aws_vpc.main.id
	cidr_block				      = cidrsubnet(var.cidr_block, 8, 0) 
	availability_zone	      = "${var.region}${var.zone}"
  map_public_ip_on_launch = var.public_ip
}

resource "aws_internet_gateway" "public_gw"{
	vpc_id		= aws_vpc.main.id
}

resource	"aws_route" "public_access"{
	route_table_id					= aws_vpc.main.main_route_table_id
	destination_cidr_block	= "0.0.0.0/0"
	gateway_id							= aws_internet_gateway.public_gw.id
}

output "vpc_id"{
  value = aws_vpc.main.id
}

output "subnet"{
  value = aws_subnet.public
}

