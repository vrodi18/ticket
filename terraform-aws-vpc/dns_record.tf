resource "aws_route53_record" "www" {
  zone_id = aws_route53_zone.private.zone_id
  name    = var.lb_record
  type    = "CNAME"
  ttl     = "60"
  records = [var.dns_name]
}

resource "aws_route53_record" "vm1" {
  zone_id = aws_route53_zone.private.zone_id
name = var.vm1_record
type = "A"
ttl = "5"
records = [var.vm1_ip]
}

resource "aws_route53_record" "vm2" {
  zone_id = aws_route53_zone.private.zone_id
name = var.vm2_record
type = "A"
ttl = "5"
records = [var.vm2_ip]
}
