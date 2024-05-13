#!/bin/bash

# install nodejs
#sudo apt-get install python-software-properties -y
#curl -sL https://deb.nodesource.com/setup_17.x | sudo -E bash -
#sudo apt-get install nodejs -y

# run update and upgrade
#sudo apt-get update -y
#sudo apt-get upgrade -y

# install nginx
sudo apt-get install nginx -y 


# Update the sources list
sudo apt-get update -y

# upgrade any packages available
sudo apt-get upgrade -y


# install git
sudo apt-get install git -y

# Reverse proxy
sudo sed -i '51s/.*/\t        proxy_pass http:\/\/localhost:3000;/' /etc/nginx/sites-available/default
 
sudo systemctl restart nginx

# visit public ip and see if its running
sudo systemctl enable nginx

# move to app folder
cd app

# install pm2
export DB_HOST=mongodb://54.171.140.180:27017/posts

sudo -E npm install
#sudo npm audit fix --force
sudo -E npm install pm2 -g
sudo pm2 kill
sudp pm2 start app.js



# sudo npm install -g npm@latest
# sudo npm audit fix --force
# sudo npm install -g pm2
#sudo apt-get install nginx -y

# remove the old file and add our one
#sudo rm /etc/nginx/sites-available/default
#sudo cp /home/ubuntu/sre_jenkins_cicd/environment/app/nginx.default /etc/nginx/sites-available/default

# finally, restart the nginx service so the new config takes hold
# sudo service nginx restart
# sudo service nginx enable
