#!/bin/bash

echo "[scripts/root/boot.sh]             Preparing to launch the program..."
echo "-------------------------------------------------------------------------------------------------------" >> logs/root.log
echo "-------------------------------------------------------------------------------------------------------" >> logs/user.log
echo "-------------------------------------------------------------------------------------------------------" >> logs/sys.log
echo "$(date '+%Y-%m-%d %H:%M:%S')       [root]                     Starting boot process..." >> logs/root.log


# Grant execute permissions to the script
echo "[scripts/root/boot.sh]             Granting execute permissions to the script..."
echo "$(date '+%Y-%m-%d %H:%M:%S')       [root]                     Granting execute permissions to the script..." >> logs/root.log
chmod +x scripts/root/grant.sh
./scripts/root/grant.sh

# Load resources
echo "[scripts/root/boot.sh]             Loading resources..."
echo "$(date '+%Y-%m-%d %H:%M:%S')       [root]                     Loading resources..." >> logs/root.log
./scripts/root/load-resrcs.sh

# Start the program
echo "[scripts/root/boot.sh]             Starting the program..."
echo "$(date '+%Y-%m-%d %H:%M:%S')       [root]                     Starting the program..." >> logs/root.log
./scripts/root/start.sh -s

# Shutdown the program
echo "[scripts/root/boot.sh]             Shutting down the program..."
echo "$(date '+%Y-%m-%d %H:%M:%S')       [root]                     Shutting down the program..." >> logs/root.log
./scripts/root/shutdown.sh