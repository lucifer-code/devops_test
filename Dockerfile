# Stage 1: Use an official Node.js runtime as a base image
FROM node:16-alpine as builder

# Add a non-root user
# RUN adduser -D appuser

# Set the working directory inside the container
WORKDIR /app

COPY package.json .
# Copy the build files (assuming your build files are in a 'build' directory)
RUN npm install
COPY . .

# Install the 'serve' package globally
RUN npm run build

# Stage 2: Use Nginx as the final base image
FROM nginx

# Copy the built files from the builder stage into the nginx 'html' directory
COPY --from=builder /app/build /usr/share/nginx/html

# Expose the port on which the 'serve' command will run (default is 5000)
# EXPOSE 80
