#!/bin/bash


echo "scripts/start-req.sh: Executing..."




# Executing the script in the current directory
echo "Checking if pip is installed..."
pip --version

echo "🔄 Updating pip..."
python -m pip install --upgrade pip

echo "📦 Installing libraries from requirements.txt..."
pip install -r config/requirements.txt

echo "🚀 Starting the system monitoring software..."
python request/main.py
