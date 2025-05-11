#!/bin/bash


echo "scripts/start.sh: Executing..."




# Grant execute permissions to the script
chmod +x scripts/grant.sh
./scripts/grant.sh


# Activate the virtual environment
echo "scripts/start.sh: Executing..."
./scripts/venv.sh


while [[ $# -gt 0 ]]; do
    case "$1" in
        -h|--help)
            echo "Address: $0"
            echo "[-h|--help]"
            echo "[-w|--web]"
            echo "[-r|--req]"
            exit 0
            ;;
        -w|--web)
            echo "scripts/start.sh: Executing ..."
            ./scripts/start-web.sh
            shift
            ;;
        -r|--req)
            echo "scripts/start.sh: Executing ..."
            ./scripts/start-req.sh
            shift
            ;;
        *)
            echo "Unknown option: $1"
            exit 1
            ;;
    esac
done