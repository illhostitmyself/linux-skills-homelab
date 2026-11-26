#!/bin/bash
# Basic ufw setup for a Debian homelab server.
# Read it first. Keep your current SSH session open and test from a second one.
set -eu

sudo apt install -y ufw

sudo ufw default deny incoming
sudo ufw default allow outgoing

# allow SSH BEFORE enabling, or you will lock yourself out
sudo ufw allow 22/tcp

# open only what you need, e.g. a web server:
# sudo ufw allow 80/tcp
# sudo ufw allow 443/tcp

sudo ufw enable
sudo ufw status verbose
