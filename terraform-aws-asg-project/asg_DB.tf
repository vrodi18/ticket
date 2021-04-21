resource "aws_autoscaling_group" "DB" {
  name = "DB_ASG"

  vpc_zone_identifier = [
    var.private_subnet1,                 
    var.private_subnet2,
    var.private_subnet3,
  ]

  launch_template {
    id = aws_launch_template.DB.id
  }
  desired_capacity = 1
  min_size         = 1
  max_size         = 4

  lifecycle {
    create_before_destroy = true
  }
}
