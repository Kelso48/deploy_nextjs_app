#!/bin/bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

cd /home/ubuntu/deploy_nextjs_app
git pull origin master
nvm use v16
export PATH="$PATH:$(yarn global bin)"
yarn install &&
yarn build &&
pm2 restart next_hello_world_app
