#!/bin/bash

whois example.com
#we can see domain registrar, owner, contact info, nameservers.
nslookup example.com
#Ip address, DNS servee, mail server(MX), and more

#using  harvester alternative - photon

python3 photon.py -u
https://example.com -o photon-output
