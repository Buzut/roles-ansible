#!/bin/bash

# FLUSH TABLES
iptables -F
iptables -X

# v6
ip6tables -F
ip6tables -X

#######################################################################

# DROP POLICY
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT

# v6
ip6tables -P INPUT DROP
ip6tables -P FORWARD DROP
ip6tables -P OUTPUT ACCEPT

#######################################################################

# INPUT
# DOESN'T BREAK ESTABLISHED CONNECTIONS
iptables -A INPUT -m conntrack --ctstate ESTABLISHED -j ACCEPT

# v6
ip6tables -A INPUT -m conntrack --ctstate ESTABLISHED -j ACCEPT

#######################################################################

# ACCEPT SSH, HTTP, ICMP, LOOPBACK
iptables -A INPUT -p tcp --dport 22 -j ACCEPT
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp --dport 443 -j ACCEPT
iptables -A INPUT -p icmp -j ACCEPT
iptables -A INPUT -i lo -j ACCEPT
iptables -A  OUTPUT -o lo -j ACCEPT

# v6
ip6tables -A INPUT -p tcp --dport 80 -j ACCEPT
ip6tables -A INPUT -p tcp --dport 443 -j ACCEPT
ip6tables -A INPUT -p ipv6-icmp -j ACCEPT
ip6tables -A INPUT -i lo -j ACCEPT
ip6tables -A  OUTPUT -o lo -j ACCEPT

#######################################################################

