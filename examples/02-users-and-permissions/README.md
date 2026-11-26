# Users, sudo and permissions

## sudo

```bash
sudo lsblk && ls     # lsblk runs as root, ls does not
sudo -l              # what you are allowed to run
```

On Debian, add a user to the `sudo` group, then log out and back in:

```bash
sudo usermod -aG sudo YOUR_USER
```

Edit the sudoers policy only with `visudo`, which checks the syntax before saving:

```bash
sudo visudo
```

## Permission numbers

| Permission | Bit | Number |
|---|---|---|
| read | 100 | 4 |
| write | 010 | 2 |
| execute | 001 | 1 |

Add them up per set (owner, group, everyone else):

| Mode | Meaning | Typical use |
|---|---|---|
| `644` | owner read+write, others read | regular file |
| `755` | owner read+write+execute, others read+execute | folder or program |
| `640` | owner read+write, group read, others nothing | config file a service reads |

On a folder, execute means you may enter it, and you need it on **every** folder along the path.

## Running a service as its own user

```bash
# system user, no login shell, no password
sudo useradd --system --shell /usr/sbin/nologin myapp

# hand its data folder and config to it
sudo chown -R myapp:myapp /var/lib/myapp
sudo chmod 640 /etc/myapp/config.yml
sudo chown myapp:myapp /etc/myapp/config.yml
```

See `User=` and `Group=` in the service's unit file (`systemctl cat myapp`).

## Permission denied? Match, don't open up

Match the file's owner or group to the user the service runs as. Don't `chmod 777` it (everyone on the machine can write) and don't run the service as root (it gets access to everything).
