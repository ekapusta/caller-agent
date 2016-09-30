FROM dougbtv/asterisk
MAINTAINER Dmitry Romanov "dmitry.romanov85@gmail.com"

RUN ["yum", "install", "-y", "sudo", "wget"]
RUN ["wget", "http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-8.noarch.rpm"]
RUN ["wget", "http://rpms.famillecollet.com/enterprise/remi-release-7.rpm"]
RUN ["rpm", "-Uvh", "remi-release-7*.rpm", "epel-release-7*.rpm"]
RUN ["yum", "install", "--enablerepo=remi-php55", "-y", "php-cli", "php-pgsql", "php-xml"]
RUN curl -s https://getcomposer.org/installer | php
RUN ["mv", "composer.phar", "/usr/local/bin/composer"]
RUN sed -i "s/;date.timezone =.*/date.timezone = Europe\/Moscow/" /etc/php.ini

RUN wget http://sourceforge.net/projects/lame/files/lame/3.99/lame-3.99.tar.gz && \
  tar zxvf lame-3.99.tar.gz && \
  cd lame-3.99 && \
  ./configure && \
  make && \
  make install
