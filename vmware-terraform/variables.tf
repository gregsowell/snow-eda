variable "vsphere_server" {}
variable "vsphere_user" {}
variable "vsphere_password" { sensitive = true }

variable "datacenter" { default = "MNS" }
variable "cluster"    { default = "MNS" }
variable "datastore"  { default = "SSD" }
variable "network"    { default = "Greg" }

variable "vm_folder"  { default = "Greg/redhat/terraform" }

variable "vms" {
  description = "Map of VMs to create"
  type = map(object({
    template  = string
    network   = string
    cpu       = number
    memory_mb = number
#    disk_gb   = number
    notes     = string
  }))
}