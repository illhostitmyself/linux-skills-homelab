# The file tree, disks and mounting

Everything lives in one tree that starts at `/`.

| Folder | What lives there |
|---|---|
| `/etc` | configuration: sudoers, fstab, service config |
| `/var` | things that change, like logs in `/var/log` |
| `/home` | each user's personal files (root uses `/root`) |
| `/tmp` | scratch space, usually wiped at reboot |
| `/dev` | hardware as files: `/dev/sda`, `/dev/nvme0n1` |

## See and mount disks

```bash
lsblk                       # disks and partitions
lsblk -f                    # plus file system type and UUID
ls -l /dev/disk/by-uuid/    # stable names created by udev

sudo mkdir -p /mnt/storage
sudo mount /dev/sdb1 /mnt/storage   # replace with your partition
```

## Mount at boot

Add a line to `/etc/fstab` using the UUID, not the `/dev` name (names depend on the order the kernel finds drives and can change between boots). See [`fstab.example`](fstab.example).

Test before rebooting:

```bash
sudo mount -a      # errors here mean the fstab line is wrong
```

A mistake in fstab can stop the machine from booting cleanly, so keep a second session open and a backup copy (`sudo cp /etc/fstab /etc/fstab.bak`).
