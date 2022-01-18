resource "aws_subnet" "Democrance-Public-1" {
  vpc_id		  = "${aws_vpc.Democrance.id}"
  cidr_block		  = "${var.cidr_pub_1}"
  map_public_ip_on_launch = "true"
  availability_zone	  = "us-east-1a"
  tags                    = {
    "Name" 		  = "Democrance Public 1"
  }
}

resource "aws_subnet" "Democrance-Public-2" {
  vpc_id		  = "${aws_vpc.Democrance.id}"
  cidr_block		  = "${var.cidr_pub_2}"
  map_public_ip_on_launch = "true"
  availability_zone	  = "us-east-2a"
  tags                    = {
    "Name" 		  = "Democrance Public 2"
  }
}

resource "aws_subnet" "Democrance-Private" {
  vpc_id		  = "${aws_vpc.Democrance.id}"
  cidr_block		  = "${var.cidr_pvt}"
  map_public_ip_on_launch = "true"
  availability_zone	  = "us-east-3a"
  tags                    = {
    "Name" 	  	  = "Democrance Private"
  }
}

resource "aws_db_subnet_group" "RDS-Group" {
  name        = "rds subnet group"
  description = "RDS Subnet Group"
  subnet_ids  = ["${aws_subnet.Democrance-Private.id}"]
}
