#!/bin/bash


echo "[scripts/feature/module-req.sh]    Granting permissions for module request scripts ..."
echo "$(date '+%Y-%m-%d %H:%M:%S')       [sys]                       Granting permissions for module request scripts..." >> logs/sys.log


# Executing the script in the current directory
echo "[scripts/feature/module-req.sh]    Checking if pip is installed..."
pip --version

echo "[scripts/feature/module-req.sh]    🔄 Updating pip..."
python -m pip install --upgrade pip

echo "[scripts/feature/module-req.sh]    📦 Installing libraries from requirements.txt..."
pip install -r request/module/requirements.txt


echo "${date '+%Y-%m-%d %H:%M:%S'}       [sys]                       Module request scripts permissions granted successfully." >> logs/sys.log