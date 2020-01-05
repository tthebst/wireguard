import sys


private_server = sys.argv[1]
public_client = sys.argv[2]

conf = "[Interface]\n\
# Name = VPN-SERVER \n\
Address = 10.200.200.1/24\n\
PostUp = iptables -A FORWARD -i %i -j ACCEPT; iptables -t nat -A POSTROUTING -o ens4 -j MASQUERADE\n\
PostDown = iptables -D FORWARD -i %i -j ACCEPT; iptables -t nat -D POSTROUTING -o ens4 -j MASQUERADE \n\
ListenPort = 51820\n\
SaveConfig = true\n\
PrivateKey = "+private_server+" \n\
\n\
[Peer]\n\
PublicKey    = "+public_client+"\n\
AllowedIPs = 10.200.200.2/32 \n\
"


with open("/home/server.conf", "w") as f:
    f.write(conf)
