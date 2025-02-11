#!/bin/sh

# Change to the app directory
cd /app

# Update dependencies based on the mounted package.json
npm install

# Start the bot with pm2 and monitor for changes
pm2 start $BOT_FILE --watch --no-daemon --merge-logs --log-date-format "YYYY-MM-DD HH:mm Z" --output "/dev/stdout" --error "/dev/stderr"
