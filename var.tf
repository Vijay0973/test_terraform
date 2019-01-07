variable "region" {
	default ="us-east-1"
}
#variable "ec2_count" {
#	default = 3
#}

#variable "ami_id" {
#	default = "ami-05a36d3b9aa4a17ac"
#}


variable "vpc_cidr" {
	default ="192.168.0.0/16"
}
variable "subnet_cidr" {
	type = "list"
	default =["192.168.1.0/24","192.168.2.0/24","192.168.3.0/24"]
}
data "aws_availability_zones" "ds"{}
