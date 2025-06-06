#!/bin/bash


echo "[scripts/root/close-resrcs.sh]     Closing resources..."


# Execute the script in the current directory
./plugins/exec/file-split.exe resources/pwd/rockyou.txt
rm ./resources/pwd/rockyou.txt