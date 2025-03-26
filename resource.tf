variable "ami" {
  default = "ami-09c813fb71547fc4f"
}
variable "instance_type" {
  default = "t3.small"
}
variable "zone_id" {
  default = "Z00444301TMJWUTBVLW04"
}
variable "domain_name" {
  default = "karthi.com"
}
variable "record_type" {
  default = "A"
}
variable "ttl" {
  default = "300"
}
resource "aws_instance" "frontend" {
  ami = var.ami 
  instance_type =var.instance_type
  vpc_security_group_ids = ["sg-01cbddfc072527f97"]
  tags = {
    name="frontend"
  }
}
resource "aws_route53_record" "frontend"{
  zone_id =var.zone_id
  name = "frontend.dev.${var.domain_name}"
  type = "A"
  ttl = 300
  records = [aws_instance.frontend.private_ip]
}
resource "aws_instance" "mongo" {
  ami = var.ami
  instance_type =var.instance_type

  tags = {
    name="mongo"
  }
}
resource "aws_route53_record" "mongo"{
  zone_id =var.zone_id
  name = "mongo.dev.${var.domain_name}"
  type = "A"
  ttl = 300
  records = [aws_instance.mongo.private_ip]
}
resource "aws_instance" "catalogue" {
  ami = var.ami
  instance_type =var.instance_type

  tags = {
    name="catalogue"
  }
}
resource "aws_route53_record" "catalogue"{
  zone_id =var.zone_id
  name = "catalogue.dev.${var.domain_name}"
  type = "A"
  ttl = 300
  records = [aws_instance.catalogue.private_ip]
}