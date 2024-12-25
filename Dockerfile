# Use the official Node.js image as the base image
FROM node:16

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and install dependencies (if needed)
COPY package*.json ./  

# Set up the project files (HTML, CSS, JS)
COPY . .

# Install dependencies (if any, like express)
RUN npm install

# Expose the port the app will run on (3000 in this case)
EXPOSE 3000

# Start the Node.js server
CMD ["node", "server.js"]
