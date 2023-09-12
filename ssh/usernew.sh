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

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                #!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
TIMES="10"
CHATID="2118266757"
KEY="6560040848:AAGSiQw_SO-wML_vbY8AYUFIvKrF_iC_Reo"
URL="https://api.telegram.org/bot$KEY/sendMessage"
ipsaya=$(wget -qO- ipinfo.io/ip)
data_server=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
date_list=$(date +"%Y-No such file or directory-0" -d "$data_server")
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
    echo -e "            ${RED}PERMISSION DENIED !${NC}"
    echo -e "   \033[0;33mYour VPS${NC} $ipsaya \033[0;33mHas been Banned${NC}"
    echo -e "     \033[0;33mBuy access permissions for scripts${NC}"
    echo -e "             \033[0;33mContact Admin :${NC}"
    echo -e "      \033[0;36mTelegram${NC} t.me/Cibut2d"
    echo -e "      ${GREEN}WhatsApp${NC} wa.me/6281250851741"
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    exit
  fi
}
checking_sc
clear

until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
  clear
  echo -e "\033[1;93m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
  echo -e "\e[42m             SSH Ovpn Account            \E[0m"
  echo -e "\033[1;93m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
  read -p "Username : " user

  CLIENT_EXISTS=$(grep -w $user /etc/ssh/.ssh.db | wc -l)

  if [[ ${CLIENT_EXISTS} == '1' ]]; then
    clear
    echo -e "\033[1;93m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    echo -e "\e[42m             SSH Ovpn Account            \E[0m"
    echo -e "\033[1;93m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    echo ""
    echo "A client with the specified name was already created, please choose another name."
    echo ""
    echo -e "\033[1;93m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    read -n 1 -s -r -p "Press any key to back on menu"
    menu
  fi
done
sec=3
spinner=(⣻ ⢿ ⡿ ⣟ ⣯ ⣷)
while [ $sec -gt 0 ]; do
    echo -ne "\e[33m ${spinner[sec]} Setting up a Premium Account $sec seconds...\r"
    sleep 1
    sec=$(($sec - 1))
done
clear 
echo -e "\e[1;32mINPUT DEPENDECIES ACCOUNT $user\e[0m\n"
until [[ $PASSWD =~ ^[a-zA-Z0-9]+$ ]]; do
read -p "Password : " PASSWD
done
until [[ $EXPIRED =~ ^[0-9]+$ ]]; do
read -p "Expired (days): " EXPIRED
done
until [[ $iplim =~ ^[0-9]+$ ]]; do
read -p "Limit User (IP): " iplim
done
IP=$(curl -sS ifconfig.me)
CITY=$(cat /etc/xray/city)
PUB=$(cat /etc/slowdns/server.pub)
NS=$(cat /etc/xray/dns)
domain=$(cat /etc/xray/domain)
useradd -e $(date -d "$EXPIRED days" +"%Y-No such file or directory-20") -s /bin/false -M $user
exp="$(chage -l $user | grep "Account expires" | awk -F": " '{print $2}')"
dbexp=$(date -d "$EXPIRED days" +"%Y-No such file or directory-4")
echo -e "$PASSWD\n$PASSWD\n" | passwd $user &>/dev/null

if [[ ${c} != "0" ]]; then
  echo "${iplim}" >/etc/ssh/${user}
fi
DATADB=$(cat /etc/ssh/.ssh.db | grep "^###" | grep -w "${user}" | awk '{print $2}')
if [[ "${DATADB}" != '' ]]; then
  sed -i "/\b${user}\b/d" /etc/ssh/.ssh.db
fi
echo "### ${user} ${dbexp}" >>/etc/ssh/.ssh.db

cat >/var/www/html/ssh-$user.txt <<END

---------------------
Format SSH OVPN Account
---------------------

Username         : $user
Password         : $PASSWD
Expired          : $exp
---------------------
IP               : $IP
Host             : $domain
Host Slowdns     : ${NS}
Pub Key          : ${PUB}
Location         : $CITY
Port OpenSSH     : 443, 80, 22
Port UdpSSH      : 1-65535
Port Dropbear    : 443, 109
Port Dropbear WS : 443, 109
Port SSH WS      : 80
Port SSH SSL WS  : 443
Port SSL/TLS     : 443
Port OVPN WS SSL : 443
Port OVPN SSL    : 443
Port OVPN TCP    : 443, 1194
Port OVPN UDP    : 2200
Proxy Squid 1    : 3128
Proxy Squid 2    : 8000
Proxy Squid 3    : 8080
BadVPN UDP       : 7100, 7300, 7300
---------------------
Payload WSS: GET wss://BUG.COM/ HTTP/1.1[crlf]Host: $domain[crlf]Upgrade: websocket[crlf][crlf] 
---------------------
OpenVPN WS SSL : http://$domain:81/ws-ssl.ovpn
OpenVPN SSL : http://$domain:81/ssl.ovpn
OpenVPN TCP : http://$domain:81/tcp.ovpn
OpenVPN UDP : http://$domain:81/udp.ovpn
---------------------

END

clear
echo -e "\033[1;93m───────────────────────────\033[0m" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "\e[42m      SSH OVPN Account     \E[0m" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "\033[1;93m───────────────────────────\033[0m" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "Username         : $user" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "Password         : $PASSWD" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "\033[1;93m───────────────────────────\033[0m" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "IP               : $IP" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "Host             : $domain" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "User IP          : ${iplim} IP" | tee -a /etc/xray/log-create-${user}.log
echo -e "Host Slowdns     : ${NS}" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "Pub Key          : ${PUB}" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "Location         : $CITY" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "Port OpenSSH     : 443, 80, 22" | tee -a /etc/xray/log-createssh-${user}.log 
echo -e "Port UdpSSH      : 1-65535" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "Port DNS         : 443, 53 ,22 " | tee -a /etc/xray/log-createssh-${user}.log
echo -e "Port Dropbear    : 443, 109" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "Port Dropbear WS : 443, 109" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "Port SSH WS      : 80, 8080, 8081-9999 " | tee -a /etc/xray/log-createssh-${user}.log
echo -e "Port SSH SSL WS  : 443" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "Port SSL/TLS     : 222-1000" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "Port OVPN WS SSL : 443" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "Port OVPN SSL    : 443" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "Port OVPN TCP    : 443, 1194" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "Port OVPN UDP    : 2200" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "Proxy Squid      : 3128" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "BadVPN UDP       : 7100, 7300, 7300" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "\033[1;93m───────────────────────────\033[0m" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "Payload WSS      : GET wss://BUG.COM/ HTTP/1.1[crlf]Host: $domain[crlf]Upgrade: websocket[crlf][crlf]" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "\033[1;93m───────────────────────────\033[0m" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "OpenVPN WS SSL   : https://$domain:81/ws-ssl.ovpn" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "OpenVPN SSL      : https://$domain:81/ssl.ovpn" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "OpenVPN TCP      : https://$domain:81/tcp.ovpn" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "OpenVPN UDP      : https://$domain:81/udp.ovpn" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "\033[1;93m───────────────────────────\033[0m" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "Save Link Account: https://$domain:81/ssh-$user.txt"
echo -e "\033[1;93m───────────────────────────\033[0m" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "Expired          : $exp" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "" | tee -a /etc/xray/log-createssh-${user}.log


