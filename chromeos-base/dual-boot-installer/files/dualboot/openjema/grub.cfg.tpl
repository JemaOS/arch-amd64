#JemaOS 2023-08-24 Author: johndoe@jemaos.io
defaultA=0
defaultB=1
set img=/openjema/openjema_dual_boot.img
search --label --set root OJEMA-DUAL-BOOT
loopback loopdev $img
gptpriority loopdev 2 prioA
gptpriority loopdev 4 prioB
if [ $prioA -lt $prioB ]; then
  set default=$defaultB
else
  set default=$defaultA
fi

set timeout=0

# NOTE: find rootfs by label (not partion label)

menuentry "openjema multi-boot A" {
  linux (loopdev,gpt12)/syslinux/vmlinuz.A init=/sbin/init root=%ROOTDEV% boot=local rootwait noresume noswap ro loglevel=7 console= i915.modeset=1 cros_efi cros_debug  jemaos_dualboot %EXTRA_FLAG%
  initrd /boot/dual_boot_ramfs.cpio
}

menuentry "openjema multi-boot B" {
  linux (loopdev,gpt12)/syslinux/vmlinuz.B init=/sbin/init root=%ROOTDEV% boot=local rootwait noresume noswap ro loglevel=7 console= i915.modeset=1 cros_efi cros_debug  jemaos_dualboot %EXTRA_FLAG%
  initrd /boot/dual_boot_ramfs.cpio
}

menuentry "JemaOS Recovery Tools" {
  linux /boot/openjema_vmlinuzB init=/sbin/init root=%ROOTDEV% boot=local rootwait noresume noswap ro loglevel=7 console= i915.modeset=1 cros_efi cros_debug %EXTRA_FLAG%
  initrd /boot/core_util_ramfs.cpio
}
