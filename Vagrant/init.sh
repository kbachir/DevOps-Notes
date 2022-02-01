#!/bin/bash
sudo apt-get update -y
sudo apt-get upgrade -y

sudo apt-get install nginx -y
sudo apt-get install python-software-properties

sudo apt-get install nodejs -y
curl - sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install nodejs -y
sudo npm install pm2 -g

cd /home/vagrant/code
npm install forever -g
npm install
forever start app.js