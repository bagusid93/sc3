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
if [[ -e /etc/xray/ssh ]]; then
echo -ne
else
touch /etc/xray/ssh
fi

function add-ssh(){
clear
cekray=`cat /root/log-install.txt | grep -ow "XRAY" | sort | uniq`
if [ "$cekray" = "XRAY" ]; then
domen=`cat /etc/xray/domain`
else
domen=`cat /etc/v2ray/domain`
fi
#nameserver=`cat /root/nsdomain`
sldomain=`cat /etc/xray/dns`
slkey=`cat /etc/slowdns/server.pub`
#nameserver1=`cat /etc/slowdns/infons`
#slkey1=`cat /root/server.pub`
TIMES="10"
CHATID=$(cat /etc/per/id)
KEY=$(cat /etc/per/token)
URL="https://api.telegram.org/bot$KEY/sendMessage"
portsshws=`cat ~/log-install.txt | grep -w "SSH Websocket" | cut -d: -f2 | awk '{print $1}'`
wsssl=`cat /root/log-install.txt | grep -w "SSH SSL Websocket" | cut -d: -f2 | awk '{print $1}'`
author=$(cat /etc/profil)


echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}               ${WH}• SSH PANEL MENU •              ${NC} $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
read -p "Username : " Login

CLIENT_EXISTS=$(grep -w $Login /etc/xray/ssh | wc -l)

  if [[ ${CLIENT_EXISTS} == '1' ]]; then
    clear
    echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
    echo -e "$COLOR1 ${NC} ${COLBG1}               ${WH}• SSH PANEL MENU •              ${NC} $COLOR1 $NC"
    echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
    echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
    echo ""
    echo "A client with the specified name was already created, please choose another name."
    echo ""
    echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
    read -n 1 -s -r -p "Press any key to back on menu"
    menu-ssh
  fi
read -p "Password : " Pass
read -p "Expired (hari): " masaaktif

IP=$(curl -sS ifconfig.me);
ossl=`cat /root/log-install.txt | grep -w "OpenVPN" | cut -f2 -d: | awk '{print $6}'`
opensh=`cat /root/log-install.txt | grep -w "OpenSSH" | cut -f2 -d: | awk '{print $1}'`
db=`cat /root/log-install.txt | grep -w "Dropbear" | cut -f2 -d: | awk '{print $1,$2}'`
ssl="$(cat ~/log-install.txt | grep -w "Stunnel4" | cut -d: -f2)"
sqd="$(cat ~/log-install.txt | grep -w "Squid" | cut -d: -f2)"
ovpn="$(netstat -nlpt | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
ovpn2="$(netstat -nlpu | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"

OhpSSH=`cat /root/log-install.txt | grep -w "OHP SSH" | cut -d: -f2 | awk '{print $1}'`
OhpDB=`cat /root/log-install.txt | grep -w "OHP DBear" | cut -d: -f2 | awk '{print $1}'`
OhpOVPN=`cat /root/log-install.txt | grep -w "OHP OpenVPN" | cut -d: -f2 | awk '{print $1}'`
sleep 1
clear
clear
clear
clear
expi=`date -d "$masaaktif days" +"%Y-%m-%d"`
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
echo -e "#ssh $Login $expi $Pass" >> /etc/xray/ssh
PID=`ps -ef |grep -v grep | grep sshws |awk '{print $2}'`

