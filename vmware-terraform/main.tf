data "vsphere_virtual_machine" "templates" {
  for_each      = var.vms
  name          = each.value.template
  datacenter_id = data.vsphere_datacenter.dc.id
}

resource "vsphere_virtual_machine" "vm" {
  for_each         = var.vms
  name             = each.key
  folder           = var.vm_folder
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id     = data.vsphere_datastore.ds.id

  num_cpus  = each.value.cpu
  memory    = each.value.memory_mb
  guest_id  = data.vsphere_virtual_machine.templates[each.key].guest_id
  scsi_type = data.vsphere_virtual_machine.templates[each.key].scsi_type
  annotation = each.value.notes

  network_interface {
    network_id   = data.vsphere_network.networks[each.key].id
    adapter_type = data.vsphere_virtual_machine.templates[each.key].network_interface_types[0]
  }

  disk {
    label            = "disk0"
    size             = data.vsphere_virtual_machine.templates[each.key].disks[0].size
    thin_provisioned = data.vsphere_virtual_machine.templates[each.key].disks[0].thin_provisioned
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.templates[each.key].id
  }
}