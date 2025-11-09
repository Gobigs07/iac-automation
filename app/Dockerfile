# Use lightweight Node.js base image
FROM node:18-alpine

# Set working directory
WORKDIR /usr/src/app

# Copy application files
COPY app.js .
# Install required dependencies
RUN npm install express redis

# Expose application port
EXPOSE 3003

# Start the app
CMD ["node", "app.js"]
