output "vm_names" {
  value = try(
    [for k, v in vsphere_virtual_machine.vm : v.name],
    [vsphere_virtual_machine.vm.name]
  )
}

output "vm_ids" {
  value = try(
    [for k, v in vsphere_virtual_machine.vm : v.id],
    [vsphere_virtual_machine.vm.id]
  )
}