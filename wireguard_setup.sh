#! /bin/bash




#create google cloud micro instance
gcloud beta compute --project=personal-stuff123 instances create instance-wire --zone=asia-east2-a --machine-type=f1-micro --subnet=default --network-tier=PREMIUM --metadata=ssh-keys=tgretler:ssh-rsa\ AAAAB3NzaC1yc2EAAAADAQABAAACAQCg\+R/6LNlVAxao/aXFdLx8sm55lFbFOldlC5r6aTptJeHIDBhF8ltdAc2lz3zYPwNmIuXKccm/uQY1UspFIVQ\+OayqpSe5sNaxQjavjsb6JjGwJr7MjMgqD9ILM8hiUvL81R9/9dfGmYoAFez9ElNeeM1GD7nX6/0Qe4iGBHk8WuQxyY4ESvDLEiGdzIwM2\+rhEmCx/\+Q2Ow\+FTFiPO2euY9M7SEqnnxqOmzwD5dfNTLiDsMWI3Ww3irKLZK1OBWB5v1TpwF9K5SkvUNrNTfu\+ahOCxQVTIPGCZTYvfS\+jqTHrCnTUnvcMwcORqZq1Ugyfuxj/D5f4zqTZ4MYDxQg7OXrPMjxDeKeSpUv1SzpGhXb9I0vw77i7cTOG4So3oLZbp94I6a60bsBH2IZFQ5QydRXa7H9XXhppsh1oDYJRhcm\+r57eR69SYn5w61AKkvSZIyyBKqMBKtkNL0XbE75eTc7MC6iBrqwkXGlY8\+A5XiHjA\+6k7csMg19kAmxkq0ziePb5zoGieyvBemfYaXV2HqdVd33jgekadz84HNF5HIvt\+KVYBSZRQrN655\+fjLFRyw33qpo669fJxIVEiyUutcnzw1zrIQ7e9Px7G70yepKIEqO\+n019bIkb6zDQOKfs5\+FX42/vHCXNkKrQUuZsOz5AYubSvsru2udo9Q2cCQ==\ tgretler@student.ethz.ch --maintenance-policy=MIGRATE --service-account=356728976673-compute@developer.gserviceaccount.com --scopes=https://www.googleapis.com/auth/devstorage.read_only,https://www.googleapis.com/auth/logging.write,https://www.googleapis.com/auth/monitoring.write,https://www.googleapis.com/auth/servicecontrol,https://www.googleapis.com/auth/service.management.readonly,https://www.googleapis.com/auth/trace.append --image=ubuntu-1804-bionic-v20191113 --image-project=ubuntu-os-cloud --boot-disk-size=10GB --boot-disk-type=pd-standard --boot-disk-device-name=instance-1 --reservation-affinity=any


OUTPUT="$(gcloud compute instances describe instance-wire  --format='get(networkInterfaces[0].accessConfigs[0].natIP)')"
echo "${OUTPUT}"

gcloud compute instances stop instance-wire