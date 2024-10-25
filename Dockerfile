FROM centos:latest
LABEL maintainer="ahubballi707@gmail.com"

# Install httpd, zip, and unzip
RUN yum install -y httpd zip unzip && \
    yum clean all

# Add the Creative template zip file
ADD files/creative.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip creative.zip && \
    cp -rvf creative/* . && \
    rm -rf creative creative.zip

# Start httpd in the foreground
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

# Expose port 80
EXPOSE 80
