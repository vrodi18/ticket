# resource "aws_elb" "External_ELB" {
#   name            = "ExternalALB"
#   security_groups = [aws_security_group.sg.id]

#   subnets = [
#     var.public_subnet1,    
#     var.public_subnet2,
#   ]

#   listener {
#     instance_port     = 80
#     instance_protocol = "tcp"
#     lb_port           = 80
#     lb_protocol       = "tcp"
#   }


#   cross_zone_load_balancing   = true
#   idle_timeout                = 400
#   connection_draining         = true
#   connection_draining_timeout = 400
#   tags = {
#     Name = "foobar-terraform-elbs"
#   }
# }

# resource "aws_elb_attachment" "Ubuntu1" {
#   elb      = aws_elb.External_ELB.id
#   instance = aws_instance.Ubuntu1.id
# }

# # resource "aws_elb_attachment" "Ubuntu2" {
# #   elb      = aws_elb.External_ELB.id
# #   instance = aws_instance.Ubuntu2.id
# # }