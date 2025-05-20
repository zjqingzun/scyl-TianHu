#!/bin/bash


echo "[scripts/load-resrcs.sh]      Starting loading resources..."


# Execute the script in the current directory
# Compile the C++ files
echo "[scripts/load-resrcs.sh]      Compiling C++ files..."
g++ -std=c++17 -I./plugins plugins/fileSplit.cpp plugins/prog/prog-split.cpp -o plugins/exec/file-split.exe
g++ -std=c++17 -I./plugins plugins/fileJoin.cpp plugins/prog/prog-join.cpp -o plugins/exec/file-join.exe


echo "[scripts/load-resrcs.sh]      Loading resources..."

# Merge the resources
./plugins/exec/file-join.exe resources/pwd/rockyou.txt resources/pwd/rockyou.txt
for file in ./resources/pwd/*rockyou.txt.*; do
  [ -f "$file" ] && echo "[scripts/load-resrcs.sh]      Deleted: $file"
done
for file in ./resources/pwd/*rockyou.txt.*; do
  [ -f "$file" ] && rm "$file"
done