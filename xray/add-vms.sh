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
NC='\e[0m'
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
# // Exporting Language to UTF-8

export LANG='en_US.UTF-8'
export LANGUAGE='en_US.UTF-8'


# // Export Color & Information
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[0;33m'
export BLUE='\033[0;34m'
export PURPLE='\033[0;35m'
export CYAN='\033[0;36m'
export LIGHT='\033[0;37m'
export NC='\033[0m'

MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"

clear
TIMES="10"
CHATID=$(cat /etc/per/id)
KEY=$(cat /etc/per/token)
URL="https://api.telegram.org/bot$KEY/sendMessage"
source /var/lib/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/xray/domain)
else
domain=$IP
fi

#tls="$(cat ~/log-install.txt | grep -w "Vmess TLS" | cut -d: -f2|sed 's/ //g')"
#none="$(cat ~/log-install.txt | grep -w "Vmess None TLS" | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$NC"
echo -e "$COLBG1         Add Xray/Vmess Account          $NC"
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$NC"

		read -rp "User: " -e user
		CLIENT_EXISTS=$(grep -w $user /etc/xray/config.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
clear
            echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$NC"
            echo -e "$COLBG1         Add Xray/Vmess Account          $NC"
            echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$NC"
			echo ""
			echo "A client with the specified name was already created, please choose another name."
			echo ""
			echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$NC"
			read -n 1 -s -r -p "Press any key to back on menu"
      menu
		fi
	done
#ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
#PUB=$(cat /etc/slowdns/server.pub)
#NS=$(cat /etc/xray/dns)
#uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "Uuid (Manual): " uuid
read -p "Expired (days): " masaaktif
#read -p "Limit User (GB): " Quota
read -p "Limit User (IP): " iplimit
tgl=$(date -d "$masaaktif days" +"%d")
bln=$(date -d "$masaaktif days" +"%b")
thn=$(date -d "$masaaktif days" +"%Y")
expe="$tgl $bln, $thn"
tgl2=$(date +"%d")
bln2=$(date +"%b")
thn2=$(date +"%Y")
tnggl="$tgl2 $bln2, $thn2"
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#vmess$/a\#vm '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/config.json
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#vmessgrpc$/a\#vmg '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/config.json

asu=`cat<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "443",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "/vmess",
      "type": "none",
      "host": "${domain}",
      "tls": "tls"
}
EOF`
ask=`cat<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "80",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "/vmess",
      "type": "none",
      "host": "${domain}",
      "tls": "none"
}
EOF`
grpc=`cat<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "443",
      "id": "${uuid}",
      "aid": "0",
      "net": "grpc",
      "path": "vmess-grpc",
      "type": "none",
      "host": "${domain}",
      "tls": "tls"
}
EOF`
vmess_base641=$( base64 -w 0 <<< $vmess_json1)
vmess_base642=$( base64 -w 0 <<< $vmess_json2)
vmess_base643=$( base64 -w 0 <<< $vmess_json3)
vmesslink1="vmess://$(echo $asu | base64 -w 0)"
vmesslink2="vmess://$(echo $ask | base64 -w 0)"
vmesslink3="vmess://$(echo $grpc | base64 -w 0)"
systemctl restart xray > /dev/null 2>&1
service cron restart > /dev/null 2>&1


cat >/var/www/html/vmess-$user.txt <<-END

---------------------
# Format Vmess WS (CDN)
---------------------

- name: Vmess-$user-WS (CDN)
  type: vmess
  server: ${domain}
  port: 443
  uuid: ${uuid}
  alterId: 0
  cipher: auto
  udp: true
  tls: true
  skip-cert-verify: true
  servername: ${domain}
  network: ws
  ws-opts:
    path: /vmess
    headers:
      Host: ${domain}
---------------------
# Format Vmess WS (CDN) Non TLS
---------------------

- name: Vmess-$user-WS (CDN) Non TLS
  type: vmess
  server: ${domain}
  port: 80
  uuid: ${uuid}
  alterId: 0
  cipher: auto
  udp: true
  tls: false
  skip-cert-verify: false
  servername: ${domain}
  network: ws
  ws-opts:
    path: /vmess
    headers:
      Host: ${domain}
---------------------
# Format Vmess gRPC (SNI)
---------------------

- name: Vmess-$user-gRPC (SNI)
  server: ${domain}
  port: 443
  type: vmess
  uuid: ${uuid}
  alterId: 0
  cipher: auto
  network: grpc
  tls: true
  servername: ${domain}
  skip-cert-verify: true
  grpc-opts:
    grpc-service-name: vmess-grpc

---------------------
 Link Akun Vmess                   
---------------------
Link TLS         : 
${vmesslink1}
---------------------
Link none TLS    : 
${vmesslink2}
---------------------
Link GRPC        : 
${vmesslink3}
---------------------

END
if [ ! -e /etc/vmess ]; then
  mkdir -p /etc/vmess
fi

if [[ $iplimit -gt 0 ]]; then
mkdir -p /etc/julak/limit/vmess/ip
echo -e "$iplimit" > /etc/julak/limit/vmess/ip/$user
else
echo > /dev/null
fi

if [ -z ${Quota} ]; then
  Quota="0"
fi

c=$(echo "${Quota}" | sed 's/[^0-9]*//g')
d=$((${c} * 1024 * 1024 * 1024))

if [[ ${c} != "0" ]]; then
  echo "${d}" >/etc/vmess/${user}
fi
DATADB=$(cat /etc/vmess/.vmess.db | grep "^###" | grep -w "${user}" | awk '{print $2}')
if [[ "${DATADB}" != '' ]]; then
  sed -i "/\b${user}\b/d" /etc/vmess/.vmess.db
fi
echo "### ${user} ${exp} ${uuid} ${iplimit}" >>/etc/vmess/.vmess.db
clear
CHATID="$CHATID"
KEY="$KEY"
TIME="$TIME"
URL="$URL"
TEXT="<code>◇━━━━━━━━━━━━━━━━━◇</code>
<code>      XRAY/VMESS</code>
<code>◇━━━━━━━━━━━━━━━━━◇</code>
<code>Remarks   : ${user}
Domain    : ${domain}
Limit IP : ${iplimit} Login
Port TLS  : 443
Port NTLS : 80
id        : ${uuid}
alterId   : 0
Security  : auto
network   : ws or grpc
Path      : /Multi-Path
Dynamic   : https://bugmu.com/path
Name      : vmess-grpc</code>
<code>◇━━━━━━━━━━━━━━━━━◇</code>
<code> VMESS WS TLS</code>
<code>◇━━━━━━━━━━━━━━━━━◇</code>
<code>${vmesslink1}</code>
<code>◇━━━━━━━━━━━━━━━━━◇</code>
<code>VMESS WS NO TLS</code>
<code>◇━━━━━━━━━━━━━━━━━◇</code>
<code>${vmesslink2}</code>
<code>◇━━━━━━━━━━━━━━━━━◇</code>
<code> VMESS gRPC</code>
<code>◇━━━━━━━━━━━━━━━━━◇</code>
<code>${vmesslink3}</code>
<code>◇━━━━━━━━━━━━━━━━━◇</code>
Expired  : $expe
<code>◇━━━━━━━━━━━━━━━━━◇</code>
"

curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
clear
clear
echo -e "\033[1;93m━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/xray/log-create-${user}.log
echo -e " Xray/Vmess Account " | tee -a /etc/xray/log-create-${user}.log
echo -e "\033[1;93m━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/xray/log-create-${user}.log
echo -e "Remarks          : ${user}" | tee -a /etc/xray/log-create-${user}.log
echo -e "Domain           : ${domain}" | tee -a /etc/xray/log-create-${user}.log
echo -e "User Ip            : ${iplimit} IP" | tee -a /etc/xray/log-create-${user}.log
#echo -e "Xray Dns        : ${NS}" | tee -a /etc/xray/log-create-${user}.log
#echo -e "Pubkey          : ${PUB}" | tee -a /etc/xray/log-create-${user}.log
echo -e "Port TLS         : 443" | tee -a /etc/xray/log-create-${user}.log
echo -e "Port none TLS    : 80" | tee -a /etc/xray/log-create-${user}.log
echo -e "id               : ${uuid}" | tee -a /etc/xray/log-create-${user}.log
echo -e "alterId          : 0" | tee -a /etc/xray/log-create-${user}.log
echo -e "Security         : auto" | tee -a /etc/xray/log-create-${user}.log
echo -e "Network          : ws" | tee -a /etc/xray/log-create-${user}.log
echo -e "Path             : (/Multi-Path)/vmess" | tee -a /etc/xray/log-create-${user}.log
echo -e "Dynamic          : http://bug/path" | tee -a /etc/xray/log-create-${user}.log
echo -e "ServiceName      : vmess-grpc" | tee -a /etc/xray/log-create-${user}.log
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/xray/log-create-${user}.log
echo -e "Link TLS         : " | tee -a /etc/xray/log-create-${user}.log
echo -e "${vmesslink1}" | tee -a /etc/xray/log-create-${user}.log
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/xray/log-create-${user}.log
echo -e "Link none TLS    : " | tee -a /etc/xray/log-create-${user}.log
echo -e "${vmesslink2}" | tee -a /etc/xray/log-create-${user}.log
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/xray/log-create-${user}.log
echo -e "Link GRPC        : " | tee -a /etc/xray/log-create-${user}.log
echo -e "${vmesslink3}" | tee -a /etc/xray/log-create-${user}.log
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/xray/log-create-${user}.log
echo -e "Expired    : $expe" | tee -a /etc/xray/log-create-${user}.log
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/xray/log-create-${user}.log
echo ""
