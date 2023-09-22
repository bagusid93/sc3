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
clear
sleep 1
echo -e "${GB}[ INFO ]${NC} ${YB}Sambil Nunggu, Ngopi Dulu Broo .....!!!!${NC}"
sleep 1
wget -q -O kimut "https://raw.githubusercontent.com/bagusid93/sc3/main/menu/kimut.sh"
clear
echo -e "${GB}[ INFO ]${NC} ${YB}Install All Menu .....!!!!${NC}"
sleep 1
wget -O menu-l2tp "https://${julak}/main/ipsec/menu-l2tp.sh"
clear
wget -O m-bot "https://${julak}/main/menu/m-bot.sh"
clear
wget -O m-ip "https://${julak}/main/menu/m-ip.sh"
clear
wget -O menu-vmess "https://${julak}/main/menu/menu-vmess.sh"
clear
wget -O menu-vless "https://${julak}/main/menu/menu-vless.sh"
clear
wget -O running "https://${julak}/main/menu/running.sh"
clear
wget -O clearcache "https://${julak}/main/menu/clearcache.sh"
clear
wget -O menu-trojan "https://${julak}/main/menu/menu-trojan.sh"
clear
wget -O menu-ssh "https://${julak}/main/menu/menu-ssh.sh"
clear
wget -O tendang "https://${julak}/main/ssh/tendang.sh"
clear
wget -O kills "https://${julak}/main/ssh/kills.sh"
clear
wget -O menu-set "https://${julak}/main/menu/menu-set.sh"
clear
wget -O menu-domain "https://${julak}/main/menu/menu-domain.sh"
clear
wget -O add-host "https://${julak}/main/ssh/add-host.sh"
clear
wget -O certv2ray "https://${julak}/main/xray/certv2ray.sh"
clear
wget -O menu-webmin "https://${julak}/main/menu/menu-webmin.sh"
clear
wget -O speedtest "https://${julak}/main/ssh/speedtest_cli.py"
clear
wget -O about "https://${julak}/main/menu/about.sh"
clear
wget -O auto-reboot "https://${julak}/main/menu/auto-reboot.sh"
clear
wget -O restart "https://${julak}/main/menu/restart.sh"
clear
wget -O bw "https://${julak}/main/menu/bw.sh"
clear
wget -O menu-port "https://${julak}/main/port/port-change.sh"
clear
wget -O port-ssl "https://${julak}/main/port/port-ssl.sh"
clear
wget -O port-ovpn "https://${julak}/main/port/port-ovpn.sh"
clear
wget -O acs-set "https://${julak}/main/acs-set.sh"
clear
wget -O sshws "https://${julak}/main/ssh/sshws.sh"
clear
wget -O status "https://${julak}/main/status.sh"
clear
wget -O menu-bckp "https://${julak}/main/menu/menu-bckp.sh"
clear
wget -O jam "https://${julak}/main/jam.sh"
clear
#wget -O add-vmess "https://${julak}/main/xray/add-vmess.sh"
clear
wget -O add-vls "https://${julak}/main/xray/add-vls.sh"
clear
wget -O add-vms "https://${julak}/main/xray/add-vms.sh"
clear
wget -O add-tru "https://${julak}/main/xray/add-tru.sh"
clear
wget -O user-lock "https://${julak}/main/ssh/user-lock.sh"
clear
wget -O user-unlock "https://${julak}/main/ssh/user-unlock.sh"
clear
wget -O menu-backup "https://${julak}/main/menu/menu-backup.sh"
clear
wget -O menu-theme "https://${julak}/main/menu/menu-theme.sh"
clear
wget -O backup "https://${julak}/main/backup/backup.sh"
clear
wget -O restore "https://${julak}/main/backup/restore.sh"
clear

chmod +x kimut
chmod +x menu
chmod +x m-bot
chmod +x menu-l2tp
chmod +x m-ip
chmod +x menu-vmess
chmod +x menu-vless
chmod +x running
chmod +x clearcache
chmod +x menu-trojan
chmod +x menu-ssh
chmod +x tendang
chmod +x kills
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
chmod +x menu-port
chmod +x port-ssl
chmod +x port-ovpn
chmod +x acs-set
chmod +x sshws
chmod +x status
chmod +x menu-bckp
chmod +x jam
chmod +x add-vls
chmod +x add-vms
chmod +x add-tru
chmod +x user-lock
chmod +x user-unlock
chmod +x menu-backup
chmod +x menu-theme
chmod +x backup
chmod +x restore

cd
sleep 3
echo ""
clear
echo -e "${GB}[ INFO ]${NC} ${YB}Downloading File Menu Successfully${NC}"
sleep 5
clear
