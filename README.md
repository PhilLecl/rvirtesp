# Ranolfi's VM-aware ESP management (rvirtesp)

A QEMU hook that automates the unmounting of the ESP (EFI System Partition) in the host when launching a virtual machine that is about to mount the same ESP.

This is aimed at allowing passing the entire hosts's root block device (HDD|SDD) to a virtual machine where you normaly shouldn't because both host and guest run in UEFI mode and the ESP is mounted in the host. It automates the unmounting the ESP on the host when the VM is powered on, and the remounting on VM power-off.

A "manual" script is also provided, although you shouldn't need to use it; it can be called as `rvirtesp` from your command line.

Driven by https://askubuntu.com/questions/927574/add-physical-partition-to-qemu-kvm-virtual-machine-in-virt-manager and https://unix.stackexchange.com/questions/374551/run-script-in-the-host-when-starting-virtual-machine-with-virt-manager.

## What is this fork for?

This fork aims at making the original hook and scripts more generically applicable so that they may be distributed as packages.

### Assumptions

- The ESP has the label "ESP" (can be found at /dev/disk/by-label/ESP)
- The ESP-mountpoint is /efi
- The guest_name includes "rvirtesp"
