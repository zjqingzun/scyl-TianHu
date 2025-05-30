#!/bin/bash


echo "[scripts/root/grant.sh]            Granting ..."




# Root scripts
chmod +x scripts/root/start.sh

chmod +X scripts/root/start-sys.sh
chmod +x scripts/root/start-web.sh
chmod +x scripts/root/start-req.sh

chmod +x scripts/root/load-resrcs.sh

chmod +x scripts/root/close-resrcs.sh

chmod +x scripts/root/cleanup.sh
chmod +x scripts/root/shutdown.sh


# Feature scripts
chmod +x scripts/feature/module-req.sh

chmod +x scripts/feature/syscall/mdle-searchgg.sh



echo "$(date '+%Y-%m-%d %H:%M:%S')       [root]                     Successfully granted permissions to the scripts." >> logs/root.log