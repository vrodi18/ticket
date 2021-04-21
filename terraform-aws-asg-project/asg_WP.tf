resource "aws_autoscaling_group" "WP" {
  name = "WP_ASG"
  launch_template {
    id = aws_launch_template.WP.id
  }

  vpc_zone_identifier = [
    var.public_subnet1,    
    var.public_subnet2,
    var.public_subnet3,
  ]

  desired_capacity = 1
  min_size         = 1
  max_size         = 4

}