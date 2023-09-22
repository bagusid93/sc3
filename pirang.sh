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
echo -e "   \033[0;33mIPVPS KAMU${NC} $MYIP \033[0;33mTidak Terdaftar${NC}"
echo -e "   \033[0;33mHubungi Admin Untuk Buy AutoScript${NC}"
echo -e "           ${RED}KONTAK ADMIN !${NC}"
echo -e "   \033[0;36mTelegram${NC}: https://t.me/Cibut2d"
echo -e "   \033[0;36mWhatsApp${NC}: https://wa.me/6281250851741"
echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
exit
fi
}
checking_sc
clear

TIMES="10"
CHATID=$(cat /etc/per/id)
KEY=$(cat /etc/per/token)
URL="https://api.telegram.org/bot$KEY/sendMessage"
author=$(cat /etc/profil)

until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
  clear
  echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$NC"
  echo -e "$COLBG1             SSH Ovpn Account            $NC"
  echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$NC"
  read -p "Username : " user

  CLIENT_EXISTS=$(grep -w $user /etc/ssh/.ssh.db | wc -l)

  if [[ ${CLIENT_EXISTS} == '1' ]]; then
    clear
    echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$NC"
    echo -e "$COLBG1             SSH Ovpn Account           $NC"
    echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$NC"
    echo ""
    echo "A client with the specified name was already created, please choose another name."
    echo ""
    echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$NC"
    read -n 1 -s -r -p "Press any key to back on menu"
    menu-ssh
  fi
done
sec=3
spinner=(⣻ ⢿ ⡿ ⣟ ⣯ ⣷)
while [ $sec -gt 0 ]; do
    echo -ne "\033[1;37m ${spinner[sec]} Setting up a Premium Account $sec seconds...\r"
    sleep 1
    sec=$(($sec - 1))
done
clear 
echo -e "${WH}INPUT DEPENDECIES ACCOUNT $user ${NC}"
until [[ $PASSWD =~ ^[a-zA-Z0-9]+$ ]]; do
read -p "Password : " PASSWD
done
until [[ $EXPIRED =~ ^[0-9]+$ ]]; do
read -p "Expired (days): " EXPIRED
done
until [[ $iplim =~ ^[0-9]+$ ]]; do
read -p "Limit User (IP): " iplim
echo > /etc/cron.d/kills
                echo "# $user" >>/etc/cron.d/kills
                echo "*/1 * * * *  root /usr/bin/kills $max" >>/etc/cron.d/kills
done
IP=$(curl -sS ifconfig.me)
PUB=$(cat /etc/slowdns/server.pub)
NS=$(cat /etc/xray/dns)
domain=$(cat /etc/xray/domain)
useradd -e $(date -d "$EXPIRED days" +"%Y-%m-%d") -s /bin/false -M $user
exp="$(chage -l $user | grep "Account expires" | awk -F": " '{print $2}')"
dbexp=$(date -d "$EXPIRED days" +"%Y-%m-%d")
echo -e "$PASSWD\n$PASSWD\n" | passwd $user &>/dev/null

if [[ ${c} != "0" ]]; then
  echo "${iplim}" >/etc/ssh/${user}
fi
DATADB=$(cat /etc/ssh/.ssh.db | grep "^###" | grep -w "${user}" | awk '{print $2}')
if [[ "${DATADB}" != '' ]]; then
  sed -i "/\b${user}\b/d" /etc/ssh/.ssh.db
fi
echo "### ${user} ${dbexp} ${PASSWD} ${iplim}" >>/etc/ssh/.ssh.db
PID=`ps -ef |grep -v grep | grep sshws |awk '{print $2}'`

TEXT="
<code>──────────────────</code>
<code>    SSH OVPN Premium Account   </code>
<code>──────────────────</code>
<code>Username         : </code> <code>$Login</code>
<code>Password         : </code> <code>$Pass</code>
<code>Expired          : </code> <code>$exp</code>
<code>──────────────────</code>
<code>IP               : </code> <code>$IP</code>
<code>Host             : </code> <code>$domen</code>
<code>Limit IP             : </code> <code>$batas (Login)</code>
<code>Host Slowdns     : </code> <code>$sldomain</code>
<code>Pub Key          : </code> <code> $slkey</code>
<code>Port OpenSSH     : </code> <code>22</code>
<code>Port Dropbear    : </code> <code>109,110,143</code>
<code>Port DNS         : </code> <code>80, 443,53</code> 
<code>Port SSH WS      : </code> <code>80</code>
<code>Port SSH SSL WS  : </code> <code>443,444</code>
<code>Port SSL/TLS     : </code> <code>447,8443</code>
<code>Port OVPN WS SSL : </code> <code>2086</code>
<code>Port OVPN SSL    : </code> <code>990</code>
<code>Port OVPN TCP    : </code> <code>$ovpn</code>
<code>Port OVPN UDP    : </code> <code>$ovpn2</code>
<code>Proxy Squid      : </code> <code>3128</code>
<code>BadVPN UDP       : </code> <code>7100, 7300, 7300</code>
<code>───────────────────</code>
<code>SSH UDP          :</code> <code>$domen:1-65535@$Login:$Pass</code>
<code>───────────────────</code>
<code>Payload WS       : </code> <code>GET ws://$domen/ [protocol][crlf]Host: isi_bug_disini[crlf]Upgrade: websocket[crlf][crlf]</code>
<code>───────────────────</code>
<code>OpenVPN SSL      : </code> https://$domen:81/ssl.ovpn
<code>OpenVPN TCP      : </code> https://$domen:81/tcp.ovpn
<code>OpenVPN UDP      : </code> https://$domen:81/udp.ovpn
<code>───────────────────</code>
<code>           $author                       </code>
<code>───────────────────</code>
"

