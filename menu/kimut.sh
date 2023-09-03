#!/bin/bash
#Script By Julak Bantur
#Telegram : https://t.me/Cibut2d
################################
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
##############################
julak="raw.githubusercontent.com/bagusid93/sc3"
bantur1="wget -O kimut "https://raw.githubusercontent.com/bagusid93/sc3/main/menu/kimut.sh" "
bantur2="wget -O menu "https://raw.githubusercontent.com/bagusid93/sc3/main/menu/menu3.sh" "
bantur3="wget -O menu-set "https://raw.githubusercontent.com/bagusid93/sc3/main/menu/menu-set.sh" "

BURIQ () {
    curl -sS https://raw.githubusercontent.com/bagusid93/hss/main/sc3 > /root/tmp
    data=( `cat /root/tmp | grep -E "^### " | awk '{print $2}'` )
    for user in "${data[@]}"
    do
    exp=( `grep -E "^### $user" "/root/tmp" | awk '{print $3}'` )
    d1=(`date -d "$exp" +%s`)
    d2=(`date -d "$biji" +%s`)
    exp2=$(( (d1 - d2) / 86400 ))
    if [[ "$exp2" -le "0" ]]; then
    echo $user > /etc/.$user.ini
    else
    rm -f /etc/.$user.ini > /dev/null 2>&1
    fi
    done
    rm -f /root/tmp
}

MYIP=$(curl -sS ipv4.icanhazip.com)
Name=$(curl -sS https://raw.githubusercontent.com/bagusid93/hss/main/sc3 | grep $MYIP | awk '{print $2}')
echo $Name > /usr/local/etc/.$Name.ini
CekOne=$(cat /usr/local/etc/.$Name.ini)

Bloman () {
if [ -f "/etc/.$Name.ini" ]; then
CekTwo=$(cat /etc/.$Name.ini)
    if [ "$CekOne" = "$CekTwo" ]; then
        res="Expired"
    fi
else
res="Permission Accepted..."
fi
}

PERMISSION () {
    MYIP=$(curl -sS ipv4.icanhazip.com)
    IZIN=$(curl -sS https://raw.githubusercontent.com/bagusid93/hss/main/sc3 | awk '{print $4}' | grep $MYIP)
    if [ "$MYIP" = "$IZIN" ]; then
    Bloman
    else
    res="Permission Denied!"
    fi
    BURIQ
}
red='\e[1;31m'
green='\e[1;32m'
yellow='\033[0;33m'
NC='\e[0m'
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
PERMISSION
if [ -f /home/needupdate ]; then
red "Your script need to update first !"
exit 0
elif [ "$res" = "Permission Accepted..." ]; then
echo -ne
else
red "Permission Denied!"
exit 0
fi

clear
echo ""
version=$(cat /home/ver)
ver=$( curl sS https://raw.githubusercontent.com/bagusid93/sc3/main/versi )
clear
echo -e "\e[1;36mStart Update AutoScript, Please Wait..\e[0m"
sleep 2
clear
echo -e "\e[1;36mSabar Yaaaaa !!!\e[0m"
sleep 1
clear
echo -e "\033[1;93mSambil Ngopi Dulu Broow..!\e[0m"
sleep 5

rm -rf kimut
rm -rf menu
rm -rf menu-set

cd /usr/bin
echo -e "${bantur1}"
echo -e "${bantur2}"
echo -e "${bantur3}"

chmod +x kimut
chmod +x menu
chmod +x menu-set
cd

clear
echo -e ""
echo -e "\e[1;36mBERHASIL\e[0m"
sleep 2
clear
echo ""
echo -e "\033[0;34m----------------------------------------\033[0m"
echo -e "\E[44;1;39m            SCRIPT UPDATED              \E[0m"
echo -e "\033[0;34m----------------------------------------\033[0m"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu
;;
x)
clear
menu
;;
*)
;;
esac
