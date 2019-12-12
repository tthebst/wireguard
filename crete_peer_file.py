import sys


conf = "[Peer] \n\
# Name = public-server1.example-vpn.dev \n\
PublicKey = <public key for public-server1.example-vpn.dev> \n\
Endpoint = public-server1.example-vpn.dev:51820 \n\
AllowedIPs = 0.0.0.0/0, : : /0 \n"

with open("server.conf", "w") as f:
    f.write(conf)
