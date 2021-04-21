resource "aws_launch_template" "DB" {
  name_prefix          = "DB_template"
  image_id             = "${var.ami_id_DB}"
  instance_type        = "${var.instance_type}"
  key_name             = "${aws_key_pair.laptop1.key_name}"
  vpc_security_group_ids = ["${aws_security_group.SG_DB.id}"]
  //user_data            = "${base64encode(data.template_file.DB_Template.rendered)}"
  

}