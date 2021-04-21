output "LB" {
  value = module.instance.DNS
}
output "Vm1" {
  value = module.instance.Ubuntu1
}

output "VM2" {
  value = module.instance.Ubuntu2
}


