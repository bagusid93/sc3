#!/bin/bash
# //====================================================
# //	System Request:Debian 9+/Ubuntu 18.04+/20+
# //	Author:	Julak Bantur
# //	Dscription: Xray Management
# //	email: putrameratus2@gmail.com
# //  telegram: https://t.me/Cibut2d
# //====================================================
###########- COLOR CODE -##############
colornow=$(cat /etc/julak/theme/color.conf)
NC="\e[0m"
RED="\033[0;31m"
COLOR1="$(cat /etc/julak/theme/$colornow | grep -w "TEXT" | cut -d: -f2|sed 's/ //g')"
COLBG1="$(cat /etc/julak/theme/$colornow | grep -w "BG" | cut -d: -f2|sed 's/ //g')"
WH='\033[1;37m'
###########- END COLOR CODE -##########

clear
    echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$NC"
    echo -e "$COLBG1        Member Xray/Vmess Account        $NC"
    echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$NC"
    NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/etc/vmess/.vmess.db")
    if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
        echo ""
        echo "   You have no existing clients!"
        echo ""
        exit 0
    fi
    listmem=$(grep -s "^### " "/etc/vmess/.vmess.db" | cut -d ' ' -f 2-3 | column -t | nl)
    clear
    echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$NC"
    echo -e "$COLBG1        Member Xray/Vmess Account        $NC"
    echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$NC"
    echo "    NO  USERNAME     EXPIRED"    
    echo "    ------------------------"
    echo "$listmem"
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$NC"
echo -e "$COLBG1            Delete vmess Account         $NC"
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$NC"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '1' ]]; do
    echo -e " "
    read -rp "Input Username : " user
    CLIENT_EXISTS=$(grep -w $user /etc/vmess/.vmess.db | wc -l)

    if [[ ${CLIENT_EXISTS} == '0' ]]; then
        echo "No customer name available"
    else
        exp=$(grep -wE "^### $user" "/etc/xray/config.json" | cut -d ' ' -f 3 | sort | uniq)
        sed -i "/^### $user $exp/,/^},{/d" /etc/xray/config.json
        sed -i "/^### $user $exp/d" /etc/vmess/.vmess.db
        rm /etc/xray/log-create-${user}.log
        systemctl restart xray >/dev/null 2>&1
        clear
        echo "-----------------------------------------------"
        echo -e "Delete vmess Account Username ${grenbo}$user${NC} Successfully"
        echo -e "account has been permanently deleted"
        echo "-----------------------------------------------"
        echo ""
        exit
    fi
done
