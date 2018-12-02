LEO1 Portfolio Two; Group 30

Den givne "opskrift" var fulgt, og container C1 var forsøgt skabt.
Der var nogle problemer i starten, da hele dnsmasq pakken blev installeret ved 
en fejl, og derefter blev afinstalleret. Men det havde gjort at der var blevet
sat nogle konfigurationer i den .conf fil, som lxc-net brugte til at skabe 
lxcbr0. Disse blev fundet og udkommenteret, og herefter virkede lxc-net og 
det var muligt at lave de to containere. 

Derefter blev lightptd sat op i C1, og rng.sh blev skrevet i C2.
Der blev redigeret i rng.sh i forhold til den opgivne fra "opskriften",
da det ikke virkede efter hensigten ændrede vi /dev/random til /dev/urandom.
Som giver et pseudo random tal i stedet.
Socat blev brugt til at lytte på port 8080.
iptables blev brug til at "preroute" alt kommunikation fra "wlan0"(host name) 
port 80 til C1 10.0.3.11 port 80. This functionality has been added to portforwarding.sh

For at automatisere socat, servicen socat_init blevet tilføjet til openrc's 
default runlevel med kommandoen "rc_update add socat_init default".
Servicen kalder et script som starter socat i bagrunden og opretter 
/run/socat.pid som indeholder socat PID.
Dette filnavn passes til openrc af servicen, så socat kan lukkes når 
servicen termineres.


