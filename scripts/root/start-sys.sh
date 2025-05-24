#!/bin/bash


echo "[scripts/root/start-sys.sh]        Starting system..."
echo "$(date '+%Y-%m-%d %H:%M:%S')       [root]                     Starting system..." >> logs/root.log


# Start the system
echo "[scripts/root/start-sys.sh]        Compile crate cargo module ..."     
cd system/solve/calcul-module
echo "[scripts/root/start-sys.sh]        Running cargo fmt to format code..."
cargo fmt
echo "[scripts/root/start-sys.sh]        Running cargo fix to automatically resolve warnings..."
cargo fix --lib --allow-dirty
cargo build --release


cd ../../../
echo "$(date '+%Y-%m-%d %H:%M:%S')       [root]                     Successfully started the system." >> logs/root.log