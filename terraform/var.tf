variable "PUBLIC_KEY_PATH" {
  default = "/home/nitin/.ssh/democrance-key.pub"
  description = "Enter the path to the SSH Public Key to add to AWS Instance"
}

variable "allowed_cidr_blocks" {
  type = list(string)
  default = []
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "cidr_pub_1" {
  default = "10.0.1.0/24"
}

variable "cidr_pub_2" {
  default = "10.0.2.0/24"
}

variable "cidr_pvt" {
  default = "10.0.3.0/24"
}

variable "AMI" {
  type = map(string)
  default = {
        "us-east-1" = "ami-07d02ee1eeb0c996c"
    }
}

variable "certificate_arn" {
  default = ""
}

variable "rds_name" {
  default = "democrance"
}

variable "database_name" {
  default = "democrance" 
}

variable "database_user" {
  default = "root"
}

variable "database_password" {
  default = "Nitin@25"
}

variable "rds_storage_type" {
  default = "gp2"
}

variable "rds_storage" {
  default = "5"
}

variable "rds_engine" {
  default = "postgres"
}

variable "rds_engine_version" {
  default = "13.3"
}

variable "rds_instance_type" {
  default = "db.t3.micro"
}

variable "instance_type" {
  default = "t2.micro"
}
