common
=========

Update system, install base packages (exim, htop…), configure sensible defaults (iptables, fail2ban, unattended-upgrades, SMART & mdadm checks…)

Role Variables
--------------

This role just needs to have an email defined (vars/main.yml) so that alerts can be sent to the admin (smart, mdadm & unattended-upgrades)

email: your@mail.com
