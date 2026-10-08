# VS Code on Railway

A browser-based VS Code development environment running on Railway with persistent project storage.

## Features

- **Browser-based VS Code** — Access your IDE from any device with a browser
- **Persistent storage** — Code in `/home/coder/project` survives redeployments
- **Pre-installed tools** — Python, Node.js, Git, and build essentials included
- **VS Code extensions** — Python and Prettier pre-installed from Open VSX
- **Built-in terminal** — Full shell access with real Linux environment
- **App preview** — Built-in browser panel to preview running apps
- **Cost-effective** — Pay only for what you use; idle environments are cheap

## Quick Start

### Prerequisites
- A [Railway](https://railway.app) account
- This GitHub repository

### Deployment Steps

1. **Create a Railway Project**
   - Go to [railway.app](https://railway.app) and create a new project
   - Select "Deploy from GitHub repo"
   - Connect and select this repository
   - Railway will automatically detect and build the Dockerfile

2. **Configure Environment Variables**
   - Add `PASSWORD` — Set a strong password for VS Code login
   - Add `RAILWAY_RUN_UID = 0` — Allows the container to write to the volume

3. **Set Up Networking**
   - Go to Settings → Networking
   - Click "Generate Domain"
   - Set the port to `8080`

4. **Attach Persistent Storage**
   - Right-click the service
   - Select "Attach Volume"
   - Mount path: `/home/coder/project`
   - Choose storage size (10GB recommended for most use cases)

5. **Access Your Environment**
   - Open the generated domain in your browser
   - Log in with the password you set
   - Start coding!

## What Persists Across Redeployments

✅ **Kept:** Everything in `/home/coder/project` and all tools in the Dockerfile
❌ **Lost:** Packages installed via terminal (e.g., `apt install`, `pip install`)

To permanently add tools, update the Dockerfile and push to this repository.

## Usage Tips

### Preview Running Apps
```bash
# Start your app on a port, e.g., 3000
node server.js  # or npm start, python -m http.server 3000, etc.

# Access it at: https://your-domain.railway.app/proxy/3000/
```

### Open Built-in Browser
- Command Palette (`Ctrl+Shift+P` or `Cmd+Shift+P`)
- Run: `Simple Browser: Show`
- Paste any URL

### Terminal Access
- Click the Terminal tab or press `` Ctrl+` `` (backtick)
- Full bash shell with root access (when needed)

## Installed Tools

- **System:** build-essential, git
- **Languages:** Python 3, Node.js, npm
- **VS Code Extensions:** Python, Prettier

## Customization

Edit the `Dockerfile` to add more tools, extensions, or dependencies. After pushing changes to this repository, Railway will automatically rebuild.

### Example: Add a Python Package
```dockerfile
USER coder
RUN pip install numpy pandas flask
```

### Example: Add Another VS Code Extension
```dockerfile
RUN code-server --install-extension golang.go
```

## Pricing

Railway charges based on compute and storage usage:
- **Idle code-server:** ~$0.10-0.20/day (minimal CPU, modest memory)
- **Active development:** ~$0.50-2.00/day (depends on usage)
- **Storage:** $0.10/GB/month

**Tip:** Delete the service when you're done to avoid ongoing charges.

## Troubleshooting

### Can't Write to Project Directory
- Ensure `RAILWAY_RUN_UID = 0` is set in environment variables
- Redeploy after changing the variable

### Extensions Won't Install
- Open the VS Code terminal and run:
  ```bash
  code-server --install-extension <extension-id>
  ```
- Restart the container if needed

### Port Conflicts
- If port 8080 is in use, change it in the Networking settings
- Update the Dockerfile EXPOSE directive if needed

## License

See [LICENSE](LICENSE) for details.

## Contributing

Contributions are welcome! Please submit issues and pull requests on GitHub.

---

**Ready to code?** Push the generated Railway domain to your browser and start building.
