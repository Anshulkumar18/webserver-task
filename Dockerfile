# Use Ubuntu as the base image
FROM ubuntu

# Update package lists and install Apache
RUN apt-get update && \
    apt-get install -y apache2

# Set the ServerName directive to the IP address
RUN echo "ServerName 54.210.183.93" >> /etc/apache2/apache2.conf

# Copy the index.html file to the Apache document root
COPY index.html /var/www/html/

# Expose port 80 for web traffic
EXPOSE 80

# Launch Apache when the container starts
CMD ["apache2ctl", "-D", "FOREGROUND"]
