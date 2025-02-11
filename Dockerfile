# Use the official Node.js image as the base image
FROM node:latest

# Set the working directory
WORKDIR /app

# Install pm2 and sudo globally as root
RUN apt-get update && apt-get install -y sudo && npm install -g pm2

# Allow the node user to run npm without a password
RUN echo "node ALL=(ALL) NOPASSWD: /usr/local/bin/npm" >> /etc/sudoers

# Copy start.sh to the root of the container
COPY start.sh /start.sh

# Copy the ecosystem configuration file to the config directory
COPY ecosystem.config.js /config/ecosystem.config.js

# Set execute permissions for start.sh
RUN chmod +x /start.sh

# Switch to the node user
USER node

# Set the environment variable for the entry point of the bot, default is entry.js
ENV BOT_FILE=entry.js

# Set the default value for POLLING to false
ENV POLLING false

# Start the application using start.sh
CMD ["sh", "/start.sh"]
