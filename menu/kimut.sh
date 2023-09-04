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
rm -rf menu-update
rm -rf menu
rm -rf m-bot
rm -rf m-ip
rm -rf menu-trial
rm -rf menu-vmess
rm -rf menu-vless
rm -rf menu-ssws
rm -rf running
rm -rf clearcache
rm -rf menu-trgo
rm -rf menu-trojan
rm -rf menu-ssh
rm -rf add-ssh
rm -rf trial
rm -rf renew
rm -rf hapuslama
rm -rf cek
rm -rf member
rm -rf delete
rm -rf autokill
rm -rf ceklim
rm -rf tendang
rm -rf menu-set
rm -rf menu-domain
rm -rf add-host
rm -rf menu-port
rm -rf certv2ray
rm -rf menu-webmin
rm -rf speedtest
rm -rf about
rm -rf auto-reboot
rm -rf restart
rm -rf bw
rm -rf port-ssl
rm -rf port-ovpn
rm -rf xp
rm -rf acs-set
rm -rf sshws
rm -rf status
rm -rf menu-backup
rm -rf backup
rm -rf restore
rm -rf jam
rm -rf trialvmess
rm -rf renew-ws
rm -rf del-ws
rm -rf cek-ws
rm -rf add-ssws
rm -rf trialvless
rm -rf renew-vless
rm -rf del-vless
rm -rf cek-vless
rm -rf add-tr
rm -rf trialtrojan
rm -rf del-tr
rm -rf renew-tr
rm -rf cek-tr
rm -rf addtrgo
rm -rf trialtrojango
rm -rf deltrgo
rm -rf renewtrgo
rm -rf cektrgo
rm -rf m-sshovpn
rm -rf cf
rm -rf add-vmess
rm -rf menu-bckp
rm -rf add-ns
rm -rf issue
rm -rf add-wireguard
rm -rf add-tru
rm -rf add-vls
rm -rf add-vms
rm -rf menu-theme
rm -rf menu-l2tp
rm -rf sshlogin

cd /usr/bin
#update
wget -O kimut "https://${julak}/main/menu/kimut.sh"
clear
echo -e "\033[1;93mOKE..!\e[0m"
sleep 1
wget -O menu "https://${julak}/main/menu/menu4.sh"
clear
echo -e "\033[1;93mOKE..!\e[0m"
sleep 1
wget -O menu-set "https://${julak}/main/menu/menu-set.sh"
clear
echo -e "\033[1;93mOKE..!\e[0m"
sleep 1
echo -e "\033[1;93mUPDATE ALL MENU..!\e[0m"
sleep 3
wget -O menu-ssh "https://${julak}/main/menu/menu-ssh.sh"
wget -O renew "https://${julak}/main/ssh/renew.sh"
wget -O hapuslama "https://${julak}/main/ssh/hapus.sh"
clear
echo -e "\033[1;93mOKE..!\e[0m"
echo -e ""

chmod +x kimut
chmod +x menu
chmod +x menu-set
chmod +x menu-ssh
chmod +x renew
chmod +x hapuslama
cd

clear
sleep 3
echo -e ""
echo -e "\e[1;36mYES BERHASIL\e[0m"
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
