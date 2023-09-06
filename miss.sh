clear
echo -e "\033[0;35m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "           Edit Limit Vmess          \E[0m"
echo -e "\033[0;35m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo ""
grep -E "^#vm " "/etc/vmess/.vmess.db" | cut -d ' ' -f 2 | column -t | sort | uniq
echo ""
red "tap enter to go back"
echo -e "\033[0;35m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
read -rp "Input Username : " user
if [ -z $user ]; then
menu
else
read -p "Limit (IP): " ips
echo -e "${ips}" > /etc/vmess/limit-ip/${user}
clear
echo -e "\033[0;35m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo " VMESS Account Was Successfully Edited"
echo -e "\033[0;35m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo ""
echo " Client Name  : $user"
echo " Limit IP Ready  : $ips IP"
echo ""
echo -e "\033[0;35m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo ""
fi
