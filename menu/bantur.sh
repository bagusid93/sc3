#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
###########- COLOR CODE -##############
julak="raw.githubusercontent.com/bagusid93/sc3"

BGreen='\e[1;32m'
NC='\e[0m'
DEFBOLD='\e[39;1m'
RB='\e[31;1m'
GB='\e[32;1m'
YB='\e[33;1m'
BB='\e[34;1m'
MB='\e[35;1m'
CB='\e[35;1m'
WB='\e[37;1m'
clear
echo -e "${GB}[ INFO ]${NC} ${YB}Downloading File Menu${NC}"
cd /usr/bin
sleep 1
echo -e ""
echo -e ""
sleep 1
wget -q -O menu "https://${julak}/main/menu/menu3.sh"
sleep 1
echo -e "${GB}[ INFO ]${NC} ${YB}Sambil Nunggu, Ngopi Dulu Broo .....!!!!${NC}"
sleep 1
wget -q -O menu-update "https://raw.githubusercontent.com/bagusid93/sc3/main/menu/menu-update.sh"
sleep 1
echo -e ""
sleep 1
echo -e ""
wget -O update "https://${julak}/menu/update.sh"
wget -O m-bot "https://${julak}/menu/m-bot.sh"
wget -O m-ip "https://${julak}/menu/m-ip.sh"
wget -O menu-vmess "https://${julak}/menu/menu-vmess.sh"
wget -O menu-vless "https://${julak}/menu/menu-vless.sh"
wget -O running "https://${julak}/menu/running.sh"
wget -O clearcache "https://${julak}/menu/clearcache.sh"
wget -O menu-trojan "https://${julak}/menu/menu-trojan.sh"
wget -O menu-ssh "https://${julak}/menu/menu-ssh.sh"
wget -O menu-set "https://${julak}/menu/menu-set.sh"
wget -O menu-domain "https://${julak}/menu/menu-domain.sh"
wget -O add-host "https://${julak}/ssh/add-host.sh"
wget -O menu-port "https://${julak}/port/port-change.sh"
wget -O certv2ray "https://${julak}/xray/certv2ray.sh"
wget -O menu-webmin "https://${julak}/menu/menu-webmin.sh"
wget -O speedtest "https://${julak}/ssh/speedtest_cli.py"
wget -O about "https://${julak}/menu/about.sh"
wget -O auto-reboot "https://${julak}/menu/auto-reboot.sh"
wget -O restart "https://${julak}/menu/restart.sh"
wget -O bw "https://${julak}/menu/bw.sh"
wget -O port-ssl "https://${julak}/port/port-ssl.sh"
wget -O port-ovpn "https://${julak}/port/port-ovpn.sh"
wget -O xp "https://${julak}/ssh/xp.sh"
wget -O acs-set "https://${julak}/acs-set.sh"
wget -O sshws "https://${julak}/ssh/sshws.sh"
wget -O status "https://${julak}/status.sh"
wget -O menu-bckp "https://${julak}/menu/menu-bckp.sh"
wget -O jam "https://${julak}/jam.sh"
wget -O add-tru "https://${julak}/xray/add-tru.sh"
wget -O add-vls "https://${julak}/xray/add-vls.sh"
wget -O add-vms "https://${julak}/xray/add-vms.sh"
wget -O menu-theme "https://${julak}/menu/menu-theme.sh"
wget -O user-unlock "https://${julak}/ssh/user-unlock.sh"
wget -O user-lock "https://${julak}/ssh/user-lock.sh"
wget -O user-password "https://${julak}/ssh/user-password.sh"
wget -O menu-l2tp "https://${julak}/ipsec/menu-l2tp.sh"
wget -O tendang "https://${julak}/ssh/tendang.sh"
wget -O menu-backup "https://${julak}/menu/menu-backup.sh"
wget -O backup "https://${julak}/backup/backup.sh"
wget -O restore "https://${julak}/backup/restore.sh"
wget -O kimut "https://${julak}/menu/kimut.sh"

chmod +x menu-update
chmod +x update
chmod +x menu
chmod +x m-bot
chmod +x m-ip
chmod +x menu-vmess
chmod +x menu-vless
chmod +x running
chmod +x clearcache
chmod +x menu-trojan
chmod +x menu-ssh
chmod +x menu-set
chmod +x menu-domain
chmod +x add-host
chmod +x menu-port
chmod +x certv2ray
chmod +x menu-webmin
chmod +x speedtest
chmod +x about
chmod +x auto-reboot
chmod +x restart
chmod +x bw
chmod +x port-ssl
chmod +x port-ovpn
chmod +x xp
chmod +x acs-set
chmod +x sshws
chmod +x status
chmod +x menu-bckp
chmod +x backup
chmod +x restore
chmod +x jam
chmod +x add-tru
chmod +x add-vls
chmod +x add-vms
chmod +x menu-theme
chmod +x user-unlock
chmod +x user-lock
chmod +x user-password
chmod +x menu-l2tp
chmod +x sshlogin
chmod +x menu-backup
chmod +x tendang
chmod +x kimut
chmod +x renew
cd
clear
echo "${GB}[ INFO ]${NC} ${YB}YESSSSS......BERHASILLLL....${NC}"
sleep 3
echo ""
clear
echo -e "${GB}[ INFO ]${NC} ${YB}Downloading File Menu Successfully${NC}"
sleep 2
clear
