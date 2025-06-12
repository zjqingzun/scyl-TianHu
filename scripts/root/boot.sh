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

while [[ $# -gt 0 ]]; do
    case $1 in
        -s|--system)
            ./scripts/root/start.sh -s
            shift
            ;;
        -r|--request)
            ./scripts/root/start.sh -r
            shift
            ;;
        -w|--website)
            ./scripts/root/start.sh -w
            shift
            ;;
        -h|--help)
            echo "[scripts/root/boot.sh]             Usage: $0 [-s|--system] [-r|--request] [-w|--website] [-h|--help]"
            echo "[-s|--system]   Start the system server"
            echo "[-r|--request]  Start the request server"
            echo "[-w|--website]  Start the web server"
            echo "[-h|--help]     Show this help message"
            exit 0
            ;;
        *)
            echo "[scripts/root/boot.sh]             Invalid option: $1"
            echo "$(date '+%Y-%m-%d %H:%M:%S')       [root]                     Invalid option: $1" >> logs/root.log
            echo "[scripts/root/boot.sh]             Use -h or --help for usage information."
            exit 1
            ;;
    esac
done

# Shutdown the program
echo "[scripts/root/boot.sh]             Shutting down the program..."
echo "$(date '+%Y-%m-%d %H:%M:%S')       [root]                     Shutting down the program..." >> logs/root.log
./scripts/root/shutdown.sh