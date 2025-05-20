#!/bin/bash


echo "[scripts/start-sys.sh]        Starting system..."


# Start the system
echo "[scripts/start-sys.sh]        Compile crate cargo module ..."     
cd system/solve/calcul-module
echo "[scripts/start-sys.sh]        Running cargo fmt to format code..."
cargo fmt
echo "[scripts/start-sys.sh]        Running cargo fix to automatically resolve warnings..."
cargo fix --lib --allow-dirty
cargo build --release