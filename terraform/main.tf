resource "proxmox_vm_qemu" "pxe-server" {
    name        = "pxe-server"
    target_node = "pve"

    clone = "Admin-Machine"
    full_clone = true
    boot = "order=scsi0;net0"

    cores  = 2
    memory = 8192  # Assign memory in MB

    onboot = true  # Ensure VM does automatically start

    disks {
        scsi {
            scsi0 {
                disk {
                    storage = "ssd_disks"
                    size = "20G"
                }
            }
        }
    }

    network {
        model     = "virtio"
        bridge    = "vmbr0"
        macaddr   = "BC:24:11:38:88:7D"
        firewall  = false
        link_down = false
        mtu       = 0
        queues    = 0
        rate      = 0
        tag       = -1
    }
}