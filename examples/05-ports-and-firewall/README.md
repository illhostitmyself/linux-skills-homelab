# Ports and the firewall

Think of the IP address as the building and the port as the apartment number.

## What is listening?

```bash
sudo ss -tlnp
```

`t` TCP, `l` listening, `n` numbers, `p` owning process.

- `127.0.0.1:PORT`: only the machine itself can connect.
- `0.0.0.0:PORT` or `*:PORT`: every network interface.
- Two services on one port: the second fails to start.
- Ports below 1024 are privileged: by default only root can bind them.

## Binding a low port without root

Give the service one capability instead of running it as root. Create a drop-in with `sudo systemctl edit myapp`:

```ini
[Service]
AmbientCapabilities=CAP_NET_BIND_SERVICE
```

## ufw

See [`ufw-setup.sh`](ufw-setup.sh). Order matters: allow SSH **before** enabling, and test from a second session before closing the first.

## Docker gotcha

Ports published by Docker skip past ufw because Docker writes its own firewall rules, so a ufw `deny` doesn't block a container's port. To keep a container port local to the machine, bind it to 127.0.0.1:

```yaml
ports:
  - "127.0.0.1:8080:80"
```
