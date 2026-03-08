output "vm_names" {
  value = [for k, v in vsphere_virtual_machine.vm : v.name]
}

output "vm_ids" {
  value = [for k, v in vsphere_virtual_machine.vm : v.id]
}