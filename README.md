# Linux skills your homelab actually needs

Small, readable examples for the explainer video on the Linux fundamentals a homelab depends on: boot, users, permissions, the file tree, scripting, scheduling, networking and troubleshooting.

Watch: {{VIDEO_URL}}

## What's here

| Path | Video part |
|---|---|
| [`docs/boot-chain.md`](docs/boot-chain.md) | The boot process: firmware, boot loader, initramfs, systemd |
| [`examples/01-systemd/`](examples/01-systemd/) | `systemctl` and `journalctl` cheat sheet |
| [`examples/02-users-and-permissions/`](examples/02-users-and-permissions/) | sudo, permission bits, service users |
| [`examples/03-filesystem-and-disks/`](examples/03-filesystem-and-disks/) | The file tree, `lsblk`, mounting, `/etc/fstab` |
| [`examples/04-backup-and-scheduling/`](examples/04-backup-and-scheduling/) | A bash backup script, cron, systemd timer |
| [`examples/05-ports-and-firewall/`](examples/05-ports-and-firewall/) | `ss`, privileged ports, `ufw`, the Docker gotcha |
| [`docs/troubleshooting-service-wont-start.md`](docs/troubleshooting-service-wont-start.md) | Checklist: it won't start |
| [`docs/troubleshooting-cant-reach-service.md`](docs/troubleshooting-cant-reach-service.md) | Checklist: it runs but you can't reach it |

## Prerequisites

- A Debian stable machine (the video recommends Debian stable, or Ubuntu Server LTS). Commands use `apt`, `ufw` and `systemd`, so other families may need different package names.
- A normal user with `sudo` rights.
- Use a test machine or VM while following along, especially for `fstab` and firewall changes.

## Follow along

1. Read the [boot chain](docs/boot-chain.md) so you know what to check when a machine won't boot.
2. Try the [systemd commands](examples/01-systemd/README.md) on a service that already runs, like `ssh`.
3. Run [`permissions-demo.sh`](examples/02-users-and-permissions/permissions-demo.sh) to see permission bits and the missing-execute-on-a-folder problem in a throwaway directory.
4. Read [`fstab.example`](examples/03-filesystem-and-disks/fstab.example) before you touch your real `/etc/fstab`.
5. Copy and adapt the [backup script](examples/04-backup-and-scheduling/backup-config.sh), then schedule it with either cron or the systemd timer.
6. Work through the [ports and firewall](examples/05-ports-and-firewall/README.md) example.
7. Keep the two troubleshooting checklists nearby.

## Notes and caveats

- Everything uses placeholders (`myapp`, `YOUR_UUID_HERE`, `192.168.1.x`). Replace them with your own values.
- These are teaching examples written for the video, not hardened production configs.
- Nothing here has been tested on distros other than the Debian setup shown in the video.

## License

MIT
