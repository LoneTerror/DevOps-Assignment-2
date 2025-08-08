# Use an official NGINX runtime as a parent image
FROM nginx:alpine

# Copy the static website's content to the NGINX html folder
COPY index.html /usr/share/nginx/html

# Expose port 80 for the web server
EXPOSE 80