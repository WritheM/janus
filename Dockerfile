# Use the official Node.js image as the base image
FROM node:latest

# Set the working directory
WORKDIR /app

# Install pm2 globally
RUN npm install -g pm2

# Copy start.sh to the root of the container
COPY start.sh /start.sh

# Set the environment variable for the entry point of the bot, default is entry.js
ENV BOT_FILE=entry.js

# Switch to the node user
USER node

# Start the application using start.sh
CMD ["sh", "/start.sh"]
