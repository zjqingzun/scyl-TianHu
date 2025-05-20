#!/bin/bash


echo "[scripts/start-req.sh]        Executing..."




# Executing the script in the current directory
echo "[scripts/start-req.sh]        Checking if pip is installed..."
pip --version

echo "[scripts/start-req.sh]        🔄 Updating pip..."
python -m pip install --upgrade pip

echo "[scripts/start-req.sh]        📦 Installing libraries from requirements.txt..."
pip install -r config/requirements.txt

echo "[scripts/start-req.sh]        🚀 Starting the system monitoring software..."
python request/main.py
