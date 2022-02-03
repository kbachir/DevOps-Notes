#!/bin/bash
sudo apt-get update -y
sudo apt-get upgrade -y

sudo apt-get install nginx -y
sudo apt-get install python-software-properties

sudo apt-get install nodejs -y
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install nodejs -y
sudo npm install pm2 -g
sudo cp /srv/provisioning/vagrant/default /etc/nginx/sites-available/default
sudo systemctl restart nginx


cd /srv/provisioning/vagrant/app
echo "export DB_HOST='mongodb://192.168.10.150:27017/posts'" >> ~/.bashrc
source ~/.bashrc
npm install forever -g
npm install
#forever start app.js