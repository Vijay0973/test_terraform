provider "aws" {
	region = "${var.region}"
}

#resource "aws_instance" "web" {
#	count = "${var.ec2_count}"
#	ami = "${var.ami_id}"
#	instance_type = "t2.small"
#	subnet_id ="${aws_subnet.subent.*.id}"
#	tag {
#	name = "demo"
#	}
#}
#data "aws_subnet" "select"{
#	id ="${aws_subnet.subnet.*.id}"
#}
resource "aws_vpc" "main" {
	cidr_block = "${var.vpc_cidr}"
	instance_tenancy = "default"
	tags {
	name = "demo_vpc"
}
}

resource "aws_subnet" "subnet" {
	count ="${length(data.aws_availability_zones.ds.names)}"
	availability_zone = "${element(data.aws_availability_zones.ds.names,count.index)}"
	vpc_id ="${aws_vpc.main.id}"
 	cidr_block ="${element(var.subnet_cidr,count.index)}"
	tags {
	name ="subnet-${count.index+1}"
}
}
