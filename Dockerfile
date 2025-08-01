FROM node

# Set working directory
WORKDIR /code

# Install claude-code globally to make it available in PATH
RUN npm install -g @anthropic-ai/claude-code

# The container will wait for commands when run
CMD ["/bin/bash"]