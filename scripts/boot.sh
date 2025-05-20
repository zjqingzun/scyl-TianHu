#!/bin/bash

echo "[scripts/boot.sh]             Preparing to launch the program..."


# Grant execute permissions to the script
echo "[scripts/boot.sh]             Granting execute permissions to the script..."
chmod +x scripts/grant.sh
./scripts/grant.sh

# Load resources
echo "[scripts/boot.sh]             Loading resources..."
./scripts/load-resrcs.sh

# Start the program
echo "[scripts/boot.sh]             Starting the program..."
./scripts/start.sh -s

# Shutdown the program
echo "[scripts/boot.sh]             Shutting down the program..."
./scripts/shutdown.sh