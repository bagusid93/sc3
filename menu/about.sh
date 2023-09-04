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
aureb=$(cat /home/re_otm)
clear
echo " "
echo " ________  ________  ________  ________  ________  ________  ________  ________                 ________  _________  ________  ________  _______      
|\   __  \|\   __  \|\   __  \|\   __  \|\   ___ \|\   __  \|\   __  \|\   ___  \              |\   ____\|\___   ___\\   __  \|\   __  \|\  ___ \     
\ \  \|\  \ \  \|\  \ \  \|\  \ \  \|\  \ \  \_|\ \ \  \|\  \ \  \|\  \ \  \\ \  \             \ \  \___|\|___ \  \_\ \  \|\  \ \  \|\  \ \   __/|    
 \ \   ____\ \   __  \ \   ____\ \   __  \ \  \ \\ \ \   __  \ \   __  \ \  \\ \  \             \ \_____  \   \ \  \ \ \  \\\  \ \   _  _\ \  \_|/__  
  \ \  \___|\ \  \ \  \ \  \___|\ \  \ \  \ \  \_\\ \ \  \ \  \ \  \ \  \ \  \\ \  \             \|____|\  \   \ \  \ \ \  \\\  \ \  \\  \\ \  \_|\ \ 
   \ \__\    \ \__\ \__\ \__\    \ \__\ \__\ \_______\ \__\ \__\ \__\ \__\ \__\\ \__\              ____\_\  \   \ \__\ \ \_______\ \__\\ _\\ \_______\
    \|__|     \|__|\|__|\|__|     \|__|\|__|\|_______|\|__|\|__|\|__|\|__|\|__| \|__|             |\_________\   \|__|  \|_______|\|__|\|__|\|_______|
                                                                                                  \|_________|                                        
                                                                                                                                                      
                                                                                                                                                      "
echo "------------------------------------------------------------"
echo ""
echo ""
echo "   >>> Service & Port "  | tee -a log-install.txt
echo "   - OpenSSH             : 22"  | tee -a log-install.txt
echo "   - SSH Websocket       : 80 [ON] " | tee -a log-install.txt
echo "   - SSH SSL Websocket   : 443 " | tee -a log-install.txt
echo "   - Stunnel4            : 447, 8443 " | tee -a log-install.txt
echo "   - Dropbear            : 109, 143 " | tee -a log-install.txt
echo "   - Badvpn              : 7100-7900 " | tee -a log-install.txt
echo "   - Nginx               : 81 " | tee -a log-install.txt
echo "   - Vmess TLS           : 443 " | tee -a log-install.txt
echo "   - Vmess None TLS      : 80 " | tee -a log-install.txt
echo "   - Vless TLS           : 443 " | tee -a log-install.txt
echo "   - Vless None TLS      : 80 " | tee -a log-install.txt
echo "   - Trojan GRPC         : 443 " | tee -a log-install.txt
echo "   - Trojan WS           : 443 " | tee -a log-install.txt
echo "   - Trojan None TLS     : 80 " | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Server Information & Other Features "  | tee -a log-install.txt
echo "   - Timezone            : Asia/Jakarta (GMT +7) "  | tee -a log-install.txt
echo "   - Fail2Ban            : [ON] "  | tee -a log-install.txt
echo "   - Dflate              : [ON] "  | tee -a log-install.txt
echo "   - IPtables            : [ON] "  | tee -a log-install.txt
echo "   - Auto-Reboot         : [ON] "  | tee -a log-install.txt
echo "   - IPv6                : [OFF] "  | tee -a log-install.txt
echo "   - Autoreboot On       : $aureb:00 $gg GMT +7 " | tee -a log-install.txt
echo "   - AutoKill Multi Login User " | tee -a log-install.txt
echo "   - Auto Delete Expired Account " | tee -a log-install.txt
echo "   - Fully automatic script " | tee -a log-install.txt
echo "   - VPS settings " | tee -a log-install.txt
echo "   - Admin Control " | tee -a log-install.txt
echo "   - Change port " | tee -a log-install.txt
echo "   - Full Orders For Various Services" | tee -a log-install.txt
echo ""
echo ""
echo "------------------------------------------------------------"
echo -e ""
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu
