#!/bin/bash

clear
yellow "Add Nsdomain for Slowdns"
echo " "
echo -e "$green      Please select a Nsdomain type below               $NC"
echo  ""
tyblue "    1 : Enter your Nsdomain"
tyblue "    2 : Use a random Nsdomain"
echo ""
read -p "   Please select numbers 1-2 or Any Button(Random) : " host
echo ""
if [[ $host == "1" ]]; then
read -rp "Input ur ns-domain : " -e bantur
echo "$bantur" > /etc/xray/dns
echo "$bantur" > /root/nsdomain
echo ""
elif [[ $host == "2" ]]; then
#install NameServer
wget https://raw.githubusercontent.com/bagusid93/sc3/main/slowdns/ns-domain.sh && chmod +x ns-domain.sh && ./ns-domain.sh
rm -f /root/ns-domain.sh
clear
else
echo -e "Random Nsdomain/Nsdomain is used"
wget https://raw.githubusercontent.com/bagusid93/sc3/main/slowdns/ns-domain.sh && chmod +x ns-domain.sh && ./ns-domain.sh
rm -f /root/ns-domain.sh
fi

setup_dnstt() {
	cd
	mkdir -p /etc/slowdns
	wget -O dnstt-server "https://raw.githubusercontent.com/bagusid93/sc3/main/slowdns/dnstt-server" >/dev/null 2>&1
	chmod +x dnstt-server >/dev/null 2>&1
	wget -O dnstt-client "https://raw.githubusercontent.com/bagusid93/sc3/main/slowdns/dnstt-client" >/dev/null 2>&1
	chmod +x dnstt-client >/dev/null 2>&1
	./dnstt-server -gen-key -privkey-file server.key -pubkey-file server.pub
	chmod +x *
	mv * /etc/slowdns
	wget -O /etc/systemd/system/client.service "https://raw.githubusercontent.com/bagusid93/sc3/main/slowdns/client" >/dev/null 2>&1
	wget -O /etc/systemd/system/server.service "https://raw.githubusercontent.com/bagusid93/sc3/main/slowdns/server" >/dev/null 2>&1
	sed -i "s/xxxx/$NS_DOMAIN/g" /etc/systemd/system/client.service 
	sed -i "s/xxxx/$NS_DOMAIN/g" /etc/systemd/system/server.service 
}
setup_dnstt
