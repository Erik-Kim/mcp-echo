# Use Node.js 20 Alpine
FROM node:20-alpine

# Create app directory
WORKDIR /app

# Copy package files
COPY package.json ./

# Install TypeScript globally and install dependencies
RUN npm install

# Copy source code
COPY . .

# Build TypeScript code
RUN npm run build

# Set the entrypoint to run the MCP server
ENTRYPOINT ["node", "dist/index.js"] 