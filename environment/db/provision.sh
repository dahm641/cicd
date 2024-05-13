#!/bin/bash
# be careful of these keys, they will go out of date
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv D68FA50FEA312927
echo "deb https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list

# install mongo db

sudo apt-get install mongodb-org=3.2.20 -y
sudo apt-get install -y mongodb-org=3.2.20 mongodb-org-server=3.2.20 mongodb-org-shell=3.2.20 mongodb-org-mongos=3.2.20 mongodb-org-tools=3.2.20
sudo apt-get update -y
sudo apt-get upgrade -y

# change bind ip
sudo sed -i 's/^\(\s*\)bindIp: .*/\1bindIp: 0.0.0.0/' /etc/mongod.conf
# if mongo is is set up correctly these will be successful

# enable mongo db
sudo systemctl enable mongod
sudo systemctl restart mongod