TEXT="
<code>──────────────────</code>
<code>    SSH OVPN Premium Account   </code>
<code>──────────────────</code>
<code>Username        : </code> <code>$Login</code>
<code>Password        : </code> <code>$Pass</code>
<code>Expired          : </code> <code>$exp</code>
<code>──────────────────</code>
<code>IP               : </code> <code>$IP</code>
<code>Host             : </code> <code>$domen</code>
<code>Host Slowdns    : </code> <code>$sldomain</code>
<code>Pub Key          : </code> <code> $slkey</code>
<code>Port OpenSSH    : </code> <code>$opensh</code>
<code>Port Dropbear    : </code> <code>$db</code>
<code>Port DNS         : </code> <code>80, 443,53</code> 
<code>Port SSH WS     : </code> <code>80</code>
<code>Port SSH SSL WS : </code> <code>$wsssl</code>
<code>Port SSL/TLS     : </code> <code>447,8443</code>
<code>Port OVPN WS SSL : </code> <code>2086</code>
<code>Port OVPN SSL    : </code> <code>990</code>
<code>Port OVPN TCP    : </code> <code>$ovpn</code>
<code>Port OVPN UDP    : </code> <code>$ovpn2</code>
<code>Proxy Squid        : </code> <code>3128</code>
<code>BadVPN UDP       : </code> <code>7100, 7300, 7300</code>
<code>───────────────────</code>
<code>SSH UDP VIRAL :</code> <code>$domen:100-200@$Login:$Pass</code>
<code>Payload WS   : </code> <code>GET / HTTP/1.1[crlf]Host: $domen[crlf]Upgrade: websocket[crlf][crlf]</code>
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

clear
echo -e "$COLOR1─────────────────${NC}" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 ${NC}${COLBG1}    ${WH}• Ssh Ovpn Account •           ${NC} $COLOR1 $NC" | tee -a /etc/log-create-user.log
echo -e "$COLOR1─────────────────${NC}" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC ${WH}Username   ${COLOR1}: ${WH}$Login"  | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC ${WH}Password   ${COLOR1}: ${WH}$Pass" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC ${WH}Expired On ${COLOR1}: ${WH}$exp"  | tee -a /etc/log-create-user.log
echo -e "$COLOR1─────────────────${NC}" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC ${WH}IP               ${COLOR1}: ${WH}$IP" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC ${WH}Host             ${COLOR1}: ${WH}$domen" | tee -a /etc/log-create-user.log
#echo -e "$COLOR1 $NC ${WH}Wildcard   ${COLOR1}: ${WH}(bug.com).$domen" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC ${WH}OpenSSH          ${COLOR1}: ${WH}$opensh" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC ${WH}Dropbear         ${COLOR1}: ${WH}$db" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC ${WH}Port SSH UDP     ${COLOR1}: ${WH}1-65535" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC ${WH}Port SSH WS      ${COLOR1}: ${WH}80" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC ${WH}Port SSH WS/SSL  ${COLOR1}: ${WH}$wsssl" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC ${WH}Port SSH SSL/TLS ${COLOR1}: ${WH}447,8443" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC ${WH}Port Ovpn TCP    ${COLOR1}: ${WH}$ovpn" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC ${WH}Port Ovpn UDP    ${COLOR1}: ${WH}$ovpn2" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC ${WH}Port Ovpn SSL    ${COLOR1}: ${WH}990" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC ${WH}OVPN TCP         ${COLOR1}: ${WH}http://$domen:81/tcp.ovpn" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC ${WH}OVPN UDP         ${COLOR1}: ${WH}http://$domen:81/udp.ovpn" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC ${WH}OVPN SSL         ${COLOR1}: ${WH}http://$domen:81/ssl.ovpn" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC ${WH}UDPGW            ${COLOR1}: ${WH}7100-7900" | tee -a /etc/log-create-user.log
echo -e "$COLOR1─────────────────${NC}" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC ${WH}PORT SLWDNS     ${COLOR1}: ${WH}80,443,53"
echo -e "$COLOR1 $NC ${WH}NAMESERVER      ${COLOR1}: ${WH}$sldomain"
#echo -e "$COLOR1 $NC  ${WH}NAMESERVER ${COLOR1}: ${WH}$nameserver"
echo -e "$COLOR1 $NC ${WH}PUB KEY         ${COLOR1}: ${WH}$slkey"
#echo -e "$COLOR1 $NC  ${WH}NAMESERVER ${COLOR1}: ${WH}$nameserver1"
#echo -e "$COLOR1 $NC  ${WH}PUB KEY    ${COLOR1}: ${WH}$slkey1"
echo -e "$COLOR1─────────────────${NC}" | tee -a /etc/log-create-user.log
echo -e "$COLOR1${NC}${WH}Payload WSS :                                      ${NC}" | tee -a /etc/log-create-user.log
echo -e "$COLOR1${NC}${WH}GET wss://$domen/ [protocol][crlf]Host: bug.mu[crlf]Upgrade: websocket[crlf][crlf]${NC}" | tee -a /etc/log-create-user.log
echo -e "$COLOR1─────────────────${NC}" | tee -a /etc/log-create-user.log
echo -e "$COLOR1${NC}${WH}Payload WS :                  ${NC}" | tee -a /etc/log-create-user.log
echo -e "$COLOR1${NC}${WH}GET / HTTP/1.1[crlf]Host: $domen[crlf]Upgrade: websocket[crlf][crlf]${NC}" | tee -a /etc/log-create-user.log
echo -e "$COLOR1─────────────────${NC}" | tee -a /etc/log-create-user.log
echo -e "$COLOR1┌────────────────────┐${NC}" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 ${NC}  ${WH}• $author •${NC}    $COLOR1 $NC" | tee -a /etc/log-create-user.log
echo -e "$COLOR1└────────────────────┘${NC}" | tee -a /etc/log-create-user.log
else

