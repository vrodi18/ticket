output "LB" {
  value = module.instance.DNS
}
output "Vm1" {
  value = module.instance.Ubuntu1
}

output "VM2" {
  value = module.instance.Ubuntu2
}

# output "public_subnet1" {
#   value = "${module.VPC.public_subnet1}"
# }
# output "public_subnet2" {
#   value = "${module.VPC.public_subnet2}"
# }
# output "public_subnet3" {
#   value = "${module.VPC.public_subnet3}"
# }
# output "tags" {
#   value = "${module.VPC.tags}"
# }
