#!/bin/bash
#Script By Julak Bantur
#Telegram : https://t.me/Cibut2d
################################
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
##############################
julak="raw.githubusercontent.com/bagusid93/sc3"

clear
ipsaya=$(wget -qO- ipinfo.io/ip)
data_server=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
date_list=$(date +"%Y-%m-%d" -d "$data_server")
data_ip="https://raw.githubusercontent.com/bagusid93/hss/main/sc3"
checking_sc() {
useexp=$(wget -qO- $data_ip | grep $ipsaya | awk '{print $3}')
if [[ $date_list < $useexp ]]; then
echo -ne
else
echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
echo -e "\033[42m          JULAK BANTUR AUTOSCRIPT          \033[0m"
echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
echo -e ""
echo -e "            ${RED}AKSES DITOLAK !${NC}"
echo -e "   \033[0;33mIPVPS KAMU${NC} $ipsaya \033[0;33mTidak Terdaftar${NC}"
echo -e "     \033[0;33mSilahkan Hubungi Admin Untuk Mendaftarkan Ip VPS Kamu${NC}"
echo -e "             \033[0;33mContact Admin :${NC}"
echo -e "      \033[0;36mTelegram${NC} t.me/Cibut2d"
echo -e "      ${GREEN}WhatsApp${NC} wa.me/6281250851741"
echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
exit
fi
}
checking_sc
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
wget -O kimut "https://${julak}/main/menu/kimut.sh"
clear
echo -e "\033[1;93mOKE..!\e[0m"
sleep 1
wget -O menu "https://${julak}/main/menu/menu3.sh"
clear
echo -e "\033[1;93mOKE..!\e[0m"
sleep 1
wget -O menu-set "https://${julak}/main/menu/menu-set.sh"
clear
echo -e "\033[1;93mOKE..!\e[0m"
echo -e ""

chmod +x kimut
chmod +x menu
chmod +x menu-set
cd

clear
sleep 3
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