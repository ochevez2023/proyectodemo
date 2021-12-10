#!/bin/bash
echo "[INFO] Install rails into VM"

echo "[INFO] Installing tools..."
zypper --non-interactive --quiet in vim tree nmap git

echo "[INFO] Installing rails..."
zypper --non-interactive --quiet in ruby2.5-rubygem-rails-5.2
echo "alias rails='rails.ruby2.5'" >> /home/vagrant/.alias

echo "[INFO] Installing sqlite3..."
zypper --non-interactive --quiet in sqlite3 sqlite3-devel
