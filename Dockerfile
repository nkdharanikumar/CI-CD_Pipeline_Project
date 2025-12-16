# Use official Nginx image
FROM nginx:alpine

# Remove default nginx static files
RUN rm -rf /usr/share/nginx/html/*

# Copy your static site into Nginx web root
COPY . /usr/share/nginx/html

# Nginx already listens on port 80
EXPOSE 80
