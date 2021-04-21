resource "aws_key_pair" "laptop1" {
  key_name   = "laptop1"
  public_key = file("~/.ssh/id_rsa.pub")
}