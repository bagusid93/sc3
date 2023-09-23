#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
#########################
red='\e[1;31m'
green='\e[0;32m'
yell='\e[1;33m'
tyblue='\e[1;36m'
NC='\e[0m'
purple() { echo -e "\\033[35;1m${*}\\033[0m"; }
tyblue() { echo -e "\\033[36;1m${*}\\033[0m"; }
yellow() { echo -e "\\033[33;1m${*}\\033[0m"; }
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }

echo -e "$green      Please select a domain type below               $NC"
echo  ""
tyblue "    1 : Enter your Subdomain & Nsdomain"
tyblue "    2 : Use a random Subdomain & Nsdomain"
echo ""
read -p "   Please select numbers 1-2 or Any Button(Random) : " host
echo ""
if [[ $host == "1" ]]; then
read -rp "Enter Your Domain / masukan domain : " pp
echo "IP=$pp" > /var/lib/ipvps.conf
echo "$pp" > /root/domain
echo "$pp" > /root/scdomain
echo "$pp" > /etc/xray/domain
echo "$pp" > /etc/v2ray/domain
echo "$pp" > /etc/xray/scdomain
echo ""
elif [[ $host == "2" ]]; then
#install Domain
wget https://raw.githubusercontent.com/bagusid93/sc3/main/ssh/cf.sh && chmod +x cf.sh && ./cf.sh
rm -f /root/cf.sh
clear
else
echo -e "Random Subdomain/Domain is used"
wget https://raw.githubusercontent.com/bagusid93/sc3/main/ssh/cf.sh && chmod +x cf.sh && ./cf.sh
rm -f /root/cf.sh
fi
echo ""
sleep 3
certv2ray
