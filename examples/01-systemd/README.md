# systemd: services and logs

Replace `ssh` with any service name.

```bash
systemctl status ssh          # running? plus the last few log lines
sudo systemctl start ssh      # run it right now
sudo systemctl stop ssh
sudo systemctl restart ssh
sudo systemctl enable ssh     # start at boot
sudo systemctl enable --now ssh   # both: enable and start now
systemctl list-timers         # timers, next/last run, which service they trigger
```

## Logs with journalctl

```bash
journalctl -u ssh        # only this service
journalctl -b            # only the current boot
journalctl -u ssh -b     # both filters
journalctl -u ssh -f     # follow new lines as they arrive
```

## After creating or editing a unit file

```bash
sudo systemctl daemon-reload
```

`daemon-reload` makes systemd re-read unit files. It does not restart running services.
