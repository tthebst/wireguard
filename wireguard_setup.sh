#! /bin/bash




#create google cloud micro instance
ssh-keygen -q -N "" -t rsa -f ~/.ssh/gcloud -C tim
echo -n "tim:" > $HOME/id_rsa.pub
cat $HOME/id_rsa.pub
cat $HOME/.ssh/gcloud.pub >> $HOME/id_rsa.pub
cat $HOME/id_rsa.pub
ls ~/.ssh/ 
gcloud compute --project=personal-stuff123 firewall-rules create wireguard --direction=INGRESS --priority=1000 --network=default --action=ALLOW --rules=udp:51820
gcloud beta compute --project=personal-stuff123 instances create instance-wire --zone=asia-east2-c --machine-type=f1-micro --subnet=default --network-tier=PREMIUM --metadata-from-file ssh-keys=$HOME/id_rsa.pub --maintenance-policy=MIGRATE --service-account=356728976673-compute@developer.gserviceaccount.com --scopes=https://www.googleapis.com/auth/devstorage.read_only,https://www.googleapis.com/auth/logging.write,https://www.googleapis.com/auth/monitoring.write,https://www.googleapis.com/auth/servicecontrol,https://www.googleapis.com/auth/service.management.readonly,https://www.googleapis.com/auth/trace.append --image=ubuntu-1804-bionic-v20191113 --image-project=ubuntu-os-cloud --boot-disk-size=10GB --boot-disk-type=pd-standard --boot-disk-device-name=instance-1 --reservation-affinity=any


#get IP address of created instance
IP="$(gcloud compute instances describe instance-wire  --format='get(networkInterfaces[0].accessConfigs[0].natIP)')"
echo "${IP}"


#connect to cloud instance and install wireguard 
echo timgretler@${IP}
ls -l /home
chmod +777 /home/create_server_file.py
ls -l /home
scp -v -i $HOME/.ssh/gcloud /home/create_server_file.py tim@${IP}:/home/tim
scp -v -i $HOME/.ssh/gcloud /home/create_server_file.py tim@${IP}:/home/tim
ssh -v -i $HOME/.ssh/gcloud tim@${IP} 'sudo add-apt-repository ppa:wireguard/wireguard;sudo apt-get -y update;sudo apt-get -y install wireguard;wg genkey | tee privatekey | wg pubkey > publickey;echo privatekey;python3 /home/tim/create_server_file.py "$(cat "/home/tim/privatekey")" "$(cat "/home/tim/publickey")" ;wg-quick up /home/tim/server.conf;sudo ufw allow 22/tcp;sudo ufw allow 51820/udp;sudo ufw enable'