curl -s --max-time $TIMES -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null

if [[ ! -z "${PID}" ]]; then

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
echo -e "Port OpenSSH     : 22" | tee -a /etc/xray/log-createssh-${user}.log 
echo -e "Port UdpSSH      : 1-65535" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "Port DNS         : 53 ,22, 80 " | tee -a /etc/xray/log-createssh-${user}.log
echo -e "Port Dropbear    : 143, 109" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "Port Dropbear WS : 80, 143" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "Port SSH WS      : 80" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "Port SSH SSL WS  : 443, 444" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "Port SSL/TLS     : 447,8443" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "Port OVPN WS SSL : 443" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "Port OVPN SSL    : 990" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "Port OVPN TCP    : 1194" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "Port OVPN UDP    : 2200" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "Proxy Squid      : 3128" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "BadVPN UDP       : 7100, 7300, 7300" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "\033[1;93m───────────────────────────\033[0m" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "Ssh UDP          : $domain:1-65535@$user:$PASSWD" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "\033[1;93m───────────────────────────\033[0m" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "Payload WS       : GET ws://$domain/ HTTP/1.1[crlf]Host: isi_bug_disini[crlf]Upgrade: websocket[crlf][crlf]" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "\033[1;93m───────────────────────────\033[0m" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "OpenVPN SSL      : https://$domain:81/ssl.ovpn" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "OpenVPN TCP      : https://$domain:81/tcp.ovpn" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "OpenVPN UDP      : https://$domain:81/udp.ovpn" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "\033[1;93m───────────────────────────\033[0m" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "Expired          : $exp" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "\033[1;93m───────────────────────────\033[0m" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "\e[42m      $author     \E[0m" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "\033[1;93m───────────────────────────\033[0m" | tee -a /etc/xray/log-createssh-${user}.log

else

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
echo -e "Port OpenSSH     : 22" | tee -a /etc/xray/log-createssh-${user}.log 
echo -e "Port UdpSSH      : 1-65535" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "Port DNS         : 53 ,22, 80 " | tee -a /etc/xray/log-createssh-${user}.log
echo -e "Port Dropbear    : 143, 109" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "Port Dropbear WS : 80, 143" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "Port SSH WS      : 80" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "Port SSH SSL WS  : 443, 444" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "Port SSL/TLS     : 447,8443" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "Port OVPN WS SSL : 443" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "Port OVPN SSL    : 990" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "Port OVPN TCP    : 1194" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "Port OVPN UDP    : 2200" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "Proxy Squid      : 3128" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "BadVPN UDP       : 7100, 7300, 7300" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "\033[1;93m───────────────────────────\033[0m" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "Ssh UDP          : $domain:1-65535@$user:$PASSWD" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "\033[1;93m───────────────────────────\033[0m" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "Payload WSS      : GET ws://$domain/ HTTP/1.1[crlf]Host: isi_bug_disini[crlf]Upgrade: websocket[crlf][crlf]" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "\033[1;93m───────────────────────────\033[0m" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "OpenVPN SSL      : https://$domain:81/ssl.ovpn" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "OpenVPN TCP      : https://$domain:81/tcp.ovpn" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "OpenVPN UDP      : https://$domain:81/udp.ovpn" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "\033[1;93m───────────────────────────\033[0m" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "Expired          : $exp" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "\033[1;93m───────────────────────────\033[0m" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "\e[42m      $author     \E[0m" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "\033[1;93m───────────────────────────\033[0m" | tee -a /etc/xray/log-createssh-${user}.log
fi
echo -e "" | tee -a /etc/xray/log-createssh-${user}.log
read -n 1 -s -r -p "Press any key to back on menu"
menu-ssh
