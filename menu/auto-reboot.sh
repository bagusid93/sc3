#!/bin/bash
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
if [ ! -e /usr/local/bin/reboot_otomatis ]; then
echo '#!/bin/bash' > /usr/local/bin/reboot_otomatis 
echo 'tanggal=$(date +"%m-%d-%Y")' >> /usr/local/bin/reboot_otomatis 
echo 'waktu=$(date +"%T")' >> /usr/local/bin/reboot_otomatis 
echo 'echo "Server successfully rebooted on the date of $tanggal hit $waktu." >> /root/log-reboot.txt' >> /usr/local/bin/reboot_otomatis 
echo '/sbin/shutdown -r now' >> /usr/local/bin/reboot_otomatis 
chmod +x /usr/local/bin/reboot_otomatis
fi
clear
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "$COLOR1 ${NC}${COLBG1}       ${WH}• AUTO-REBOOT MENU •        ${NC} $COLOR1 $NC"
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""
echo -e "$COLOR1 $NC ${BICyan}[${WH}01${BICyan}]${NC} ${WH}• ${COLOR1} Set Auto-Reboot Setiap 1 Jam ${NC}    $COLOR1 $NC"
echo -e "$COLOR1 $NC ${BICyan}[${WH}02${BICyan}]${NC} ${WH}• ${COLOR1} Set Auto-Reboot Setiap 6 Jam ${NC}    $COLOR1 $NC"
echo -e "$COLOR1 $NC ${BICyan}[${WH}03${BICyan}]${NC} ${WH}• ${COLOR1} Set Auto-Reboot Setiap 12 Jam ${NC}    $COLOR1 $NC"
echo -e "$COLOR1 $NC ${BICyan}[${WH}04${BICyan}]${NC} ${WH}• ${COLOR1} Set Auto-Reboot Setiap 1 Hari ${NC}    $COLOR1 $NC"
echo -e "$COLOR1 $NC ${BICyan}[${WH}05${BICyan}]${NC} ${WH}• ${COLOR1} Set Auto-Reboot Setiap 1 Minggu ${NC}    $COLOR1 $NC"
echo -e "$COLOR1 $NC ${BICyan}[${WH}06${BICyan}]${NC} ${WH}• ${COLOR1} Set Auto-Reboot Setiap 1 Bulan ${NC}    $COLOR1 $NC"
echo -e "$COLOR1 $NC ${BICyan}[${WH}07${BICyan}]${NC} ${WH}• ${COLOR1} Matikan Auto-Reboot ${NC}    $COLOR1 $NC"
echo -e "$COLOR1 $NC ${BICyan}[${WH}08${BICyan}]${NC} ${WH}• ${COLOR1} View reboot log ${NC}    $COLOR1 $NC"
echo -e "$COLOR1 $NC ${BICyan}[${WH}09${BICyan}]${NC} ${WH}• ${COLOR1} Remove reboot log ${NC}    $COLOR1 $NC"
echo -e "$COLOR1 $NC ${BICyan}[${WH}00${BICyan}]${NC} ${WH}• ${COLOR1} Back To Menu ${NC}    $COLOR1 $NC"
echo -e ""
echo -e "Press x or [ Ctrl+C ] • To-Exit"
echo -e ""
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""
read -p " Select menu : " x
if test $x -eq 1; then
echo "10 * * * * root /usr/local/bin/reboot_otomatis" > /etc/cron.d/reboot_otomatis
echo "Auto-Reboot has been set every an hour."
elif test $x -eq 2; then
echo "10 */6 * * * root /usr/local/bin/reboot_otomatis" > /etc/cron.d/reboot_otomatis
echo "Auto-Reboot has been successfully set every 6 hours."
elif test $x -eq 3; then
echo "10 */12 * * * root /usr/local/bin/reboot_otomatis" > /etc/cron.d/reboot_otomatis
echo "Auto-Reboot has been successfully set every 12 hours."
elif test $x -eq 4; then
echo "10 0 * * * root /usr/local/bin/reboot_otomatis" > /etc/cron.d/reboot_otomatis
echo "Auto-Reboot has been successfully set once a day."
elif test $x -eq 5; then
echo "10 0 */7 * * root /usr/local/bin/reboot_otomatis" > /etc/cron.d/reboot_otomatis
echo "Auto-Reboot has been successfully set once a week."
elif test $x -eq 6; then
echo "10 0 1 * * root /usr/local/bin/reboot_otomatis" > /etc/cron.d/reboot_otomatis
echo "Auto-Reboot has been successfully set once a month."
elif test $x -eq 7; then
rm -f /etc/cron.d/reboot_otomatis
echo "Auto-Reboot successfully TURNED OFF."
elif test $x -eq 8; then
if [ ! -e /root/log-reboot.txt ]; then
	clear
    echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "\E[40;1;37m        • AUTO-REBOOT LOG •        \e[0m"
    echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e ""
    echo "No reboot activity found"
    echo -e ""
    echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo ""
    read -n 1 -s -r -p "Press any key to back on menu"
    auto-reboot
	else
	clear
    echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "\E[40;1;37m        • AUTO-REBOOT LOG •        \e[0m"
    echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e ""    
	echo 'LOG REBOOT'
	cat /root/log-reboot.txt
    echo -e ""
    echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo ""
    read -n 1 -s -r -p "Press any key to back on menu"
    auto-reboot    
fi
elif test $x -eq 9; then
clear
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "\E[40;1;37m        • AUTO-REBOOT LOG •        \e[0m"
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""  
echo "" > /root/log-reboot.txt
echo "Auto Reboot Log successfully deleted!"
echo -e ""
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
auto-reboot 
elif test $x -eq 0; then
clear
menu-set
else
clear
echo ""
echo "Options Not Found In Menu"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
auto-reboot 
fi
