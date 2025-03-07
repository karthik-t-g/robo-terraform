resource "aws_instance" "frontend" {
  ami = "ami-09c813fb71547fc4f"
  instance_type = "t3.small"
  security_groups = ["sg-01cbddfc072527f97"]
  tags = {
    name="frontend"
  }
}
resource "aws_route53_record" "frontend"{
  zone_id = "Z00444301TMJWUTBVLW04"
  name = "frontend.dev.karthi.com"
  type = "A"
  ttl = 300
  records = [aws_instance.frontend.private_ip]
}
resource "aws_instance" "mongo" {
  ami = "ami-09c813fb71547fc4f"
  instance_type = "t3.small"
  security_groups = ["sg-01cbddfc072527f97"]
  tags = {
    name="mongo"
  }
}
resource "aws_route53_record" "mongo"{
  zone_id = "Z00444301TMJWUTBVLW04"
  name = "mongo.dev.karthi.com"
  type = "A"
  ttl = 300
  records = [aws_instance.mongo.private_ip]
}
resource "aws_instance" "catalogue" {
  ami = "ami-09c813fb71547fc4f"
  instance_type = "t3.small"
  security_groups = ["sg-01cbddfc072527f97"]
  tags = {
    name="catalogue"
  }
}
resource "aws_route53_record" "catalogue"{
  zone_id = "Z00444301TMJWUTBVLW04"
  name = "catalogue.dev.karthi.com"
  type = "A"
  ttl = 300
  records = [aws_instance.catalogue.private_ip]
}