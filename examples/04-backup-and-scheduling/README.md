# Backup script and scheduling

1. Install the script (adjust `SRC` and `DEST` first):

   ```bash
   sudo install -m 755 backup-config.sh /usr/local/bin/backup-config.sh
   ```

2. Schedule it with **one** of these.

## Option A: cron

```bash
crontab -e      # then add the line from crontab.example
```

## Option B: systemd timer (two files)

```bash
sudo cp backup-config.service backup-config.timer /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable --now backup-config.timer   # enable the timer, not the service
systemctl list-timers
sudo systemctl start backup-config.service        # run it by hand any time
journalctl -u backup-config.service               # output goes to the journal
```

`Persistent=true` runs the job at next start if the machine was off at 04:00.

## When you outgrow this

- Backups: restic, BorgBackup or Kopia add deduplication and encryption that a tar one-liner can't.
- Scheduling: Cronicle adds a web UI with job history; Healthchecks warns you when a job didn't run.
