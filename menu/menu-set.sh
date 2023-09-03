#!/bin/bash
#By Julak Bantur
#Papadaan Store
###########- COLOR CODE -##############
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
###########- END COLOR CODE -##########

clear
echo -e "$COLOR1┌─────────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1  $NC     ${BICyan}MENU SETTING ${NC}    $COLOR1 $NC"
echo -e ""
echo -e "$COLOR1 $NC   ${BICyan}[${WH}01${BICyan}]${NC} ${WH}• ${COLOR1}Panel Domain ${NC}     $COLOR1 $NC"
echo -e "$COLOR1 $NC   ${BICyan}[${WH}02${BICyan}]${NC} ${WH}• ${COLOR1}Change Port All Account  ${NC}     $COLOR1 $NC"
echo -e "$COLOR1 $NC   ${BICyan}[${WH}03${BICyan}]${NC} ${WH}• ${COLOR1}Webmin Menu  ${NC}     $COLOR1 $NC"
echo -e "$COLOR1 $NC   ${BICyan}[${WH}04${BICyan}]${NC} ${WH}• ${COLOR1}Speedtest VPS  ${NC}     $COLOR1 $NC"
echo -e "$COLOR1 $NC   ${BICyan}[${WH}05${BICyan}]${NC} ${WH}• ${COLOR1}About Script  ${NC}     $COLOR1 $NC"
echo -e "$COLOR1 $NC   ${BICyan}[${WH}06${BICyan}]${NC} ${WH}• ${COLOR1}Set Auto Reboot ${NC}     $COLOR1 $NC"
echo -e "$COLOR1 $NC   ${BICyan}[${WH}07${BICyan}]${NC} ${WH}• ${COLOR1}Restart All Service ${NC}     $COLOR1 $NC"
echo -e "$COLOR1 $NC   ${BICyan}[${WH}08${BICyan}]${NC} ${WH}• ${COLOR1}Change Banner ${NC}     $COLOR1 $NC"
echo -e "$COLOR1 $NC   ${BICyan}[${WH}09${BICyan}]${NC} ${WH}• ${COLOR1}Cek Bandwith ${NC}     $COLOR1 $NC"
echo -e "$COLOR1 $NC   ${BICyan}[${WH}10${BICyan}]${NC} ${WH}• ${COLOR1}Menu Bot ${NC}     $COLOR1 $NC"
echo -e "$COLOR1 $NC   ${BICyan}[${WH}11${BICyan}]${NC} ${WH}• ${COLOR1}Update AutoScript ${NC}     $COLOR1 $NC"
echo -e "$COLOR1 $NC   ${BICyan}[${WH}00${BICyan}]${NC} ${WH}• ${COLOR1}Back To Menu ${NC}     $COLOR1 $NC"
echo -e ""
echo -e " $COLOR1└─────────────────────────────────────────────────────┘${NC}"
echo -e "     $COLOR1Press x or [ Ctrl+C ] • To-${BIWhite}Exit${NC}"
echo ""
read -p " Select menu : " opt
echo -e ""
case $opt in
1) clear ; menu-domain ; exit ;;
2) clear ; menu-port ; exit ;;
3) clear ; menu-webmin ; exit ;;
4) clear ; speedtest ; exit ;;
5) clear ; about ; exit ;;
6) clear ; auto-reboot ; exit ;;
7) clear ; restart ; exit ;;
8) clear ; nano /etc/issue.net ; exit ;;
9) clear ; bw ; exit ;;
10) clear ; m-bot ; exit ;;
11) clear ; menu-update ; exit ;;
12) clear ; m-bot ; exit ;;
13) clear ; m-ip ; exit ;;
0) clear ; menu ; exit ;;
x) exit ;;
*) echo -e "" ; echo "salah tekan sayang" ; sleep 1 ; menu-set ;;
esac
