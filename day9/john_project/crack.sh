#!/bin/bash

JOHN_PATH="/root/Cybersec-journey/day9/jhon_project/john/run/john"

echo "[*] Cracking passwords with John the Ripper..."
$JOHN_PATH --wordlist=./mywordlist.txt hashes.txt --format=md5crypt

echo "[*] Displaying cracked passwords:"
$JOHN_PATH --show hashes.txt
