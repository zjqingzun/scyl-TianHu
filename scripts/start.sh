#!/bin/bash


echo "[scripts/start.sh]            Executing..."



while [[ $# -gt 0 ]]; do
    case "$1" in
        -h|--help)
            echo "[scripts/start.sh]            Address: $0"
            echo "[-h|--help]"
            echo "[-s|--system]"
            echo "[-r|--req]"
            echo "[-w|--web]"
            exit 0
            ;;
        -w|--website)
            echo "[scripts/start.sh]            Executing ..."
            ./scripts/start-web.sh
            shift
            ;;
        -r|--request)
            echo "[scripts/start.sh]            Executing ..."
            ./scripts/start-req.sh
            shift
            ;;
        -s|--system)
            echo "[scripts/start.sh]            Executing ..."
            ./scripts/start-sys.sh
            shift
            ;;
        *)
            echo "[scripts/start.sh]            Unknown option: $1"
            exit 1
            ;;
    esac
done