#!/bin/bash


echo "[scripts/root/cleanup.sh]          Cleaning up temporary files..."


# Navigate to the project directory
cd ./system/solve/calcul-module
rm -rf ./target
rm -f Cargo.lock
echo "[scripts/root/cleanup.sh]          Cleaned build artifacts from system/solve/calcul-module"
