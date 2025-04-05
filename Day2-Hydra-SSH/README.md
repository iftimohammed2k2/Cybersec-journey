# Hydra mini project -SSH Bruteforce simulation 
This project simulated an SSH brute-force attack using Hydra on 
localhost (127.0.0.1).

##command used:
```bash 
hydra -L userlist.txt -p passlist.txt ssh://127.0.0.1 -v
