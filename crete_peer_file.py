import sys

public_server = sys.argv[1]
private_client = sys.argv[2]

conf = "[Interface]\n\
Address    = 192.168.2.2/32\n\
PrivateKey = "+private_client+" \n\
\n\
[Peer] \n\
# Name = public-server1.example-vpn.dev \n\
PublicKey = "+public_server+"\n\
Endpoint = public-server1.example-vpn.dev:51820 \n\
AllowedIPs = 0.0.0.0/0, : : /0 \n"

with open("peer.conf", "w") as f:
    f.write(conf)
