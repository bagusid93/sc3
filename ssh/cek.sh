#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
###########- COLOR CODE -##############
colornow=$(cat /etc/julak/theme/color.conf)
NC="\e[0m"
RED="\033[0;31m"
COLOR1="$(cat /etc/julak/theme/$colornow | grep -w "TEXT" | cut -d: -f2|sed 's/ //g')"
COLBG1="$(cat /etc/julak/theme/$colornow | grep -w "BG" | cut -d: -f2|sed 's/ //g')"
WH='\033[1;37m'
###########- END COLOR CODE -##########
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'

clear
red() { echo -e "\\033[32;1m${*}\\033[0m"; }
echo -e "$COLOR1─────────────────────────────────────────$NC"
echo -e "$COLBG1          SSH OpenVPN User Login         $NC"
echo -e "$COLOR1─────────────────────────────────────────$NC"
if [ -e "/var/log/auth.log" ]; then
    LOG="/var/log/auth.log"
fi
if [ -e "/var/log/secure" ]; then
    LOG="/var/log/secure"
fi
echo -e "$COLOR1─────────────────────────────────────────$NC"
echo -e "$COLBG1           OpenSSH User Login            $NC"
echo -e "$COLOR1─────────────────────────────────────────$NC"
echo "ID  |  Username  |  IP Address"

cat $LOG | grep -i sshd | grep -i "Accepted password for" >/tmp/login-db.txt
data=($(ps aux | grep "\[priv\]" | sort -k 72 | awk '{print $2}'))

for PID in "${data[@]}"; do
    cat /tmp/login-db.txt | grep "sshd\[$PID\]" >/tmp/login-db-pid.txt
    NUM=$(cat /tmp/login-db-pid.txt | wc -l)
    USER=$(cat /tmp/login-db-pid.txt | awk '{print $9}')
    IP=$(cat /tmp/login-db-pid.txt | awk '{print $11}')
    if [ $NUM -eq 1 ]; then
        echo "$PID - $USER - $IP"
    fi
done
echo " "
data=($(ps aux | grep -i dropbear | awk '{print $2}'))
echo -e "$COLOR1─────────────────────────────────────────$NC"
echo -e "$COLBG1          Dropbear User Login            $NC"
echo -e "$COLOR1─────────────────────────────────────────$NC"
echo "ID  |  Username  |  IP Address"

cat $LOG | grep -i dropbear | grep -i "Password auth succeeded" >/tmp/login-db.txt
for PID in "${data[@]}"; do
    cat /tmp/login-db.txt | grep "dropbear\[$PID\]" >/tmp/login-db-pid.txt
    NUM=$(cat /tmp/login-db-pid.txt | wc -l)
    USER=$(cat /tmp/login-db-pid.txt | awk '{print $10}')
    IP=$(cat /tmp/login-db-pid.txt | awk '{print $12}')
    if [ $NUM -eq 1 ]; then
        echo "$PID - $USER - $IP"
    fi
done
echo " "

if [ -f "/etc/openvpn/server/openvpn-tcp.log" ]; then
    echo ""
    echo -e "$COLOR1─────────────────────────────────────────$NC"
    echo -e "$COLBG1         OpenVPN TCP User Login          $NC"
    echo -e "$COLOR1─────────────────────────────────────────$NC"
    echo "Username  |  IP Address  |  Connected"
    
    cat /etc/openvpn/server/openvpn-tcp.log | grep -w "^CLIENT_LIST" | cut -d ',' -f 2,3,8 | sed -e 's/,/      /g' >/tmp/vpn-login-tcp.txt
    cat /tmp/vpn-login-tcp.txt
fi


if [ -f "/etc/openvpn/server/openvpn-udp.log" ]; then
    echo " "
    echo -e "$COLOR1─────────────────────────────────────────$NC"
    echo -e "$COLBG1         OpenVPN UDP User Login          $NC"
    echo -e "$COLOR1─────────────────────────────────────────$NC"
    echo "Username  |  IP Address  |  Connected"
    
    cat /etc/openvpn/server/openvpn-udp.log | grep -w "^CLIENT_LIST" | cut -d ',' -f 2,3,8 | sed -e 's/,/      /g' >/tmp/vpn-login-udp.txt
    cat /tmp/vpn-login-udp.txt
fi
echo ""
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu-ssh

