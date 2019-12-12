import sys

conf = "[Interface]\n\
# Name = VPN-SERVER \n\
Address = 192.0.2.1/24 \n\
ListenPort = 51820\n\
PrivateKey = "+sys.argv[1]+" \n\
DNS = 1.1.1.1 \n "


with open("server.conf", "w") as f:
    f.write(conf)
