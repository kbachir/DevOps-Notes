> Install 'Markdown All In One' extension

# What is DevOps
## Why DevOps
### Benefits of DevOps

**Four pillars of DevOps best practice**
- Ease of Use
- Flexibility (ability to add new features as and when needed by product owner)
- Robustness - Faster delivery of product
- Cost - Cost effective (thru automation, CICD pipelines and subsequent efficiency)


### Monolith, 2 tier & Microservices Architecture
- A single box or that contains the frontend, backend, database. Essentially the monolith of the entire programme. 
- We deploy in cloud services like AWS or Azure, turning the "single box architecture into 2 tier architecture".


### Development Env

![Dev Envrionment Diagram](https://user-images.githubusercontent.com/98312982/151946623-1b12406e-1e10-401b-8478-d8c63ea2371d.png)

### Configuring a VM for Ubuntu

```
Vagrant.configure("2") do |config|

 config.vm.box = "ubuntu/xenial64"
# creating a virtual machine ubuntu 

end
```

>- create a VM `vagrant up`
>- check status `vagrant status`
>- delete VM `vagrant destroy`
>- pause VM `vagrant halt`
>- to update `vagrant reload`
>- access VM through SSH `vagrant ssh`
>- exit VM `vagrant logout`
>- reload `reload`
>- interact with OS `systemctl status/restart/start/stop {package name}`
i.e `systemctl status nginx`
>- `apt-get package manager install/remove/update/upgrade {package name}`
>- exit VM `exit`
>- super user do (equiv to administrator) `sudo`


### Linux Basics

Linux has loads of different distributions, so how do you find out which distro is being used in someone else's VM?

>- The name of the machine `uname` for more detailed info `uname -a`
>- Current location `pwd`
>- List directories/files `ls` for all including hidden files `ls -a`
>- make directory `mkdir <name-of-dir>`
>- navigate to dir `cd <name-of-dir>`
>- create a new file `touch <file-name>` or `nano <file-name>`
>- display content of a file `cat <file_name>`
>- remove file `rm -rf <file-name>` [rf is for removing open files] [r is for recursive, f is for forcing]
>- copy a file `cp <file-destination-name> <final-destination>`
>- to rename `mv <file-name> <new-name>` if not in the same working dir `mv file-name /different/folders/new-name`
>- to move `mv <file-name> <new-dir>`
>- view all running processes `top` to return to terminal `ctrl + C`


### Permissions

>- READ / Write / Executable / Read Only
>- check permissions `ll`
>- change permissions `chmod _permission [+x, ] <file-name>`
>- `chmod +rwx filename` to add permissions.
>- `chmod -rwx directoryname` to remove permissions.
>- `chmod +x filename` to allow executable permissions.
>- `chmod -wx filename` to take out write and executable permissions.
>
>_Note that “r” is for read, “w” is for write, and “x” is for execute._ 


### Bash Scripting _(shebang!)_

< instructs the OS on which interpeter to run >

.sh = shell extension

>`#!/bin/bash`


### Configuring provision.sh
< a series of administrative actions _(superuser do)_ that install and update a number of required packages on VM startup. Automates a lot of the process for testing the app kit provided in ./app >

```
`sudo apt-get update -y`
`sudo apt-get upgrade -y`

`sudo apt-get install nginx -y`
`sudo apt-get install python-software-properties`

`sudo apt-get install nodejs -y`
`curl - sL https://deb.nodesource.com/setup_6.x | sudo -E bash -`
`sudo apt-get install nodejs -y`
`sudo npm install pm2 -g`

`cd /home/vagrant/app`
`npm install forever -g`
`npm install`
`forever start app.js`
```

### Configuring a local file sync

creating a provision file that syncs a local file to the VM
` config.vm.provision "shell", path: "init.sh"`
                      `shell` is how linux knows to run the command in the terminal
                               `path` specifies where it can find the file-name


### Configuring a synced folder
 config.vm.synced_folder ".", "/home/vagrant/app"
                        # _. means everything from specified location_


### Nano Commands

- to enter nano `nano <filename>`
- to save `ctrl s`
- to exit `ctrl x`
- to writeout `ctrl O`

https://gist.githubusercontent.com/harssh/7638233/raw/5c491cfc633d5c83f634a917dd23a9259e712567/nano_text_editor_cmds.txt


### Ruby Commands

< installed a package that automatically scanned for and installed dependencies for our ruby file: >

Run `gem install bundler` to install package

Run `bundler` to install dependencies

To run the tests `rake <filename>`, this time it was `rake script`. 


### Linux Variables

< _Linux variables work under the same concept as Python vars, they store information_ >

- Create Linux variable: `<var-name>=value` i.e `FIRST-NAME = KARIM`
- Check a variable: ` echo $<var-name>`

### Environment Variables

- Environment variable `env var`
- Check an env var `printenv key` or `env`
- Create env var `export` < this will allow the system to recognise the term as an env variable `export LAST_NAME=BACHIR` >
- Making an env var persistent `sudo nano .bashrc` < _will enter .bashrc file, entering an `export <var_name>` will make that variable persistent_ >
- delete env var `unset var_name`


_DB Connection Requirement_

```
// connect to database
if(process.env.DB_HOST) {
  mongoose.connect(process.env.DB_HOST);

  app.get("/posts" , function(req,res){
      Post.find({} , function(err, posts){
        if(err) return res.send(err);
        res.render("posts/index" , {posts:posts});
      })
  });
}
```

### Reverse Proxy with  `nginx`

< _Reverse proxies are ways to reroute/redirect traffic. I.e if a user wants to visit port 3000, they shouldn't have to enter the actual code._ >

show a list of current process `ps aux`
terminate one of those processes `sudo kill <>`

< _back all the way out of local files_ >

cd etc/nginx/sites-available
`cat` or `nano` default

< _in the server block, where location is specified, enter the following instructions:_ >

```
proxy_pass http://localhost:3000/;
proxy_http_version 1.1;
proxy_set_header Upgrade $http_upgrade;
proxy_set_header Connection 'upgrade';
proxy_set_header Host $host;
proxy_cache_bypass $http_upgrade;
```
< _this is how we tell nginx to reroute traffic from port 80 to port 3000_ >

test the syntax: 
```
sudo nginx -t
```

reload the plugin: 
```
sudo systemctl restart nginx
```

### Setting up two VMs
```
config.vm.define "db" do |db|
- db.vm.box = "ubuntu/xenial64"
- db.vm.network "private_network", ip: "192.168.10.150"
```
< _we're configuring a second VM on the same vagrant file and assinging a name in the quotation marks_ >

![2 Tier Architecture Diagram](https://user-images.githubusercontent.com/98312982/152544826-a46f71c6-6fb6-4358-a55c-95c747d2268d.png)

vagrant status
vagrant ssh app

sudo apt-get update -y
sudo apt-get upgrade -y

vagrant ssh db

sudo systemctl mongodob

installing monogodb:

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv D68FA50FEA312927

echo "deb https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list

//response: deb https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse

sudo apt-get install -y mongodb-org=3.2.20 mongodb-org-server=3.2.20 mongodb-org-shell=3.2.20 mongodb-org-mongos=3.2.20 mongodb-org-tools=3.2.20

sudo apt-get upgrade

sudo systemctl status mongod
sudo systemctl restart mongod
sudo systemctl enable mongod
sudo systemctl status mongod

cd /etc
nano mongod.conf

net:
  port: 27017
  bindIp: 0.0.0.0

sudo systemctl restart mongod
sudo systemctl enable mongod


ssh into app

export DB_HOST='mongodb://192.168.10.150:27017/posts'

in app/app/app
node seeds/seed.js



source ~/.bashrc

### MongoDB in the DB VM

_Installing specific version for this app_

Add a key first:
```
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv D68FA50FEA312927
```
_Run echo command to install and display version install of mongod:_
```
echo "deb https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list

sudo apt-get update -y
sudo apt-get upgrade -y

sudo apt-get install -y mongodb-org=3.2.20 mongodb-org-server=3.2.20 mongodb-org-shell=3.2.20 mongodb-org-mongos=3.2.20 mongodb-org-tools=3.2.20

sudo systemctl enable mongod
sudo systemctl start mongod
sudo systemctl status mongod
```

_Adjust bind IP so that mongod has access/routes to the address we want:_

```
cd /etc
sudo nano mongod.conf
```

_Change under #network interfaces bindIp: 127.0.0.1 to bindIp: 0.0.0.0 or bindIp: 192.168.56.4 (the app VM IP)_

```
sudo systemctl restart mongod
```

Then switch VMs to app, and create a permanent env variable DB_HOST
```
nano ~/.bashrc, add export DB_HOST='mongodb://192.168.56.5:27017/posts'
source ~/.bashrc
```

Check it with printenv DB_HOST

_then run:_
```
node seeds/seed.js
npm start
```

### AWS and Cloud Computing
### insert image?

- We are using Europe
- There are usually at least two servers available for each region. 
- Choose location based on who you're deploying for. ATM we only have access to Ireland servers. 

EC2 (_Amazon Elastic Compute Cloud_)

- Enables you to have multiple instances with as many or as few virtual servers as you need.
- Allows you to configure security networking, and manage storage. Can scale up and down as needed.
- Saves for us because migrated servers are managed by Amazon and we can get access to great hardware and internet easily. 
- Go global in relative seconds. 

Migration Demo App:

_Steps include_:

- Selecting Linux Ubuntu 16.04-18.04
- Migrate app data
- Expose needed ports
- Launch!

_To Begin:_

- Switch location in top right first. `Select Ireland` atm. 
- Go to EC2
- `Launch Instance` (orange button)
- Pick `Ubuntu server 18.04 LS`
- Leave default rules for T2.micro
- Leave subnet alone for now
- Add a new key in the format: `NAME - ENG103A_KARIM`
- Create a new security group and set the name and desc as above
- IP Rules: `SSH; TCP; 22; My IP; "My IP Only"` 
- Review & Launch
- Create an ~/.ssh folder locally and add the private key file into it.
- Upon launch, select "Choose an existing key pair" and find `DevOps103a RSA`

Then:

Find the instance and security group:
- Click `Security Group`
- Select `Edit inbound rules`
- Set an inbound rule for `HTTP` and `any ipv4`

After launch, we need to set up some permissions:

- `chmod 400 eng103a.pem` to make the DevOps key only readable only to owner
- `ssh -i "eng103a.pem" ubuntu@ec2-3-251-89-188.eu-west-1.compute.amazonaws.com` to connect to the machine, found in the instance list > start
- Go to browser and check ports, it should display NGINX is installed.
- In the terminal, get your github link and replace `tree/master` with `trunk` like below. We modify it to work with subversion as so: 
```
  https://github.com/kbachir/GitNotes/tree/main/Vagrant > https://github.com/kbachir/GitNotes/trunk/Vagrant
```
- Run `svn https://github.com/kbachir/GitNotes/trunk/Vagrant`
- Alternatively, we can clone Github repo. 
