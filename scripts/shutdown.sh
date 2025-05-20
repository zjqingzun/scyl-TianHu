#!/bin/bash


echo "[scripts/shutdown.sh]         Shutting down system..."


# Close resources
./scripts/close-resrcs.sh

# Clean up temporary files
./scripts/cleanup.sh

echo "[scripts/shutdown.sh]         System shutdown complete."