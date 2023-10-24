#!/bin/bash

function send_log(){
CHATID=$(cat /etc/per/id)
KEY=$(cat /etc/per/token)
export TIME="10"
export URL="https://api.telegram.org/bot$KEY/sendMessage"
TEXT="
<code>────────────────────</code>
<b>⚠️NOTIF MULTILOGIN SC V.1.0⚠️</b>
<code>────────────────────</code>
<code>Username    : </code><code>$user</code>
<code>Login Ip    : </code><code>$cekcek</code>
<code>Limit Ip    : </code><code>$iplimit</code>
<code>────────────────────</code>
<b>⚠️AUTO REMOVE MULTILOGIN⚠️</b>
<code>────────────────────</code>
"
curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
}

clear
echo -n > /var/log/xray/access.log
sleep 4
data=( `ls /etc/julak/limit/vmess/ip`);
#ASU
    for user in "${data[@]}"
    do
        iplimit=$(cat /etc/julak/limit/vmess/ip/$user)
        ehh=$(cat /var/log/xray/access.log | grep "$user" | cut -d " " -f 3 | sed 's/tcp://g' | cut -d ":" -f 1 | sort | uniq);
        cekcek=$(echo -e "$ehh" | wc -l);
        if [[ $cekcek -gt $iplimit ]]; then
            exp=$(grep -w "^#vm $user" "/etc/xray/config.json" | cut -d ' ' -f 3 | sort | uniq)
                  sed -i "/^#vm $user $exp/,/^},{/d" /etc/xray/config.json
                  sed -i "/^#vmg $user $exp/,/^},{/d" /etc/xray/config.json
                  sed -i "/^### $user $exp/d" /etc/vmess/.vmess.db
                  systemctl restart xray >> /dev/null 2>&1
                  jum2=$(cat /tmp/ipvmess.txt | wc -l)
                  rm -rf /etc/julak/limit/vmess/ip/$user
                  send_log
                else
            echo ""
        fi
        sleep 0.1
    done
