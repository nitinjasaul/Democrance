resource "aws_instance" "Democrance-APP" {
  ami                       = "${lookup(var.AMI, var.aws_region)}"
  instance_type		    = "${var.instance_type}"
  subnet_id		    = "${aws_subnet.Democrance-Private.id}"
  vpc_security_group_ids    = ["${aws_security_group.ssh-allowed.id}"]
  key_name		    = "${aws_key_pair.democrance-key.id}"
}

resource "aws_db_instance" "Democrance" {
  identifier                = "${var.rds_name}"
  allocated_storage         = "${var.rds_storage}"
  storage_type 		    = "${var.rds_storage_type}"
  engine                    = "${var.rds_engine}"
  engine_version            = "${var.rds_engine_version}"
  instance_class            = "${var.rds_instance_type}"
  name                      = "${var.database_name}"
  username                  = "${var.database_user}"
  password                  = "${var.database_password}"
  db_subnet_group_name      = "${aws_db_subnet_group.RDS-Group.id}"
  vpc_security_group_ids    = ["${aws_security_group.RDS-SG.id}"]
  skip_final_snapshot       = true
  final_snapshot_identifier = "Ignore"
}
