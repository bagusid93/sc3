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
#########################

clear
echo -e "$green      Please select a Nsdomain type below               $NC"
echo  ""
tyblue "    1 : Enter your Nsdomain"
tyblue "    2 : Use a random Nsdomain"
echo ""
read -p "   Please select numbers 1-2 or Any Button(Random) : " host
echo ""
if [[ $host == "1" ]]; then
read -rp "Input ur ns-domain : " -e nsdomen
echo "$nsdomen" > /etc/xray/dns
echo "$nsdomen" > /root/nsdomain
echo ""
elif [[ $host == "2" ]]; then
#install NameServer
wget https://raw.githubusercontent.com/bagusid93/sc3/main/slowdns/ns-domain.sh && chmod +x ns-domain.sh && ./ns-domain.sh
rm -f /root/ns-domain.sh
clear
else
echo -e "Random Nsdomain/Nsdomain is used"
wget https://raw.githubusercontent.com/bagusid93/sc3/main/slowdns/ns-domain.sh && chmod +x ns-domain.sh && ./ns-domain.sh
rm -f /root/ns-domain.sh
fi
menu
