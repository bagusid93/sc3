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
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"

clear 
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "\E[40;1;37m      • BANDWITH MONITOR •         \E[0m"
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "" 
echo -e "$COLOR1 $NC ${BICyan}[${WH}01${BICyan}]${NC} ${WH}• ${COLOR1} Lihat Total Bandwith Tersisa ${NC}     $COLOR1 $NC"
echo -e "$COLOR1 $NC ${BICyan}[${WH}02${BICyan}]${NC} ${WH}• ${COLOR1} Tabel Penggunaan Setiap 5 Menit ${NC}     $COLOR1 $NC"
echo -e "$COLOR1 $NC ${BICyan}[${WH}03${BICyan}]${NC} ${WH}• ${COLOR1} Tabel Penggunaan Setiap Jam ${NC}     $COLOR1 $NC"
echo -e "$COLOR1 $NC ${BICyan}[${WH}04${BICyan}]${NC} ${WH}• ${COLOR1} Tabel Penggunaan Setiap Hari ${NC}     $COLOR1 $NC"
echo -e "$COLOR1 $NC ${BICyan}[${WH}05${BICyan}]${NC} ${WH}• ${COLOR1} Tabel Penggunaan Setiap Bulan ${NC}     $COLOR1 $NC"
echo -e "$COLOR1 $NC ${BICyan}[${WH}06${BICyan}]${NC} ${WH}• ${COLOR1} Tabel Penggunaan Setiap Tahun ${NC}     $COLOR1 $NC"
echo -e "$COLOR1 $NC ${BICyan}[${WH}07${BICyan}]${NC} ${WH}• ${COLOR1} Tabel Penggunaan Tertinggi ${NC}     $COLOR1 $NC"
echo -e "$COLOR1 $NC ${BICyan}[${WH}08${BICyan}]${NC} ${WH}• ${COLOR1} Statistik Penggunaan Setiap Jam ${NC}     $COLOR1 $NC"
echo -e "$COLOR1 $NC ${BICyan}[${WH}09${BICyan}]${NC} ${WH}• ${COLOR1} Lihat Penggunaan Aktif Saat Ini ${NC}     $COLOR1 $NC"
echo -e "$COLOR1 $NC ${BICyan}[${WH}10${BICyan}]${NC} ${WH}• ${COLOR1} Lihat Trafik Penggunaan Aktif Saat Ini [5s] ${NC}     $COLOR1 $NC"
echo -e "$COLOR1 $NC ${BICyan}[${WH}00${BICyan}]${NC} ${WH}• ${COLOR1} Back To Menu ${NC}     $COLOR1 $NC"
echo -e "" 
echo -e   "Press x or [ Ctrl+C ] • To-Exit"
echo -e   ""
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""
read -p " Select menu : " opt
echo -e ""
case $opt in
1)
clear 
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "\E[40;1;37m • TOTAL BANDWITH SERVER TERSISA • \e[0m"
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""

vnstat

echo -e ""
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
bw
;;

2)
clear 
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "\E[40;1;37m • TOTAL BANDWITH SETIAP 5 MENIT • \e[0m"
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""

vnstat -5

echo -e ""
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
bw
;;

3)
clear 
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "\E[40;1;37m   • TOTAL BANDWITH SETIAP JAM •   \e[0m"
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""

vnstat -h

echo -e ""
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
bw
;;

4)
clear 
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "\E[40;1;37m  • TOTAL BANDWITH SETIAP HARI •   \e[0m"
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""

vnstat -d

echo -e ""
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
bw
;;

5)
clear 
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "\E[40;1;37m  • TOTAL BANDWITH SETIAP BULAN •  \e[0m"
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""

vnstat -m

echo -e ""
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
bw
;;

6)
clear 
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "\E[40;1;37m  • TOTAL BANDWITH SETIAP TAHUN •  \e[0m"
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""

vnstat -y

echo -e ""
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
bw
;;

7)
clear 
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "\E[40;1;37m    • TOTAL BANDWITH TERTINGGI •   \e[0m"
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""

vnstat -t

echo -e ""
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
bw
;;

8)
clear 
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "\E[40;1;37m • STATISTIK TERPAKAI SETIAP JAM • \e[0m"
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""

vnstat -hg

echo -e ""
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
bw
;;

9)
clear 
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "\E[40;1;37m     • LIVE BANDWITH SAAT INI •    \e[0m"
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e   " Press [ Ctrl+C ] • To-Exit"
echo -e ""

vnstat -l

echo -e ""
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
bw
;;

10)
clear 
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "\E[40;1;37m• LIVE TRAFIK PENGGUNAAN BANDWITH •\e[0m"
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""

vnstat -tr

echo -e ""
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
bw
;;

0)
sleep 1
menu
;;
x)
exit
;;
*)
echo -e ""
echo -e "salah tekan sayang"
sleep 1
bw
;;
esac
