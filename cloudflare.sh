#!/bin/bash

output(){
    echo -e '\e[36m'$1'\e[0m';
}

output "Cloudflare IPWhitelist Script for VMmanager 6"
output "Copyright © 2020 Thien Tran <contact@thientran.io>."
output "Support: https://thientran.io/discord"

yum -y install curl
iptables -I DOCKER-USER -p tcp --dport 443 -j DROP
iptables -I DOCKER-USER -p tcp -s $(curl -sSL https://www.cloudflare.com/ips-v4 | paste -d, -s) --dport 443 -j ACCEPT

output "Cloudflare IPv4s have been whitelisted on port 443!"
output "To make this persistent, run this script at startup. It will also update the list of Cloudflare's IPs."
