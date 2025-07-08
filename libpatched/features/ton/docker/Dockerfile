# TON Bridge Docker Configuration
FROM node:18-alpine

# Install Python and build dependencies
RUN apk add --no-cache python3 make g++ git

# Create app directory
WORKDIR /app

# Install Matrix bridge dependencies
RUN npm install -g matrix-appservice-bridge

# Copy bridge configuration
COPY bridge/ ./bridge/
COPY package.json ./
COPY package-lock.json ./

# Install dependencies
RUN npm install

# Copy bridge source code
COPY src/ ./src/

# Create data directory
RUN mkdir -p /data

# Set permissions
RUN chown -R node:node /app /data
USER node

# Expose bridge port
EXPOSE 8080

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
  CMD curl -f http://localhost:8080/health || exit 1

# Start the bridge
CMD ["node", "src/index.js", "-c", "bridge/ton_bridge_config.yaml", "-r", "bridge/ton_bridge_registration.yaml"]
