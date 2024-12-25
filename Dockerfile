# Use a base image (e.g., Nginx for serving static files)
FROM nginx:alpine

# Set working directory inside the container
WORKDIR /usr/share/nginx/html

# Copy static files to the Nginx default static directory
COPY public/index.html /usr/share/nginx/html/
COPY public/style.css /usr/share/nginx/html/
COPY public/server.js /usr/share/nginx/html/

# Expose port 80 for the Nginx server
EXPOSE 80

# Add a HEALTHCHECK to monitor application health
HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
  CMD curl -f http://localhost:80 || exit 1

# Start Nginx (default CMD for nginx:alpine)
