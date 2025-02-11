#!/bin/sh

# Change to the app directory
cd /app

# Switch to root to install dependencies without a password
sudo /usr/local/bin/npm install

# Switch back to the node user
su node

# Start the bot with pm2 using the ecosystem file
pm2 start /config/ecosystem.config.js --no-daemon