echo -e "$COLOR1─────────────────${NC}" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 ${NC}${COLBG1}    ${WH}• Ssh Ovpn Account •           ${NC} $COLOR1 $NC" | tee -a /etc/log-create-user.log
echo -e "$COLOR1─────────────────${NC}" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC ${WH}Username   ${COLOR1}: ${WH}$Login"  | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC ${WH}Password   ${COLOR1}: ${WH}$Pass" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC ${WH}Expired On ${COLOR1}: ${WH}$exp"  | tee -a /etc/log-create-user.log
echo -e "$COLOR1─────────────────${NC}" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC ${WH}IP               ${COLOR1}: ${WH}$IP" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC ${WH}Host             ${COLOR1}: ${WH}$domen" | tee -a /etc/log-create-user.log
#echo -e "$COLOR1 $NC ${WH}Wildcard   ${COLOR1}: ${WH}(bug.com).$domen" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC ${WH}OpenSSH          ${COLOR1}: ${WH}$opensh" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC ${WH}Dropbear         ${COLOR1}: ${WH}$db" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC ${WH}Port SSH UDP     ${COLOR1}: ${WH}1-65535" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC ${WH}Port SSH WS      ${COLOR1}: ${WH}80" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC ${WH}Port SSH WS/SSL  ${COLOR1}: ${WH}$wsssl" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC ${WH}Port SSH SSL/TLS ${COLOR1}: ${WH}447,8443" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC ${WH}Port Ovpn TCP    ${COLOR1}: ${WH}$ovpn" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC ${WH}Port Ovpn UDP    ${COLOR1}: ${WH}$ovpn2" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC ${WH}Port Ovpn SSL    ${COLOR1}: ${WH}990" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC ${WH}OVPN TCP         ${COLOR1}: ${WH}http://$domen:81/tcp.ovpn" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC ${WH}OVPN UDP         ${COLOR1}: ${WH}http://$domen:81/udp.ovpn" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC ${WH}OVPN SSL         ${COLOR1}: ${WH}http://$domen:81/ssl.ovpn" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC ${WH}UDPGW            ${COLOR1}: ${WH}7100-7900" | tee -a /etc/log-create-user.log
echo -e "$COLOR1─────────────────${NC}" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC ${WH}PORT SLWDNS     ${COLOR1}: ${WH}80,443,53"
echo -e "$COLOR1 $NC ${WH}NAMESERVER      ${COLOR1}: ${WH}$sldomain"
#echo -e "$COLOR1 $NC  ${WH}NAMESERVER ${COLOR1}: ${WH}$nameserver"
echo -e "$COLOR1 $NC ${WH}PUB KEY         ${COLOR1}: ${WH}$slkey"
#echo -e "$COLOR1 $NC  ${WH}NAMESERVER ${COLOR1}: ${WH}$nameserver1"
#echo -e "$COLOR1 $NC  ${WH}PUB KEY    ${COLOR1}: ${WH}$slkey1"
echo -e "$COLOR1─────────────────${NC}" | tee -a /etc/log-create-user.log
echo -e "$COLOR1${NC}${WH}Payload WSS :                                      ${NC}" | tee -a /etc/log-create-user.log
echo -e "$COLOR1${NC}${WH}GET wss://$domen/ [protocol][crlf]Host: bug.mu[crlf]Upgrade: websocket[crlf][crlf]${NC}" | tee -a /etc/log-create-user.log
echo -e "$COLOR1─────────────────${NC}" | tee -a /etc/log-create-user.log
echo -e "$COLOR1${NC}${WH}Payload WS :                  ${NC}" | tee -a /etc/log-create-user.log
echo -e "$COLOR1${NC}${WH}GET / HTTP/1.1[crlf]Host: $domen[crlf]Upgrade: websocket[crlf][crlf]${NC}" | tee -a /etc/log-create-user.log
echo -e "$COLOR1─────────────────${NC}" | tee -a /etc/log-create-user.log
echo -e "$COLOR1┌────────────────────┐${NC}" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 ${NC}  ${WH}• $author •${NC}    $COLOR1 $NC" | tee -a /etc/log-create-user.log
echo -e "$COLOR1└────────────────────┘${NC}" | tee -a /etc/log-create-user.log
fi
echo "" | tee -a /etc/log-create-user.log
read -n 1 -s -r -p "Press any key to back on menu"
menu-ssh
}
function sshlogin(){
clear
echo " "
echo " "
author=$(cat /etc/profil)

if [ -e "/var/log/auth.log" ]; then
        LOG="/var/log/auth.log";
fi
if [ -e "/var/log/secure" ]; then
        LOG="/var/log/secure";
fi
               
data=( `ps aux | grep -i dropbear | awk '{print $2}'`);
echo -e "$COLOR1┌──────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}${COLBG1}         ${WH}SSH User Login           ${NC} $COLOR1 $NC"
echo -e "$COLOR1└──────────────────────────────────┘${NC}"
echo "ID  |  Username  |  IP Address";
echo -e "$COLOR1┌──────────────────────────────────┐${NC}"
cat $LOG | grep -i dropbear | grep -i "Password auth succeeded" > /tmp/login-db.txt;
for PID in "${data[@]}"
do
        cat /tmp/login-db.txt | grep "dropbear\[$PID\]" > /tmp/login-db-pid.txt;
        NUM=`cat /tmp/login-db-pid.txt | wc -l`;
        USER=`cat /tmp/login-db-pid.txt | awk '{print $10}'`;
        IP=`cat /tmp/login-db-pid.txt | awk '{print $12}'`;
        if [ $NUM -eq 1 ]; then
                echo "$PID - $USER - $IP";
        fi

done
echo " "
cat $LOG | grep -i sshd | grep -i "Accepted password for" > /tmp/login-db.txt
data=( `ps aux | grep "\[priv\]" | sort -k 72 | awk '{print $2}'`);

for PID in "${data[@]}"
do
        cat /tmp/login-db.txt | grep "sshd\[$PID\]" > /tmp/login-db-pid.txt;
        NUM=`cat /tmp/login-db-pid.txt | wc -l`;
        USER=`cat /tmp/login-db-pid.txt | awk '{print $9}'`;
        IP=`cat /tmp/login-db-pid.txt | awk '{print $11}'`;
        if [ $NUM -eq 1 ]; then
                echo "$PID - $USER - $IP";
        fi

done
if [ -f "/etc/openvpn/server/openvpn-tcp.log" ]; then
        echo " "
        cat /etc/openvpn/server/openvpn-tcp.log | grep -w "^CLIENT_LIST" | cut -d ',' -f 2,3,8 | sed -e 's/,/      /g' > /tmp/vpn-login-tcp.txt
        cat /tmp/vpn-login-tcp.txt
fi

if [ -f "/etc/openvpn/server/openvpn-udp.log" ]; then
        echo " "
        cat /etc/openvpn/server/openvpn-udp.log | grep -w "^CLIENT_LIST" | cut -d ',' -f 2,3,8 | sed -e 's/,/      /g' > /tmp/vpn-login-udp.txt
        cat /tmp/vpn-login-udp.txt
fi
echo -e "$COLOR1└──────────────────────────────────┘${NC}"
echo ""
echo -e "$COLOR1┌──────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}${COLBG1}          ${WH}• $author •           ${NC}$COLOR1$NC"
echo -e "$COLOR1└──────────────────────────────────┘${NC}"
echo "";

rm -f /tmp/login-db-pid.txt
rm -f /tmp/login-db.txt
rm -f /tmp/vpn-login-tcp.txt
rm -f /tmp/vpn-login-udp.txt
read -n 1 -s -r -p "Press any key to back on menu"
menu-ssh
}
clear
author=$(cat /etc/profil)
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}              ${WH}• SSH PANEL MENU •              ${NC} $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e " $COLOR1┌───────────────────────────────────────────────┐${NC}
 $COLOR1 $NC   ${WH}[${COLOR1}01${WH}]${NC} ${COLOR1}• ${WH}ADD SSH          ${WH}[${COLOR1}06${WH}]${NC} ${COLOR1}• ${WH}HAPUS AKUN LAMA ${NC}     $COLOR1 $NC
 $COLOR1 $NC                                              ${NC} $COLOR1 $NC
 $COLOR1 $NC   ${WH}[${COLOR1}02${WH}]${NC} ${COLOR1}• ${WH}RENEW SSH        ${WH}[${COLOR1}07${WH}]${NC} ${COLOR1}• ${WH}SET AUTOKILL ${NC}$COLOR1 $NC
 $COLOR1 $NC                                              ${NC} $COLOR1 $NC
 $COLOR1 $NC   ${WH}[${COLOR1}03${WH}]${NC} ${COLOR1}• ${WH}DELETE SSH       ${WH}[${COLOR1}08${WH}]${NC} ${COLOR1}• ${WH}TRIAL ${NC}    $COLOR1 $NC
 $COLOR1 $NC                                              ${NC} $COLOR1 $NC
 $COLOR1 $NC   ${WH}[${COLOR1}04${WH}]${NC} ${COLOR1}• ${WH}USER ONLINE      ${WH}[${COLOR1}09${WH}]${NC} ${COLOR1}• ${WH}CEK AKUN MULTI LOGIN ${NC} $COLOR1 $NC
 $COLOR1 $NC                                              ${NC} $COLOR1 $NC
 $COLOR1 $NC   ${WH}[${COLOR1}05${WH}]${NC} ${COLOR1}• ${WH}MEMBER SSH$NC
 $COLOR1 $NC                                              ${NC} $COLOR1 $NC
 $COLOR1 $NC   ${WH}[${COLOR1}00${WH}]${NC} ${COLOR1}• ${WH}GO BACK${NC}                              $COLOR1 $NC"
echo -e " $COLOR1└───────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌────────────────────── ${WH}BY${NC} ${COLOR1}───────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}               ${WH}• $author •                 $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e ""
echo -ne " ${WH}Select menu ${COLOR1}: ${WH}"; read opt
case $opt in
01 | 1) clear ; add-ssh ; exit ;;
02 | 2) clear ; renew ; exit ;;
03 | 3) clear ; hapuslama ; exit ;;
04 | 4) clear ; sshlogin ; exit ;;
05 | 5) clear ; cekconfig ; exit ;;
06 | 6) clear ; delete ; exit ;;
07 | 7) clear ; autokill ; exit ;;
08 | 8) clear ; trial ; exit ;;
09 | 9) clear ; ceklim ; exit ;;
10 | 10) clear ; add-wireguard ; exit ;;
00 | 0) clear ; menu ; exit ;;
X  | 0) clear ; menu ;;
x) exit ;;
*) echo " salah tekan sayang" ; sleep 1 ; menu-ssh ;;
esac
