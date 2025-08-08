FROM nginx:alpine

COPY index.html /usr/share/nginx/html

# Exposed the port 80 for the web server
EXPOSE 80
