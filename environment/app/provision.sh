#!/bin/bash
# move to app folder
cd app
# install nodejs

sudo apt-get install python-software-properties -y
curl -sL https://deb.nodesource.com/setup_17.x | sudo -E bash -
sudo apt-get install nodejs -y


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

# Restart nginx for changes to take place
 
sudo systemctl restart nginx

# visit public ip and see if its running
sudo systemctl enable nginx


# Append the variable to /etc/environment
echo "DB_HOST=mongodb://10.0.4.190:27017/posts" | sudo tee -a /etc/environment >/dev/null

# Source /etc/environment to apply changes to the current session
source /etc/environment

# remove any instances of pm2 that could cause error
sudo rm -rf /usr/lib/node_modules/pm2

# install npm and pm2 and start the app 
sudo -E npm install
sudo npm install pm2 -g
sudo pm2 kill
sudo pm2 start seeds/seed.js
sudo pm2 start app.js



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
