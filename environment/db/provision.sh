#!/bin/bash
# be careful of these keys, they will go out of date
# sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv D68FA50FEA312927
# echo "deb https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list
sudo apt-get purge mongodb-org* -y
wget -qO - https://www.mongodb.org/static/pgp/server-4.0.asc | sudo apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.0.list
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install -y mongodb-org=4.0.27 mongodb-org-server=4.0.27 mongodb-org-shell=4.0.27 mongodb-org-mongos=4.0.27 mongodb-org-tools=4.0.27


# sudo apt-get install mongodb-org=3.2.20 -y
# sudo apt-get install -y mongodb-org=3.2.20 mongodb-org-server=3.2.20 mongodb-org-shell=3.2.20 mongodb-org-mongos=3.2.20 mongodb-org-tools=3.2.20

# remoe the default .conf and replace with our configuration
# sudo rm /etc/mongod.conf
# sudo ln -s /home/ubuntu/environment/mongod.conf /etc/mongod.conf
# change bind ip
sudo sed -i 's/^\(\s*\)bindIp: .*/\1bindIp: 0.0.0.0/' /etc/mongod.conf
# if mongo is is set up correctly these will be successful

sudo systemctl restart mongod
sudo systemctl enable mongod
