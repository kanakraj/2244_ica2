# Use the official Ubuntu base image
FROM ubuntu:latest

# Update the package manager and install Nginx
RUN apt-get update && apt-get install -y nginx

# Copy static website files to the Nginx default directory
COPY static-website/ /var/www/html/

# Expose the default HTTP port
EXPOSE 80

# Start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]


