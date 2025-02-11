#!/bin/sh

# Change to the app directory
cd /app

# Switch to root to install dependencies without a password
sudo /usr/local/bin/npm install

# Switch back to the node user
su node

# Determine if polling should be used based on the environment variable
if [ "$POLLING" = "true" ]; then
  WATCH_OPTIONS='--watch --watch-options={"usePolling":true}'
else
  WATCH_OPTIONS='--watch'
fi

# Start the bot with pm2 and monitor for changes as node user, optionally enabling polling
pm2 start $BOT_FILE $WATCH_OPTIONS --no-daemon --merge-logs --log-date-format "YYYY-MM-DD HH:mm Z" --output "/dev/stdout" --error "/dev/stderr"
