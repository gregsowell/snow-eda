# I'm passing these via env vars
# vsphere_server   = "vcenter.example.com"
# vsphere_user     = "administrator@vsphere.local"
# vsphere_password = "REPLACE_ME"

# Everything else defaults to what you told me:
# datacenter = "MNS"
# cluster    = "MNS"
# datastore  = "SSD"
# network    = "Greg"
# vm_folder  = "Greg/redhat/terraform"

vms = {
####start-vms-here

  bastion-01 = {
    template  = "/MNS/vm/Templates/Rocky9"
    network   = "Greg"
    cpu       = 2
    memory_mb = 4096
#    disk_gb   = 40
    notes     = "bastion"
  }

#  web-01 = {
#    template  = "Rocky8.6"
#    cpu       = 2
#    memory_mb = 4096
#    disk_gb   = 40
#    notes     = "web"
#  }

#  web-02 = {
#    template  = "Rocky8.6"
#    cpu       = 2
#    memory_mb = 4096
#    disk_gb   = 40
#    notes     = "web"
#  }
}