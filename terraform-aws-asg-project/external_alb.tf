resource "aws_elb" "External_ALB" {
  name            = "ExternalALB"
  security_groups = [aws_security_group.WP_SG.id]

  subnets = [
    var.public_subnet1,    
    var.public_subnet2,
    var.public_subnet3,
  ]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }


  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400
  tags = {
    Name = "foobar-terraform-elbs"
  }
}

resource "aws_autoscaling_attachment" "asg_attachment_bar" {
  autoscaling_group_name = aws_autoscaling_group.WP.id
  elb                    = aws_elb.External_ALB.id
}