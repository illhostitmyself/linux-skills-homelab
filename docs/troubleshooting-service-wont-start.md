# A service won't start

Always in this order:

1. **Status and logs** to read the real error.
   ```bash
   systemctl status myapp
   journalctl -u myapp -b
   ```
   Empty log for a service that died instantly? Take the PID from `systemctl status` and search by it:
   ```bash
   journalctl _PID=12345
   ```
2. **Permissions.** `ls -l` the files it complains about and compare owner and group with the user in the unit file (`User=`, `Group=`).
3. **Ports.** `sudo ss -tlnp`: did something else already take its port?
4. **Fix it, then restart.**
   ```bash
   sudo systemctl restart myapp
   ```
5. Works now but not after a reboot? Check it is enabled: `systemctl is-enabled myapp`.
