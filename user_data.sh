#!/bin/bash
yum update
amazon-linux-extras install nginx1
chkconfig nginx on
service nginx start