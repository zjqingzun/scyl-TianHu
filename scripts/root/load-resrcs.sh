#!/bin/bash


echo "[scripts/root/load-resrcs.sh]      Starting loading resources..."


# Execute the script in the current directory
# Compile the C++ files
echo "[scripts/root/load-resrcs.sh]      Compiling C++ files..."
echo "$(date '+%Y-%m-%d %H:%M:%S')       [root]                     Compiling C++ file plugins..." >> logs/root.log
g++ -std=c++17 -I./plugins plugins/fileSplit.cpp plugins/prog/prog-split.cpp plugins/log.cpp -o plugins/exec/file-split.exe
g++ -std=c++17 -I./plugins plugins/fileJoin.cpp plugins/prog/prog-join.cpp plugins/log.cpp -o plugins/exec/file-join.exe


echo "[scripts/root/load-resrcs.sh]      Loading resources..."

# Merge the resources
./plugins/exec/file-join.exe resources/pwd/rockyou.txt resources/pwd/rockyou.txt
for file in ./resources/pwd/*rockyou.txt.*; do
  [ -f "$file" ] && echo "[scripts/root/load-resrcs.sh]      Deleted: $file"
done
for file in ./resources/pwd/*rockyou.txt.*; do
  [ -f "$file" ] && rm "$file"
done


echo "$(date '+%Y-%m-%d %H:%M:%S')       [root]                     Successfully loaded resources." >> logs/root.log