#!/bin/bash

echo "welcome to Termux  setup wizard"
termux-setup-storage

echo "updating and upgrading packages..."
pkg update && pkg upgrade -y

echo "Installing essential packages..."
pkg install git python curl wget
openssh nano -y
echo "Installing Python libraries..."
pip install requests colorama bs4

echo "Creating workspace in internal storage..."
mkdir -p /storage/emulated/0/CyberSecReports

echo "All set! You're now ready to begin ethical hacking"
