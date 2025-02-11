# Janus

## Background
Janus is a project named after the Roman god Janus, who is the god of beginnings, gates, transitions, time, duality, doorways, passages, and endings. He is usually depicted with two faces, one looking to the future and the other to the past, symbolizing watchfulness and foresight. This name embodies the essence of monitoring and maintaining order, which aligns perfectly with the functionality of this project.

## Usage
Janus is a Docker container designed to run a Node.js bot with pm2, monitoring for code changes and keeping everything in order. Below are the instructions for using Janus.

### Directory Mounting
To use Janus, you must mount your project directory to the `/app` directory in the container. This is where your bot's code will reside.

### Environment Variable
The entry point of the bot is expected to be a file named `entry.js` by default. However, you can override this default by setting an environment variable `BOT_FILE`. For example, if your bot's entry file is `discord.js`, you can set the environment variable accordingly.

### Running the Container
Here is an example of how to run the Janus container with the necessary configurations:

```sh
docker run -v /path/to/your/project:/app -e BOT_FILE=discord.js janus-container

- `/path/to/your/project` is the path to your project directory on the host machine.
- `-v /path/to/your/project:/app` mounts your project directory to the `/app` directory in the container.
- `-e BOT_FILE=discord.js` sets the environment variable to override the default entry point.

### Monitoring with pm2
Once the container is running, pm2 will monitor the bot's files for any changes and automatically restart the bot if necessary. All output from pm2 will be directed to the container's logs.

## Example
Here's a step-by-step example of how to use Janus:

1. Ensure your project directory contains `package.json` and your bot's entry file (e.g., `entry.js` or `discord.js`).
2. Run the container with the following command:
    ```sh
    docker run -v /path/to/your/project:/app -e BOT_FILE=discord.js janus-container
    ```
3. pm2 will start and monitor your bot, ensuring it stays up-to-date with any code changes.

## License
This project is licensed under the MIT License.

This readme has been written by copilot. 
