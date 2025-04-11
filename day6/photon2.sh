#!/data/data/com.termux/files/usr/bin/bash

python photon.py -u http://testphp.vulnweb.com -l 2

# -u: URL to scan
# -l 2:Depth level (2=shallow, 5= deep scan)

ls output/testphp.vulnweb.com/

# will show external.txt for SQLmap, internal.txt for internal.txt, social engineering or OSNIT toola for external.txt

