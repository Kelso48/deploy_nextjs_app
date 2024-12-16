#!/bin/bash

# Install missing utilities
apt-get update -y
apt-get install -y sudo git curl wget gnupg build-essential sed grep tail

# Load NVM (Node Version Manager)
export NVM_DIR=$HOME/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Install Node.js v16 using NVM (if not already installed)
nvm install v16
nvm use v16

# Install Yarn globally if it's not installed
npm install -g yarn

# Navigate to the application directory
cd /home/ubuntu/deploy_nextjs_app

# Pull the latest code from the GitHub repository
git pull origin master

# Install dependencies, build the app, and restart pm2
yarn install &&
yarn build &&
pm2 restart next_hello_world_app
