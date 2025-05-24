#!/bin/bash


echo "[scripts/root/start-req.sh]        Executing..."
echo "$(date '+%Y-%m-%d %H:%M:%S')       [root]                     Starting request server..." >> logs/root.log




# Executing the script in the current directory
echo "[scripts/root/start-req.sh]        Checking if pip is installed..."
pip --version

echo "[scripts/root/start-req.sh]        🔄 Updating pip..."
python -m pip install --upgrade pip

echo "[scripts/root/start-req.sh]        📦 Installing libraries from requirements.txt..."
pip install -r config/requirements.txt

echo "[scripts/root/start-req.sh]        🚀 Starting the system monitoring software..."
python request/server.py


echo "$(date '+%Y-%m-%d %H:%M:%S')       [root]                     Request server started successfully." >> logs/root.log