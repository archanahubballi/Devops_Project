FROM centos:latest
LABEL maintainer="ahubballi707@gmail.com"

# Install httpd, zip, and unzip
RUN yum install -y httpd zip unzip && \
    yum clean all

# Download and extract the template
ADD https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip  /var/www/html/
WORKDIR /var/www/html/
RUN unzip photogenic.zip && \
    cp -rvf photogenic/* . && \
    rm -rf photogenic photogenic.zip

# Start httpd in the foreground
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

# Expose ports
EXPOSE 80 22
