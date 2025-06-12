#!/bin/bash

cd ../../request

if ! command -v pyinstaller &> /dev/null
then
    echo "PyInstaller could not be found. Please install it first."
    pip install pyinstaller
    if [ $? -ne 0 ]; then
        echo "Failed to install PyInstaller. Please check your Python and pip installation."
    fi
fi


python -m PyInstaller --noconfirm --onefile --windowed \
  --icon=../resources/public/app-cir.ico \
  server.py

cd ..