output "network" {
  value = module.network.network_self_link
}

output "subnets" {
  value = module.network.subnets
}

output "vm_ip" {
  value = module.jenkins.vm_ip
}

output "vm_ext_ip" {
  value = lookup(module.jenkins.vm_ext_ip[0], "nat_ip")
}