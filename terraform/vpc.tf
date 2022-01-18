resource "aws_vpc" "Democrance" {
  cidr_block 		= "${var.vpc_cidr}"
  enable_dns_support 	= "true"
  enable_dns_hostnames 	= "true"
  instance_tenancy 	= "default"
  tags			= {
    "Name" 		= "Democrance"
  }
}

resource "aws_internet_gateway" "Democrance-IGW" {
  vpc_id 		= "${aws_vpc.Democrance.id}"
  tags 			= {
    "Name" 	 	= "Democrance IGW"
  }
}

resource "aws_nat_gateway" "Democrance-NAT" {
  allocation_id		= "{aws_eip.Democrance-NAT.id}"
  subnet_id		= "${aws_subnet.Democrance-Private.id}"
  tags			= {
    "Name" 		= "Democrance-NAT"
  }
}
