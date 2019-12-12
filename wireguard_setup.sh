#! /bin/bash




#create google cloud micro instance
gcloud beta compute --project=personal-stuff123 instances create instance-wire --zone=asia-east2-a --machine-type=f1-micro --subnet=default --network-tier=PREMIUM --metadata-from-file ssh-keys=/home/gcloud/gcloud_wireguard.pub --maintenance-policy=MIGRATE --service-account=356728976673-compute@developer.gserviceaccount.com --scopes=https://www.googleapis.com/auth/devstorage.read_only,https://www.googleapis.com/auth/logging.write,https://www.googleapis.com/auth/monitoring.write,https://www.googleapis.com/auth/servicecontrol,https://www.googleapis.com/auth/service.management.readonly,https://www.googleapis.com/auth/trace.append --image=ubuntu-1804-bionic-v20191113 --image-project=ubuntu-os-cloud --boot-disk-size=10GB --boot-disk-type=pd-standard --boot-disk-device-name=instance-1 --reservation-affinity=any


#get IP address of created instance
IP="$(gcloud compute instances describe instance-wire  --format='get(networkInterfaces[0].accessConfigs[0].natIP)')"
echo "${IP}"

python3 create_server_file.py 




ssh -i /home/gcloud/gcloud_wireguard timgretler@$IP 'sudo add-apt-repository ppa:wireguard/wireguard;sudo apt-get update;sudo apt-get install wireguard;wg genkey | tee privatekey | wg pubkey > publickey'




gcloud compute instances stop instance-wire