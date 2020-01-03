import sys

public_server = sys.argv[1]
private_client = sys.argv[2]
vpn_server_ip = sys.argv[3]

conf = "[Interface]\n\
Address    = 10.200.200.2/32\n\
PrivateKey ="+private_client+" \n\
\n\
[Peer] \n\
# Name = public-server1.example-vpn.dev \n\
PublicKey = "+public_server+" \n\
Endpoint = " + vpn_server_ip + ":51280 \n\
AllowedIPs = 0.0.0.0/0, ::/0\n"

with open("/home/peer.conf", "w") as f:
    f.write(conf)
