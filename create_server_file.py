import sys


private_server = sys.argv[1]
public_client = sys.argv[2]

conf = "[Interface]\n\
# Name = VPN-SERVER \n\
Address = 192.0.2.1/24 \n\
ListenPort = 51820\n\
PrivateKey = "+private_server+" \n\
DNS = 1.1.1.1 \n \
\n\
[Peer]\n\
PublicKey    = "+public_client+"\n\
AllowedIPs   = 192.168.2.2/32, fd00:7::2/48\n\
"


with open("server.conf", "w") as f:
    f.write(conf)
