resource "aws_elb" "Internal_ALB" {
  name     = "InternalALB"
  internal = true

  security_groups = [
    aws_security_group.SG_InternalELB.id,
  ]

  subnets = [
    var.private_subnet1,                 
    var.private_subnet2,
    var.private_subnet3,

  ]

  listener {
    instance_port     = 3306
    instance_protocol = "tcp"
    lb_port           = 3306
    lb_protocol       = "tcp"
  }

  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400
  tags = {
    Name = "foobar-terraform-elbs"
  }
}

resource "aws_autoscaling_attachment" "Internal_attach" {
  autoscaling_group_name = aws_autoscaling_group.DB.id
  elb                    = aws_elb.Internal_ALB.id
}