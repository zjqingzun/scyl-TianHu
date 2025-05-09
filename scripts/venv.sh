#!/bin/bash


echo "scripts/venv.sh: Executing..."
VENV="/venv"



# Check if Python is installed
echo "Checking if Python is installed..."
if ! command -v python &> /dev/null; then
    echo "Error: Python is not installed or not in PATH."
    exit 1
fi
python --version

# Create a virtual environment
if [ ! -d "$VENV" ]; then
    echo "Creating virtual environment at $VENV..."
    python -m venv "$VENV"
    if [ $? -ne 0 ]; then
        echo "Error: Failed to create virtual environment."
        exit 1
    fi
fi

# Activate the virtual environment
echo "Activating virtual environment..."
source "$VENV/bin/activate"