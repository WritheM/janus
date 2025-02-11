module.exports = {
  apps: [
    {
      name: "node-bot",
      script: process.env.BOT_FILE || "entry.js",
      watch: true,
      watch_options: {
        usePolling: process.env.POLLING === "true"
      },
      merge_logs: true,
      log_date_format: "YYYY-MM-DD HH:mm Z",
      output: "/dev/stdout",
      error: "/dev/stderr"
    }
  ]
};
