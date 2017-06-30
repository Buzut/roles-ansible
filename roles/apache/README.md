apache
=========

Install Apache2 httpd server and afferent vhost if required.

Role Variables
--------------

If this role is meant to install a vhost (all vhosts in one file), withVhost needs to be set to true into var/main.yml and vhostName needs to be defined. 

As an exemple, for a vhost files/myblog.conf, vhostName would be myblog.

withVhost: true
vhostName: myblog
