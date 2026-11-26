# The service runs, but you can't reach it

Walk the path one step at a time. The first step that fails is usually where the problem lives (sometimes it hides a smaller one behind it).

| # | Check | Command | Fail means |
|---|---|---|---|
| 1 | Does the server have an IP? | `ip a` | No address: cable, Wi-Fi or DHCP problem |
| 2 | Can it reach your router? | `ip route` (the `default` line), then `ping ROUTER_IP` | Local network problem |
| 3 | Can it reach the internet? | `ping 1.1.1.1` | Router or ISP problem |
| 4 | Does DNS work? | `ping google.com`, `resolvectl status`, `/etc/resolv.conf`, `/etc/hosts` | IP works but name doesn't: DNS (a stale `/etc/hosts` entry also does this) |
| 5 | Is the service listening on the right address? | `sudo ss -tlnp` | `127.0.0.1` means only the server itself can connect |
| 6 | Test from the other machine | `curl http://SERVER_IP:PORT` or `nc -zv SERVER_IP PORT` | Refused: nothing listening. Timeout: something is dropping traffic |
| 7 | Firewall | `sudo ufw status verbose` | Blocked. Docker's rules sit in front of ufw, so check them for container ports too |

If everything on the server checks out, look at the router or any other firewall between you and the box.

A failed ping proves little: some machines ignore it. Treat it as a hint, not a verdict.
