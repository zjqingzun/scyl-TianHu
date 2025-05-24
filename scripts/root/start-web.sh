#!/bin/bash


echo "[scripts/root/start-web.sh]        Executing..."
echo "$(date '+%Y-%m-%d %H:%M:%S')       [root]                     Starting web application..." >> logs/root.log


cd webapp/
npm install
npm run dev


echo "$(date '+%Y-%m-%d %H:%M:%S')       [root]                     Successfully started the web application." >> logs/root.log