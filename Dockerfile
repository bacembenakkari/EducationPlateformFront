# Base image for Node.js
FROM node:16

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json first
# Make sure these files exist in your build context
COPY test-app/package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application files
COPY test-app/ .

# Build the React application
RUN npm run build

# Expose the port used by the React application
EXPOSE 3000

# Start the application
CMD ["npm", "start"]