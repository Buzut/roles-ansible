letsencrypt
=========

Install certbot and configure auto cert renew. Directly install certs if asked to do so (see variables)


Role Variables
--------------

A description of the settable variables for this role should go here, including any variables that are in defaults/main.yml, vars/main.yml, and any variables that can/should be set via parameters to the role. Any variables that are read from other roles and/or the global scope (ie. hostvars, group vars, etc.) should be mentioned here as well.

This role needs to know which type of webserver (service name) will be used so that it can stop/start the server when renewing certs.
It will install certs if withCerts: true. For it to install certs, domains dict has to be overriden with actual domains (and DNS must be properly configured)

There is also an email var which has to be set in vars/main.yml

vars:
  webserverType: apache2
  withCerts: false

  # fake dict to avoid complaint from letsencrypt Install certs
  domains:
    bullshit:
      address: "fake.domain.boobs"
