output "DNS" {
value = aws_lb.test.dns_name
}

output "Ubuntu1" {
value = aws_instance.Ubuntu1.public_ip
}

output "Ubuntu2" {
value = aws_instance.Ubuntu2.public_ip
}