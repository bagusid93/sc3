#!/bin/bash
# //====================================================
# //	System Request:Debian 9+/Ubuntu 18.04+/20+
# //	Author:	Julak-Bantur
# //	Dscription: Xray Menu Management
# //	email: papadaanhss93@gmail.com
# //  telegram: https://t.me/Cibut2d
# //====================================================
# // font color configuration | PAPADA'AN STORE AUTOSCRIPT
ateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
#########################
colornow=$(cat /etc/julak/theme/color.conf)
NC="\e[0m"
RED="\033[0;31m"
COLOR1="$(cat /etc/julak/theme/$colornow | grep -w "TEXT" | cut -d: -f2|sed 's/ //g')"
COLBG1="$(cat /etc/julak/theme/$colornow | grep -w "BG" | cut -d: -f2|sed 's/ //g')"
WH='\033[1;37m'

# // Exporting Language to UTF-8
BIBlack='\033[1;90m'      # Black
BIRed='\033[1;91m'        # Red
BIGreen='\033[1;92m'      # Green
BIYellow='\033[1;93m'     # Yellow
BIBlue='\033[1;94m'       # Blue
BIPurple='\033[1;95m'     # Purple
BICyan='\033[1;96m'       # Cyan
BIWhite='\033[1;97m'      # White
UWhite='\033[4;37m'       # White
On_IPurple='\033[0;105m'  #
On_IRed='\033[0;101m'
IBlack='\033[0;90m'       # Black
IRed='\033[0;91m'         # Red
IGreen='\033[0;92m'       # Green
IYellow='\033[0;93m'      # Yellow
IBlue='\033[0;94m'        # Blue
IPurple='\033[0;95m'      # Purple
ICyan='\033[0;96m'        # Cyan
IWhite='\033[0;97m'       # White

RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
Font="\033[0m"
gray="\e[1;30m"
###########- END COLOR CODE -##########

cekray=`cat /root/log-install.txt | grep -ow "XRAY" | sort | uniq`
total_ram=$(grep "MemTotal: " /proc/meminfo | awk '{ print $2}')
totalram=$(($total_ram / 1024))
MYIP=$(curl -sS ipv4.icanhazip.com)
LAST_DOMAIN="$(cat /etc/xray/domain)"
NS="$(cat /etc/xray/dns)"
red() { echo -e "\\033[32;1m${*}\\033[0m"; }

clear
echo -e "\033[0;33m   ┌──────────────────────────────────────────┐\033[0m"
echo -e "\033[0;33m   │\033[0m            \033[0;32mCHANGE DOMAIN VPS\033[0m             \033[0;33m|\033[0m"
echo -e "\033[0;33m   └──────────────────────────────────────────┘\033[0m"
echo -e "     ${RED}Autoscript Papada'an Store (multi port)${NC}"
echo -e "${RED}Make sure the internet is smooth when installing the script${NC}"
echo -e "$COLOR1───────────────────────────────────────────────────────$NC"
echo -e ""
echo -e "       ${GREEN}Hostname${NC}    :  $LAST_DOMAIN"
echo -e "       ${GREEN}Public IP${NC}   :  $MYIP"
echo -e "       ${GREEN}Total RAM${NC}   :  $totalram MB"
echo -e ""
echo -e "$COLOR1───────────────────────────────────────────────────────$NC"
echo -e "$COLOR1 $NC   ${BICyan}[${WH}01${BICyan}]${NC} ${WH}• ${COLOR1}Add Domain ${NC}     $COLOR1 $NC"
echo -e "$COLOR1 $NC   ${BICyan}[${WH}02${BICyan}]${NC} ${WH}• ${COLOR1}Add NS Domain  ${NC}     $COLOR1 $NC"
echo -e "$COLOR1 $NC   ${BICyan}[${WH}03${BICyan}]${NC} ${WH}• ${COLOR1}Renew Certificate Domain  ${NC}     $COLOR1 $NC"
echo -e "$COLOR1 $NC   ${BICyan}[${WH}00${BICyan}]${NC} ${WH}• ${COLOR1}Back To Menu  ${NC}     $COLOR1 $NC"
echo -e "$COLOR1───────────────────────────────────────────────────────$NC"
echo -e "     $COLOR1Press x or [ Ctrl+C ] • To-${BIWhite}Exit${NC}"
echo ""
read -p " Select menu : " opt
echo -e ""
case $opt in
1) clear ; sbdns ; exit ;;
2) clear ; nsdns ; exit ;;
3) clear ; certv2ray ; exit ;;
0) clear ; menu ; exit ;;
x) exit ;;
*) echo -e "" ; echo "salah tekan sayang" ; sleep 1 ; menu-set ;;
esac
