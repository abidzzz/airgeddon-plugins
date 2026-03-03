#!/bin/bash


echo "=============================="
echo "🚀 Airgeddon Plugin Installer"
echo "=============================="

set -e

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

# Check root
if [[ $EUID -ne 0 ]]; then
   echo -e "${RED}[!] This script must be run as root${NC}"
   echo -e "${YELLOW}Auto-re-running with sudo...${NC}"
   exec sudo bash "$0" "$@"
   exit 1
fi

sudo mkdir -p /usr/share/airgeddon/plugins

# Download plugins
echo -e "${GREEN}[+] Downloading plugins...${NC}"

git clone https://github.com/abidzzz/airgeddon-plugins.git /tmp/airgeddon-plugins

echo -e "${GREEN}[+] Installing plugins...${NC}"
sudo cp -r /tmp/airgeddon-plugins/plugins/* /usr/share/airgeddon/plugins/

echo -e "${GREEN}[+] Installed:${NC}"
ls -1 /usr/share/airgeddon/plugins/*.sh 2>/dev/null | sed 's/^/  /' || echo "  No .sh files found?"

# Clean up
echo -e "${GREEN}[+] Cleaning up...${NC}"
rm -rf /tmp/airgeddon-plugins

echo -e "${GREEN}✅ All done! Run: sudo airgeddon${NC}"