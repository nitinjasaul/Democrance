resource "aws_security_group" "ALB-SG" {
  name        = "Democrance_ALB_SG"
  description = "Democrance ALB Security Group"
  vpc_id      = "${aws_vpc.Democrance.id}"

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = "${var.allowed_cidr_blocks}"
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = "${var.allowed_cidr_blocks}"
  }

  # Allow all outbound traffic.
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "Name" = "Democrance-ALB-SG"
  }
}

resource "aws_security_group" "ssh-allowed" {
  vpc_id      = "${aws_vpc.Democrance.id}"

  egress {
        from_port   = 0
        to_port     = 0
        protocol    = -1
        cidr_blocks = ["0.0.0.0/0"]
    }

  ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
  }

}

resource "aws_security_group" "RDS-SG" {
  name        = "RDS Security Group"
  description = "RDS Postgres Server"
  vpc_id      = "${aws_vpc.Democrance.id}"
  # Keep the instance private by only allowing traffic from the web server.
  ingress {
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = ["${aws_security_group.ssh-allowed.id}"]
  }
  # Allow all outbound traffic.
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    "Name" = "RDS-SG"
  }
}
