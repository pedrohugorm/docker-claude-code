# Claude Code Development Environment

This project provides a Docker-based development environment for using Claude Code, Anthropic's AI-powered coding assistant.

## Overview

This setup creates a containerized environment that:
- Installs Claude Code globally in a Node.js container
- Mounts your local development directory for seamless file access
- Provides a persistent development environment
- Enables AI-assisted coding with Claude Code

## Project Structure

```
claude_code/
├── docker-compose.yml    # Docker Compose configuration
├── Dockerfile           # Container definition
├── run.bat             # Windows batch script for quick setup
└── README.md           # This file
```

## Prerequisites

- Docker Desktop installed and running
- Windows 10/11 (this setup is configured for Windows paths)

## Quick Start

### Option 1: Using Docker Compose (Recommended)

1. Navigate to the project directory:
   ```bash
   cd claude_code
   ```

2. Start the development environment:
   ```bash
   docker-compose up -d
   ```

3. Access the container:
   ```bash
   docker-compose exec claude bash
   ```

### Option 2: Using the Batch Script

1. Run the provided batch script:
   ```bash
   run.bat
   ```

This will build the image and start an interactive session.

## Configuration

### Volume Mounts

The setup mounts the following directories:
- `../` → `/code` (your development workspace - **customize this path to where you want the container to access**)
- `./data/` → `/root/.claude` (Claude configuration)
- `./data/claude.json` → `/root/claude.json` (Claude settings)

**Important**: You must modify the volume mount in `docker-compose.yml` to point to your desired code directory. The current setup mounts the parent directory (`../`) to `/code`. Change the `source` path to match where your code is located.

### Environment Variables

- `NODE_ENV=development` - Sets the Node.js environment

## Usage

Once inside the container:

1. Navigate to your code directory:
   ```bash
   cd /code
   ```

2. Use Claude Code commands:
   ```bash
   claude-code --help
   ```

3. Start coding with AI assistance:
   ```bash
   claude-code
   ```

## Customization

### Modifying the Dockerfile

The Dockerfile installs Claude Code globally. You can modify it to:
- Add additional development tools
- Install specific Node.js versions
- Include additional dependencies

### Updating docker-compose.yml

You can customize:
- Volume mounts for different directories
- Environment variables
- Port mappings (if needed)
- Resource limits

## Troubleshooting

### Common Issues

1. **Permission Denied**: Ensure Docker has access to the mounted directories
2. **Path Issues**: Verify Windows paths are correctly formatted in docker-compose.yml
3. **Container Won't Start**: Check Docker Desktop is running and has sufficient resources

### Logs

View container logs:
```bash
docker-compose logs claude
```

## Development Workflow

1. Start the environment with `docker-compose up -d`
2. Access the container with `docker-compose exec claude bash`
3. Navigate to your code directory
4. Use Claude Code for AI-assisted development
5. Changes are automatically synced to your local filesystem

## Cleanup

To stop and remove the container:
```bash
docker-compose down
```

To remove the image:
```bash
docker rmi claude-code
```

## License

This project is for development use. Please refer to Anthropic's terms of service for Claude Code usage. 