#!/data/data/com.termux/files/usr/bin/bash

# Server listens on port 8888 for chat
# Useful for LAN/2 Termux sessions

# -v enables verbose, -k keeps session open
ncat -lvp 8888
