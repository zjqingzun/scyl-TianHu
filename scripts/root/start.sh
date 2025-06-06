#!/bin/bash


echo "[scripts/root/start.sh]            Check environment variables..."
echo "$(date '+%Y-%m-%d %H:%M:%S')       [root]                     Starting environment check..." >> logs/root.log
echo "[scripts/root/start.sh]            Environment variables: g++"
if command -v g++ &> /dev/null
then
    echo "[scripts/root/start.sh]            g++ is installed"
else
    echo "[scripts/root/start.sh]            g++ is not installed"
    exit 1
fi
echo "[scripts/root/start.sh]            Environment variables: gcc"
if command -v gcc &> /dev/null
then
    echo "[scripts/root/start.sh]            gcc is installed"
else
    echo "[scripts/root/start.sh]            gcc is not installed"
    exit 1
fi
echo "[scripts/root/start.sh]            Environment variables: python"
if command -v python &> /dev/null
then
    echo "[scripts/root/start.sh]            python is installed"
else
    echo "[scripts/root/start.sh]            python is not installed"
    exit 1
fi
echo "[scripts/root/start.sh]            Environment variables: pip"
if command -v pip &> /dev/null
then
    echo "[scripts/root/start.sh]            pip is installed"
else
    echo "[scripts/root/start.sh]            pip is not installed"
    exit 1
fi
echo "[scripts/root/start.sh]            Environment variables: node"
if command -v node &> /dev/null
then
    echo "[scripts/root/start.sh]            node is installed"
else
    echo "[scripts/root/start.sh]            node is not installed"
    exit 1
fi
echo "[scripts/root/start.sh]            Environment variables: npm"
if command -v npm &> /dev/null
then
    echo "[scripts/root/start.sh]            npm is installed"
else
    echo "[scripts/root/start.sh]            npm is not installed"
    exit 1
fi
echo "[scripts/root/start.sh]            Environment variables: rust"
if command -v rustc &> /dev/null
then
    echo "[scripts/root/start.sh]            rust is installed"
else
    echo "[scripts/root/start.sh]            rust is not installed"
    exit 1
fi
echo "[scripts/root/start.sh]            Environment variables: cargo"
if command -v cargo &> /dev/null
then
    echo "[scripts/root/start.sh]            cargo is installed"
else
    echo "[scripts/root/start.sh]            cargo is not installed"
    exit 1
fi
echo "$(date '+%Y-%m-%d %H:%M:%S')       [root]                     Environment check completed successfully." >> logs/root.log


while [[ $# -gt 0 ]]; do
    case "$1" in
        -h|--help)
            echo "[scripts/root/start.sh]            Address: $0"
            echo "[-h|--help]"
            echo "[-s|--system]"
            echo "[-r|--req]"
            echo "[-w|--web]"
            exit 0
            ;;
        -w|--website)
            echo "[scripts/root/start.sh]            Executing the web server..."
            ./scripts/root/start-web.sh
            shift
            ;;
        -r|--request)
            echo "[scripts/root/start.sh]            Executing the request server..."
            ./scripts/root/start-req.sh
            shift
            ;;
        -s|--system)
            echo "[scripts/root/start.sh]            Executing the system ..."
            ./scripts/root/start-sys.sh
            shift
            ;;
        *)
            echo "[scripts/root/start.sh]            Unknown option: $1"
            exit 1
            ;;
    esac
done

