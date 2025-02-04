#!/bin/bash

yum install httpd -y
systemctl enable httpd
systemctl start httpd
echo "this is testing" > /var/www/html/index.html
