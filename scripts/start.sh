#!/bin/bash


echo "[scripts/start.sh]            Check environment variables..."
echo "[scripts/start.sh]            Environment variables: g++"
if command -v g++ &> /dev/null
then
    echo "[scripts/start.sh]            g++ is installed"
else
    echo "[scripts/start.sh]            g++ is not installed"
    exit 1
fi
echo "[scripts/start.sh]            Environment variables: gcc"
if command -v gcc &> /dev/null
then
    echo "[scripts/start.sh]            gcc is installed"
else
    echo "[scripts/start.sh]            gcc is not installed"
    exit 1
fi
echo "[scripts/start.sh]            Environment variables: python"
if command -v python &> /dev/null
then
    echo "[scripts/start.sh]            python is installed"
else
    echo "[scripts/start.sh]            python is not installed"
    exit 1
fi
echo "[scripts/start.sh]            Environment variables: pip"
if command -v pip &> /dev/null
then
    echo "[scripts/start.sh]            pip is installed"
else
    echo "[scripts/start.sh]            pip is not installed"
    exit 1
fi
echo "[scripts/start.sh]            Environment variables: node"
if command -v node &> /dev/null
then
    echo "[scripts/start.sh]            node is installed"
else
    echo "[scripts/start.sh]            node is not installed"
    exit 1
fi
echo "[scripts/start.sh]            Environment variables: npm"
if command -v npm &> /dev/null
then
    echo "[scripts/start.sh]            npm is installed"
else
    echo "[scripts/start.sh]            npm is not installed"
    exit 1
fi
echo "[scripts/start.sh]            Environment variables: rust"
if command -v rustc &> /dev/null
then
    echo "[scripts/start.sh]            rust is installed"
else
    echo "[scripts/start.sh]            rust is not installed"
    exit 1
fi
echo "[scripts/start.sh]            Environment variables: cargo"
if command -v cargo &> /dev/null
then
    echo "[scripts/start.sh]            cargo is installed"
else
    echo "[scripts/start.sh]            cargo is not installed"
    exit 1
fi



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
            echo "[scripts/start.sh]            Executing the web server..."
            ./scripts/start-web.sh
            shift
            ;;
        -r|--request)
            echo "[scripts/start.sh]            Executing the request server..."
            ./scripts/start-req.sh
            shift
            ;;
        -s|--system)
            echo "[scripts/start.sh]            Executing the system ..."
            ./scripts/start-sys.sh
            shift
            ;;
        *)
            echo "[scripts/start.sh]            Unknown option: $1"
            exit 1
            ;;
    esac
done