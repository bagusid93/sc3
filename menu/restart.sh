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
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[40;1;37m         • RESTART MENU •          \E[0m"
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
echo -e "$COLOR1 $NC ${BICyan}[${WH}01${BICyan}]${NC} ${WH}• ${COLOR1}Restart All Services ${NC}     $COLOR1 $NC"
echo -e "$COLOR1 $NC ${BICyan}[${WH}02${BICyan}]${NC} ${WH}• ${COLOR1}Restart OpenSSH ${NC}     $COLOR1 $NC"
echo -e "$COLOR1 $NC ${BICyan}[${WH}03${BICyan}]${NC} ${WH}• ${COLOR1}Restart Dropbear ${NC}     $COLOR1 $NC"
echo -e "$COLOR1 $NC ${BICyan}[${WH}04${BICyan}]${NC} ${WH}• ${COLOR1}Restart Stunnel4 ${NC}     $COLOR1 $NC"
echo -e "$COLOR1 $NC ${BICyan}[${WH}05${BICyan}]${NC} ${WH}• ${COLOR1}Restart OpenVPN ${NC}     $COLOR1 $NC"
echo -e "$COLOR1 $NC ${BICyan}[${WH}06${BICyan}]${NC} ${WH}• ${COLOR1}Restart Squid ${NC}     $COLOR1 $NC"
echo -e "$COLOR1 $NC ${BICyan}[${WH}07${BICyan}]${NC} ${WH}• ${COLOR1}Restart Nginx ${NC}     $COLOR1 $NC"
echo -e "$COLOR1 $NC ${BICyan}[${WH}08${BICyan}]${NC} ${WH}• ${COLOR1}Restart Badvpn ${NC}     $COLOR1 $NC"
echo -e "$COLOR1 $NC ${BICyan}[${WH}09${BICyan}]${NC} ${WH}• ${COLOR1}Restart XRAY ${NC}     $COLOR1 $NC"
echo -e "$COLOR1 $NC ${BICyan}[${WH}10${BICyan}]${NC} ${WH}• ${COLOR1}Restart WEBSOCKET ${NC}     $COLOR1 $NC"
echo -e "$COLOR1 $NC ${BICyan}[${WH}00${BICyan}]${NC} ${WH}• ${COLOR1}Back To Menu ${NC}     $COLOR1 $NC"
echo -e   ""
echo -e   "Press x or [ Ctrl+C ] • To-Exit"
echo -e   ""
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -p " Select menu : " Restart
echo -e ""
sleep 1
clear
case $Restart in
                1)
                clear
                echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo -e "\E[40;1;37m         • RESTART MENU •          \E[0m"
                echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo -e ""
                echo -e "[ \033[32mInfo\033[0m ] Restart Begin"
                sleep 1
                /etc/init.d/ssh restart
                /etc/init.d/dropbear restart
                /etc/init.d/stunnel4 restart
                /etc/init.d/openvpn restart
                /etc/init.d/fail2ban restart
                /etc/init.d/cron restart
                /etc/init.d/nginx restart
                /etc/init.d/squid restart
                echo -e "[ \033[32mok\033[0m ] Restarting xray Service (via systemctl) "
                sleep 0.5
                systemctl restart xray
                systemctl restart xray.service
                echo -e "[ \033[32mok\033[0m ] Restarting badvpn Service (via systemctl) "
                sleep 0.5
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500
                sleep 0.5
                echo -e "[ \033[32mok\033[0m ] Restarting websocket Service (via systemctl) "
                sleep 0.5
                systemctl restart edu-proxy.service
                systemctl restart ws-dropbear.service
                #systemctl restart ws-stunnel.service
                sleep 0.5
                echo -e "[ \033[32mInfo\033[0m ] ALL Service Restarted"
                echo ""
                echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo ""
                read -n 1 -s -r -p "Press any key to back on system menu"
                restart
                ;;
                2)
                clear
                echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo -e "\E[40;1;37m         • RESTART MENU •          \E[0m"
                echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo -e ""
                echo -e "[ \033[32mInfo\033[0m ] Restart Begin"
                sleep 1
                /etc/init.d/ssh restart
                sleep 0.5
                echo -e "[ \033[32mInfo\033[0m ] SSH Service Restarted"
                echo ""
                echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo ""
                read -n 1 -s -r -p "Press any key to back on system menu"
                restart
                ;;
                3)
                clear
                echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo -e "\E[40;1;37m         • RESTART MENU •          \E[0m"
                echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo -e ""
                echo -e "[ \033[32mInfo\033[0m ] Restart Begin"
                sleep 1
                /etc/init.d/dropbear restart
                sleep 0.5
                echo -e "[ \033[32mInfo\033[0m ] Dropbear Service Restarted"
                echo ""
                echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo ""
                read -n 1 -s -r -p "Press any key to back on system menu"
                restart
                ;;
                4)
                clear
                echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo -e "\E[40;1;37m         • RESTART MENU •          \E[0m"
                echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo -e ""
                echo -e "[ \033[32mInfo\033[0m ] Restart Begin"
                sleep 1
                /etc/init.d/stunnel4 restart
                sleep 0.5
                echo -e "[ \033[32mInfo\033[0m ] Stunnel4 Service Restarted"
                echo ""
                echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo ""
                read -n 1 -s -r -p "Press any key to back on system menu"
                restart
                ;;
                5)
                clear
                echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo -e "\E[40;1;37m         • RESTART MENU •          \E[0m"
                echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo -e ""
                echo -e "[ \033[32mInfo\033[0m ] Restart Begin"
                sleep 1
                /etc/init.d/openvpn restart
                sleep 0.5
                echo -e "[ \033[32mInfo\033[0m ] Openvpn Service Restarted"
                echo ""
                echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo ""
                read -n 1 -s -r -p "Press any key to back on system menu"
                restart
                ;;
                6)
                clear
                echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo -e "\E[40;1;37m         • RESTART MENU •          \E[0m"
                echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo -e ""
                echo -e "[ \033[32mInfo\033[0m ] Restart Begin"
                sleep 1
                /etc/init.d/squid restart
                sleep 0.5
                echo -e "[ \033[32mInfo\033[0m ] Squid Service Restarted"
                echo ""
                echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo ""
                read -n 1 -s -r -p "Press any key to back on system menu"
                restart
                ;;
                7)
                clear
                echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo -e "\E[40;1;37m         • RESTART MENU •          \E[0m"
                echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo -e ""
                echo -e "[ \033[32mInfo\033[0m ] Restart Begin"
                sleep 1
                /etc/init.d/nginx restart
                sleep 0.5
                echo -e "[ \033[32mInfo\033[0m ] Nginx Service Restarted"
                echo ""
                echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo ""
                read -n 1 -s -r -p "Press any key to back on system menu"
                restart
                ;;
                8)
                clear
                echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo -e "\E[40;1;37m         • RESTART MENU •          \E[0m"
                echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo -e ""
                echo -e "[ \033[32mInfo\033[0m ] Restart Begin"
                sleep 1
                echo -e "[ \033[32mok\033[0m ] Restarting badvpn Service (via systemctl) "
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500
                sleep 0.5
                echo -e "[ \033[32mInfo\033[0m ] Badvpn Service Restarted"
                echo ""
                echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo ""
                read -n 1 -s -r -p "Press any key to back on system menu"
                restart
                ;;
                9)
                clear
                echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo -e "\E[40;1;37m         • RESTART MENU •          \E[0m"
                echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo -e ""
                echo -e "[ \033[32mInfo\033[0m ] Restart Begin"
                sleep 1
                echo -e "[ \033[32mok\033[0m ] Restarting xray Service (via systemctl) "
                systemctl restart xray
                systemctl restart xray.service
                sleep 0.5
                echo -e "[ \033[32mInfo\033[0m ] XRAY Service Restarted"
                echo ""
                echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo ""
                read -n 1 -s -r -p "Press any key to back on system menu"
                restart
                ;;
                10)
                clear
                echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo -e "\E[40;1;37m         • RESTART MENU •          \E[0m"
                echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo -e ""
                echo -e "[ \033[32mInfo\033[0m ] Restart Begin"
                sleep 1
                echo -e "[ \033[32mok\033[0m ] Restarting websocket Service (via systemctl) "
                sleep 0.5
                #systemctl restart sshws.service
                systemctl restart ws-dropbear.service
                systemctl restart ws-stunnel.service
                sleep 0.5
                echo -e "[ \033[32mInfo\033[0m ] WEBSOCKET Service Restarted"
                echo ""
                echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo ""
                read -n 1 -s -r -p "Press any key to back on system menu"
                restart
                ;;
                11)
                clear
                echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo -e "\E[40;1;37m         • RESTART MENU •          \E[0m"
                echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo -e ""
                echo -e "[ \033[32mInfo\033[0m ] Restart Begin"
                sleep 1
                echo -e "[ \033[32mok\033[0m ] Restarting Trojan Go Service (via systemctl) "
                sleep 0.5
                systemctl restart trojan-go.service
                sleep 0.5
                echo -e "[ \033[32mInfo\033[0m ] Trojan Go Service Restarted"
                echo ""
                echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo ""
                read -n 1 -s -r -p "Press any key to back on system menu"
                restart
                ;;                                                                         
                0)
                menu
                exit
                ;;
                x)
                clear
                exit
                ;;
                *) echo -e "" ; echo "salah tekan sayang" ; sleep 1 ; restart ;;               
        esac
