FROM node:18-alpine

WORKDIR /app

# Copy package.json and package-lock.json if they exist
COPY package*.json ./

# Install dependencies (fallback to creating package.json if it doesn't exist to allow build)
RUN if [ -f package.json ]; then npm install --production; else npm init -y && npm install express; fi

# Copy application code
COPY . .

# Expose port
EXPOSE 8080

# Start command
CMD ["node", "server.js"]
