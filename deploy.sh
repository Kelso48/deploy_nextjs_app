#!/bin/bash

# Update and install basic utilities required for the script to run
sudo apt update
sudo apt install -y git curl coreutils sed grep gnupg

# Load NVM (Node Version Manager)
export NVM_DIR=$HOME/.nvm
. $NVM_DIR/nvm.sh

# Install Node.js v16 if not already installed
nvm install v16
nvm use v16

# Install Yarn globally if it's not installed
npm install -g yarn

# Navigate to the app directory
cd /home/ubuntu/deploy_nextjs_app

# Pull latest code from the repository
git pull origin master

# Install dependencies, build the app, and restart pm2
yarn install &&
yarn build &&
pm2 restart next_hello_world_app
