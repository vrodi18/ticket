resource "aws_instance" "Ubuntu1" {
ami = var.ami_id
subnet_id  = var.public_subnet1
associate_public_ip_address = true
instance_type = "t3.micro"
key_name = "${aws_key_pair.laptop1.key_name}"
vpc_security_group_ids = [aws_security_group.sg.id]
root_block_device { 
		volume_size = 10
	}

}

resource "aws_instance" "Ubuntu2" {
ami = var.ami_id
subnet_id  = var.public_subnet2
associate_public_ip_address = true
instance_type = "t3.micro"
key_name = aws_key_pair.laptop1.key_name
vpc_security_group_ids = [aws_security_group.sg.id]
root_block_device { 
		volume_size = 10
	}
}

resource "null_resource" "Ubuntu1" {
  triggers = {
    always_run = "${timestamp()}"
  } 
  provisioner "remote-exec" {
    connection {
    type = "ssh"
    user = "ubuntu"
    private_key = "${file("~/.ssh/id_rsa")}"
    host = aws_instance.Ubuntu1.public_ip

  }
    inline = [
"sudo apt-get update",
"sudo apt-get install -y nginx",
"sudo systemctl start nginx",
"sudo systemctl enable nginx",
"echo '<p> Smoothie Power! </p>' | sudo tee /var/www/html/index.html",


]
}
}

resource "null_resource" "Ubuntu2" {
  triggers = {
    always_run = "${timestamp()}"
  } 
  provisioner "remote-exec" {
    connection {
    type = "ssh"
    user = "ubuntu"
    private_key = "${file("~/.ssh/id_rsa")}"
    host = aws_instance.Ubuntu2.public_ip

  }
    inline = [
"sudo apt-get update",
"sudo apt-get install -y nginx",
"sudo systemctl start nginx",
"sudo systemctl enable nginx",
"echo '<h1>Deployed via Terraform</h1>' | sudo tee /var/www/html/index.html",

]
}
}