#!/bin/bash

output(){
    echo -e '\e[36m'$1'\e[0m';
}

output "Cloudflare IPWhitelist Script for VMmanager 6"
output "Copyright © 2020 Thien Tran <contact@thientran.io>."
output "Support: https://thientran.io/discord"

docker exec vm_box iptables -A INPUT -p tcp --dport 443 -j DROP
yum -y install wget
wget https://www.cloudflare.com/ips-v4
for ips in `cat ips-v4`;
do
  docker exec vm_box iptables -I INPUT -p tcp --dport 443 --source $ips -j ACCEPT
done

rm ips-v4

output "Cloudflare IPv4s have been whitelisted on port 443!"
