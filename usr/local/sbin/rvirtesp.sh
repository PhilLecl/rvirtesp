#!/usr/bin/env bash
#
# rvirtesp - auto mount-unmount ESP as needed - for whole-disk virtualization
#
# Marc Ranolfi, 2018-02-23 <mranolfi@gmail.com>
#
# See <https://unix.stackexchange.com/questions/374551/run-script-in-the-host-when-starting-virtual-machine-with-virt-manager>

is_mounted=false
if mount | grep -qs "on /efi"; then
  is_mounted=true
fi

if [[ $1 == "umount" ]] && [[ "$is_mounted" == true ]]; then
  if umount /dev/disk/by-label/ESP; then
    exit 0
  else
    exit -1
  fi

elif [[ $1 == "mount" ]] && [[ "$is_mounted" == false ]]; then
  if mount /dev/disk/by-label/ESP; then
    exit 0
  else
    exit -2
  fi

fi
