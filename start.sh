#!/bin/sh

# Change to the app directory
cd /app

# Switch to root to install dependencies without a password
sudo /usr/local/bin/npm 

# Switch back to the node user
su node

# Start the bot with pm2 and monitor for changes as node user
pm2 start $BOT_FILE --watch --no-daemon --merge-logs --log-date-format "YYYY-MM-DD HH:mm Z" --output "/dev/stdout" --error "/dev/stderr"
