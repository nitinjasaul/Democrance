resource "aws_route_table" "Democrance-Public-RT" {
  vpc_id	  = "${aws_vpc.Democrance.id}"
  route {
    cidr_block 	  = "0.0.0.0/0" 
    gateway_id	  = "${aws_internet_gateway.Democrance-IGW.id}" 
  }
  tags 		  = {
    "Name"	  = "Democrance-Public-RT"
  }
}

resource "aws_route_table_association" "Democrance-Public-RT-1"{
  subnet_id	  = "${aws_subnet.Democrance-Public-1.id}"
  route_table_id  = "${aws_route_table.Democrance-Public-RT.id}"
}

resource "aws_route_table_association" "Democrance-Public-RT-2"{
  subnet_id	  = "${aws_subnet.Democrance-Public-2.id}"
  route_table_id  = "${aws_route_table.Democrance-Public-RT.id}"
}

resource "aws_route_table" "Democrance-Private-RT" {
  vpc_id	  = "${aws_vpc.Democrance.id}"
  route {
    cidr_block 	  = "0.0.0.0/0" 
    gateway_id	  = "${aws_nat_gateway.Democrance-NAT.id}" 
  }
  tags 		  = {
    "Name"	  = "Democrance-Private-RT"
  }
}

resource "aws_route_table_association" "Democrance-Private-RT"{
  subnet_id	  = "${aws_subnet.Democrance-Private.id}"
  route_table_id  = "${aws_route_table.Democrance-Private-RT.id}"
}
