#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`


clear
USERID=2118266757"
KEY="6560040848:AAGSiQw_SO-wML_vbY8AYUFIvKrF_iC_Reo"
TIMEOUT="10"
URL="https://api.telegram.org/bot$KEY/sendMessage"
curl -sS ifconfig.me > /etc/myipvps
curl -s ipinfo.io/city?token=75082b4831f909 >> /etc/xray/city
curl -s ipinfo.io/org?token=75082b4831f909  | cut -d " " -f 2-10 >> /etc/xray/isp
IP=$(echo $SSH_CLIENT | awk '{print $1}')
TMPFILE='/tmp/ipinfo-$DATE_EXEC.txt'
curl http://ipinfo.io/$IP -s -o $TMPFILE
ORG=$(cat $TMPFILE | jq '.org' | sed 's/"//g')
domain=$(cat /etc/xray/domain)
IPVPS=$(curl -s ipinfo.io/ip )
ISPVPS=$( curl -s ipinfo.io/org )
ISP=$(cat /etc/xray/isp)
CITY=$(cat /etc/xray/city)
domain=$(cat /etc/xray/domain) 
ttoday="$(vnstat | grep today | awk '{print $8" "substr ($9, 1, 3)}' | head -1)"
tmon="$(vnstat -m | grep `date +%G-%m` | awk '{print $8" "substr ($9, 1 ,3)}' | head -1)"
DATE_EXEC="$(date "+%d %b %Y %H:%M")"
REGION=$(cat $TMPFILE | jq '.region' | sed 's/"//g')
COUNTRY=$(cat $TMPFILE | jq '.country' | sed 's/"//g')
MYIP=$(curl -sS ipv4.icanhazip.com)
Name=$(curl -sS https://raw.githubusercontent.com/bagusid93/hss/main/sc3 | grep $MYIP | awk '{print $2}')
Izin=$(curl -sS https://raw.githubusercontent.com/bagusid93/hss/main/sc3 | grep $MYIP | awk '{print $3}')
TIME=$(date +'%Y-%m-%d %H:%M:%S')
MYIP=$(wget -qO- ipinfo.io/ip)
ISP=$(wget -qO- ipinfo.io/org)
domain=$(cat /etc/xray/domain)
CITY=$(curl -s ipinfo.io/city)
NAMES=$(whoami)
RAMMS=$(free -m | awk 'NR==2 {print $2}')
NAMECOM=$(wget -qO- ipinfo.io/ip)
OS=$(cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g')

message="
<code>◇━━━━━━━━━━━━━━◇</code>
<b>  ⚠️ AUTOSCRIPT INSTALLER ⚠️</b>
<b>     ⚠️ JULAK - BANTUR ⚠️</b>
<code>◇━━━━━━━━━━━━━━◇</code>
<code>DOMAIN    : </code><code>${domain}</code>
</code>IP         : </code><code>${MYIP}</code>
</code>ISP        : </code><code>${ISP}</code>
</code>CITY       : </code><code>${CITY}</code>
</code>RAM       : </code><code>${RAMMS}MB</code>
</code>LINUX      : </code><code>${OS}</code>
</code>AUTHOR    : </code><code>${Name}</code>
</code>EXP SCRIPT: </code><code>${Izin}</code>
<code>◇━━━━━━━━━━━━━━◇</code>
"

curl -s --max-time $TIMEOUT -d "chat_id=$USERID&disable_web_page_preview=1&text=$TEXT" $URL > /dev/null
rm $TMPFILE
