variable "region" {
  default = "us-east-1"
}
variable "max_size"{
  default = "1"  
}
variable "min_size"{
  default = "1"  
}
variable "desired_capacity"{
  default = "1"  
}

variable "instance_type" {
  default = "t2.micro"
}
variable "ami_id" {
  default = "ami-02c3a5ae745efb75f"
  # spot_price = "0.1"
  # instance_type = "t3.small"
  # spot_type = "one-time"
}
variable "ami_id_DB" {
  default = "ami-0f5f86699bd7169ed"
}
variable "private_subnet1" {}
variable "private_subnet2" {}
variable "private_subnet3" {}

variable "public_subnet1" {}
variable "public_subnet2" {}
variable "public_subnet3" {}


variable "tags" {
  type    = map(string)
  default = null
}
variable "vpc_id" {}
 
# variable "key_name" {}
# variable "image_owner" {}
# variable "desired_capacity" {}
# variable "max_size" {}
# variable "min_size" {}

