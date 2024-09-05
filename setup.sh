#!/bin/bash

REPO_URL="https://github.com/AtulMalakar/Dockie.git"
REPO_DIR="/app/Dockie"

if [ -d "$REPO_DIR" ]; then
    echo "Repository already exists. Pulling latest changes..."
    cd $REPO_DIR
    git pull origin main
else
    echo "Cloning the repository..."
    git clone -b main $REPO_URL $REPO_DIR
fi
