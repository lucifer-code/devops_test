# Use an official Node.js runtime as a base image
FROM node:16-alpine


# Add a non-root user

# Set the working directory inside the container
WORKDIR '/app'


# Copy the build files (assuming your build files are in a 'build' directo>COPY build/ .

# Install the 'serve' package globally
COPY package.json .

RUN npm install 

# Expose the port on which the 'serve' command will run (default is 5000)
COPY . .

# Define the command to run when the container starts
CMD ["npm", "run", "start"]
