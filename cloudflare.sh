#!/bin/bash

output(){
    echo -e '\e[36m'$1'\e[0m';
}

output "Cloudflare IPWhitelist Script for VMmanager 6"
output "Copyright © 2020 Thien Tran <contact@thientran.io>."
output "Support: https://thientran.io/discord"

yum -y install wget
wget https://www.cloudflare.com/ips-v4
iptables -I DOCKER-USER -p tcp --dport 443 -j DROP
iptables -I DOCKER-USER -p tcp -s $(paste -d, -s ips-v4) --dport 443 -j ACCEPT
rm ips-v4

output "Cloudflare IPv4s have been whitelisted on port 443!"
output "To make this persistent, run this script at startup. It will also update the list of Cloudflare's IPs."
