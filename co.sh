#!/bin/bash
#Script By Julak Bantur
#Hss-Punya
###########- COLOR CODE -##############
colornow=$(cat /etc/julak/theme/color.conf)
NC="\e[0m"
RED="\033[0;31m"
COLOR1="$(cat /etc/julak/theme/$colornow | grep -w "TEXT" | cut -d: -f2|sed 's/ //g')"
COLBG1="$(cat /etc/julak/theme/$colornow | grep -w "BG" | cut -d: -f2|sed 's/ //g')"
WH='\033[1;37m'
###########- END COLOR CODE -##########

clear
portsshws=`cat ~/log-install.txt | grep -w "SSH Websocket" | cut -d: -f2 | awk '{print $1}'`
wsssl=`cat /root/log-install.txt | grep -w "SSH SSL Websocket" | cut -d: -f2 | awk '{print $1}'`
author=$(cat /etc/profil)
IP=$(curl -sS ifconfig.me);
ossl=`cat /root/log-install.txt | grep -w "OpenVPN" | cut -f2 -d: | awk '{print $6}'`
opensh=`cat /root/log-install.txt | grep -w "OpenSSH" | cut -f2 -d: | awk '{print $1}'`
db=`cat /root/log-install.txt | grep -w "Dropbear" | cut -f2 -d: | awk '{print $1,$2}'`
ssl="$(cat ~/log-install.txt | grep -w "Stunnel4" | cut -d: -f2)"
sqd="$(cat ~/log-install.txt | grep -w "Squid" | cut -d: -f2)"
ovpn="$(netstat -nlpt | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
ovpn2="$(netstat -nlpu | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
domen=`cat /etc/v2ray/domain`
sldomain=`cat /etc/xray/dns`
slkey=`cat /etc/slowdns/server.pub`
OhpSSH=`cat /root/log-install.txt | grep -w "OHP SSH" | cut -d: -f2 | awk '{print $1}'`
OhpDB=`cat /root/log-install.txt | grep -w "OHP DBear" | cut -d: -f2 | awk '{print $1}'`
OhpOVPN=`cat /root/log-install.txt | grep -w "OHP OpenVPN" | cut -d: -f2 | awk '{print $1}'`

clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1${NC}${COLBG1}              ${WH}• SELECT USERS •             ${NC}$COLOR1$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo ""	
echo "  Select the existing client you want to Delete"
echo "  Press CTRL+C to return"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
grep -E "^### " "/etc/xray/ssh" | cut -d ' ' -f 2-3 | nl -s ') '
until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
if [[ ${CLIENT_NUMBER} == '1' ]]; then
read -rp "Select one client [1]: " CLIENT_NUMBER
else
read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
fi
done
Login=$(grep -E "^### " "/etc/xray/ssh" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^### " "/etc/xray/ssh" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
Pass=$(grep -E "^###" "/etc/xray/ssh" | cut -d ' ' -f 4 | sed -n "${CLIENT_NUMBER}"p)

echo -e "$COLOR1─────────────────${NC}" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 ${NC}${COLBG1}    ${WH}• Ssh Ovpn Account •           ${NC} $COLOR1 $NC" | tee -a /etc/log-create-user.log
echo -e "$COLOR1─────────────────${NC}" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC ${WH}Username   ${COLOR1}: ${WH}$Login"  | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC ${WH}Password   ${COLOR1}: ${WH}$Pass" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC ${WH}Expired On ${COLOR1}: ${WH}$exp"  | tee -a /etc/log-create-user.log
echo -e "$COLOR1─────────────────${NC}" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC ${WH}IP               ${COLOR1}: ${WH}$IP" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC ${WH}Host             ${COLOR1}: ${WH}$domen" | tee -a /etc/log-create-user.log
#echo -e "$COLOR1 $NC ${WH}Wildcard   ${COLOR1}: ${WH}(bug.com).$domen" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC ${WH}OpenSSH          ${COLOR1}: ${WH}$opensh" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC ${WH}Dropbear         ${COLOR1}: ${WH}$db" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC ${WH}Port SSH UDP     ${COLOR1}: ${WH}1-65535" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC ${WH}Port SSH WS      ${COLOR1}: ${WH}80" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC ${WH}Port SSH WS/SSL  ${COLOR1}: ${WH}$wsssl" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC ${WH}Port SSH SSL/TLS ${COLOR1}: ${WH}447,8443" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC ${WH}Port Ovpn TCP    ${COLOR1}: ${WH}$ovpn" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC ${WH}Port Ovpn UDP    ${COLOR1}: ${WH}$ovpn2" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC ${WH}Port Ovpn SSL    ${COLOR1}: ${WH}990" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC ${WH}OVPN TCP         ${COLOR1}: ${WH}http://$domen:81/tcp.ovpn" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC ${WH}OVPN UDP         ${COLOR1}: ${WH}http://$domen:81/udp.ovpn" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC ${WH}OVPN SSL         ${COLOR1}: ${WH}http://$domen:81/ssl.ovpn" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC ${WH}UDPGW            ${COLOR1}: ${WH}7100-7900" | tee -a /etc/log-create-user.log
echo -e "$COLOR1─────────────────${NC}" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC ${WH}PORT SLWDNS     ${COLOR1}: ${WH}80,443,53"
echo -e "$COLOR1 $NC ${WH}NAMESERVER      ${COLOR1}: ${WH}$sldomain"
#echo -e "$COLOR1 $NC  ${WH}NAMESERVER ${COLOR1}: ${WH}$nameserver"
echo -e "$COLOR1 $NC ${WH}PUB KEY         ${COLOR1}: ${WH}$slkey"
#echo -e "$COLOR1 $NC  ${WH}NAMESERVER ${COLOR1}: ${WH}$nameserver1"
#echo -e "$COLOR1 $NC  ${WH}PUB KEY    ${COLOR1}: ${WH}$slkey1"
echo -e "$COLOR1─────────────────${NC}" | tee -a /etc/log-create-user.log
echo -e "$COLOR1${NC}${WH}Payload WSS :                                      ${NC}" | tee -a /etc/log-create-user.log
echo -e "$COLOR1${NC}${WH}GET wss://$domen/ [protocol][crlf]Host: bug.mu[crlf]Upgrade: websocket[crlf][crlf]${NC}" | tee -a /etc/log-create-user.log
echo -e "$COLOR1─────────────────${NC}" | tee -a /etc/log-create-user.log
echo -e "$COLOR1${NC}${WH}Payload WS :                  ${NC}" | tee -a /etc/log-create-user.log
echo -e "$COLOR1${NC}${WH}GET / HTTP/1.1[crlf]Host: $domen[crlf]Upgrade: websocket[crlf][crlf]${NC}" | tee -a /etc/log-create-user.log
echo -e "$COLOR1─────────────────${NC}" | tee -a /etc/log-create-user.log
echo -e "$COLOR1┌────────────────────┐${NC}" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 ${NC}  ${WH}• $author •${NC}    $COLOR1 $NC" | tee -a /etc/log-create-user.log
echo -e "$COLOR1└────────────────────┘${NC}" | tee -a /etc/log-create-user.log
read -n 1 -s -r -p "   Press any key to back on menu"
menu-ssh
