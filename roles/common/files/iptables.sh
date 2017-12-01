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
iptables -P OUTPUT DROP

# v6
ip6tables -P INPUT DROP
ip6tables -P FORWARD DROP
ip6tables -P OUTPUT DROP

#######################################################################

# INPUT
# DOESN'T BREAK ESTABLISHED CONNECTIONS
iptables -A INPUT -m conntrack --ctstate -j ACCEPT

# v6
ip6tables -A INPUT -m conntrack --ctstate -j ACCEPT

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

# OUTPUT
# DOESN'T BREAK ESTABLISHED CONNECTIONS
iptables -A OUTPUT -m conntrack --ctstate ESTABLISHED -j ACCEPT

# v6
ip6tables -A OUTPUT -m conntrack --ctstate ESTABLISHED -j ACCEPT

#######################################################################

# SSH, HTTP, SMTP, DNS, DHCP, NTP, ping
iptables -A OUTPUT -p tcp --dport 22 -j ACCEPT
iptables -A OUTPUT -p tcp --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp --dport smtp -j ACCEPT
iptables -A OUTPUT -p udp --dport 53 -j ACCEPT
iptables -I OUTPUT -p udp --dport 67:68 -j ACCEPT
iptables -A OUTPUT -p udp --dport 123 -j ACCEPT
iptables -A OUTPUT -p icmp -j ACCEPT

# v6
ip6tables -A OUTPUT -p tcp --dport 80 -j ACCEPT
ip6tables -A OUTPUT -p tcp --dport 443 -j ACCEPT
ip6tables -A OUTPUT -p tcp --dport smtp -j ACCEPT
ip6tables -A OUTPUT -p udp --dport 53 -j ACCEPT
ip6tables -A OUTPUT -p udp --dport 123 -j ACCEPT
ip6tables -A OUTPUT -p ipv6-icmp -j ACCEPT

#######################################################################
