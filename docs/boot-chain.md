# From power button to login prompt

1. **Firmware** wakes up and runs the power-on self-test (POST), then looks for something to boot.
   - Legacy **BIOS** runs boot code from the start of the first disk.
   - **UEFI** (most machines since about 2010) reads its boot entries and launches a program from the EFI system partition (a small FAT partition).
2. **Boot loader** (usually GRUB or systemd-boot) loads the kernel and the initramfs.
3. **initramfs** is a tiny temporary file system in RAM with just enough drivers and tools to find the real disk, even if it is encrypted or on RAID. It also starts udev on most distros.
4. **Kernel** runs the initramfs, mounts the real root file system and starts the init system.
5. **systemd** (Debian, Arch and most others) starts and tracks every service, and collects their logs in the journal.
6. **Login prompt.**

When a machine won't boot, work out which step in this chain it stopped at.
