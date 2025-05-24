#!/bin/bash


echo "[scripts/root/shutdown.sh]         Shutting down system..."


# Close resources
echo "$(date '+%Y-%m-%d %H:%M:%S')       [root]                     Closing resources..." >> logs/root.log
./scripts/root/close-resrcs.sh

# Clean up temporary files
echo "$(date '+%Y-%m-%d %H:%M:%S')       [root]                     Cleaning up temporary files..." >> logs/root.log
./scripts/root/cleanup.sh

echo "[scripts/root/shutdown.sh]         System shutdown complete."
echo "$(date '+%Y-%m-%d %H:%M:%S')       [root]                     System shutdown complete." >> logs/root.log