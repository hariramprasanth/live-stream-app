# Use a slim Node.js base image
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy your application code
COPY . .

# Expose port
EXPOSE 8080

# Start the server
CMD [ "node", "index.js" ]
