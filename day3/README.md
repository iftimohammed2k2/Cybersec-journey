## Day 3 - Network Information Gathering (netinfo.sh)

During Day 3, I created a simple script called `netinfo.sh` to gather essential network information about the device. This script is useful for identifying network interfaces, local IP address, and public IP address. It utilizes common Linux networking tools and commands to collect this information.

### Features:
- Displays local IP address (`ifconfig`)
- Shows public IP address using `curl`
- Lists all network interfaces
- Fetches DNS details

### How to Use:
To run the `netinfo.sh` script, simply execute the following command:
```bash
bash netinfo.sh
