
#!/bin/bash

# OS Übersicht
#screenfetch
# WAN und LAN IP
WANIP4=$(dig +short myip.opendns.com @resolver1.opendns.com)
WANIP6=$(curl -s https://6.ifcfg.me/)
ADDRESS=$(hostname -I | cut -d ' ' -f 1)
# Begrüßung in Großschrift
figlet -f smslant      Wolf2000
echo "   https://deine Webseite,Server"
echo "***************************************"
echo "CPU Temperatur" 
sensors | grep temp | cut -c19-28
#dieser Befehl funktioniert nur mit Armbian Linux!
echo "***************************************"
echo "Temperatur Gehäuse"
T0=`cat /sys/power/axp_pmu/pmu/temp`
T1=$'0.001'
T2=$T0
echo | gawk '{print '$T0'*'$T1' " °C "}'
      #dieser Befehl funktioniert nur mit BANANIAN Linux!
echo "***************************************"
#echo "SATA Temperatur" #funktioniert nur mit HITACHI Festplatten
#hdparm -H /dev/sda1   
#echo
echo "WAN IPv4: $WANIP4"
echo "---------------------------------------"
echo "LAN IP: $ADDRESS"
echo "---------------------------------------"
date
echo "---------------------------------------"
#echo "htop für Systemmonitor"      #ein paar einfache Textausgaben
#echo "bwm-ng für Traffic Monitor"  #ein paar einfache Textausgaben

# VOLT,AMPERE,WATT ANZEIGE
#dieser Befehl funktioniert nur mit Armbian Linux!
echo "Strom - Verbrauch"
V0=`cat /sys/power/axp_pmu/ac/voltage` 
V3=`cat /sys/power/axp_pmu/ac/amperage` 
V1=$V0 
V2=$'0.000001' 
V4=$'0.000000000001' 
echo | gawk '{print '$V1'*'$V2' " Volt " '$V3'*'$V2' " Ampere " '$V3'*'$V1'*'$V4' " Watt "}'
#echo | gawk '{print '$V3'*'$V2' " Ampere "}'
#echo | gawk '{print '$V3'*'$V1'*'$V4' " Watt "}'
echo "---------------------------------------"
exit 0

# benötigte Programme apt-get install figlet screenfetch gawk
# powered by Wolf2000, HAVE FUN und lasst ein Danke da ;-)
# ausserdem will ich mit Herzlich bei The Master und Wolf2000 bedanken, für die Hilfe des VOLT,AMPERE,WATT ANZEIGE scripts 
# Auch eine Danke an Johination

