# File
## Split
```
g++ -std=c++17 -I./plugins plugins/fileSplit.cpp plugins/prog/prog-split.cpp -o plugins/exec/file-split.exe
./plugins/exec/file-split.exe resources/pwd/rockyou.txt
```


## Join - Merge
```
g++ -std=c++17 -I./plugins plugins/fileJoin.cpp plugins/prog/prog-join.cpp -o plugins/exec/file-join.exe
./plugins/exec/file-join.exe resources/pwd/rockyou.txt resources/pwd/rockyou.txt
```

