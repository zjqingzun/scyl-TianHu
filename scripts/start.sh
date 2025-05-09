#!/bin/bash


echo "scripts/start.sh: Executing..."




# Grant execute permissions to the script
chmod +x scripts/grant.sh
./scripts/grant.sh


# Activate the virtual environment
echo "scripts/start.sh: Executing..."
#./scripts/venv.sh


# Exec the main script
echo "scripts/start.sh: Executing ..."
./scripts/start-web.sh


echo "scripts/start.sh: Executing ..."
#./scripts/start-req.sh