variable "cidr_block" {}
variable "region" {}
variable "public_cidr1" {}
variable "public_cidr2" {}
variable "lb_record" {}
variable "dns_name" {}
variable "vm1_record" {}
variable "vm2_record" {}
variable "vm1_ip" {}
variable "vm2_ip" {}




variable "dns_zone" {}

variable "tags" {
	type = map(string)
}