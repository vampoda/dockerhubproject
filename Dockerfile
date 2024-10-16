# Stage 1: Build
FROM node:18 AS builder

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json (if it exists)
COPY package*.json ./

# Install production dependencies
RUN npm install --production

# Copy the rest of your application code
COPY . .

# Stage 2: Run
FROM node:18-slim

# Set the working directory
WORKDIR /app

# Copy built files from the builder stage
COPY --from=builder /app .

# Expose the port the app runs on
EXPOSE 3000

# Command to run the app using npm
CMD ["npm", "start"]
