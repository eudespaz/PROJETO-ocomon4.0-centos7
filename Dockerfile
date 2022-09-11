FROM centos:7
RUN yum update -y && yum install httpd httpd-tools -y 
RUN yum install epel-release yum-utils -y \
&& yum install -y http://rpms.remirepo.net/enterprise/remi-release-7.rpm \
&& yum-config-manager --enable remi-php74 \
&& yum install -y php php-common php-opcache php-mcrypt php-cli php-gd php-curl php-mysql php-mbstring php-gettext \
&& yum clean all; systemctl enable httpd.service
COPY ocomon-4.0 /var/www/html/ocomon-4.0
COPY httpd.conf /etc/httpd/conf/httpd.conf
EXPOSE 80
CMD ["/usr/sbin/httpd","-D","FOREGROUND"]