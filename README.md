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


### Development Env

![Dev Envrionment Diagram](https://user-images.githubusercontent.com/98312982/151946623-1b12406e-1e10-401b-8478-d8c63ea2371d.png)


```

Vagrant.configure("2") do |config|

 config.vm.box = "ubuntu/xenial64"
# creating a virtual machine ubuntu 

end
```

- create a VM `vagrant up`
- check status `vagrant status`
- delete VM `vagrant destroy`
- pause VM `vagrant halt`
- to update `vagrant reload`
- access VM through SSH `vagrant ssh`
- exit VM `vagrant logout`
- reload `reload`


- interact with OS `systemctl status/restart/start/stop {package name}`
- `apt-get package manager install/remove/update/upgrade {package name}`
- exit VM `exit`
- super user do (equiv to administrator) `sudo`


### Linux Basics

Linux has loads of different distributions, so how do you find out which distro is being used in someone else's VM?

- The name of the machine `uname` for more detailed info `uname -a`
- Current location `pwd`
- List directories/files `ls` for all including hidden files `ls -a`
- make directory `mkdir <name-of-dir>`
- navigate to dir `cd <name-of-dir>`
- create a new file `touch <file-name>` or `nano <file-name>`
- display content of a file `cat <file_name>`
- remove file `rm -rf <file-name>` [rf is for removing open files] [r is for recursive, f is for forcing]
- copy a file `cp <file-destination-name> <final-destination>`
- to rename `mv <file-name> <new-name>` if not in the same working dir `mv file-name /different/folders/new-name`
- to move `mv <file-name> <new-dir>`
- view all running processes `top` to return to terminal `ctrl + C`


### Permissions

- READ / Write / Executable / Read Only
- check permissions `ll`
- change permissions `chmod _permission [+x, ] <file-name>`
`chmod +rwx filename` to add permissions.
`chmod -rwx directoryname` to remove permissions.
`chmod +x filename` to allow executable permissions.
`chmod -wx filename` to take out write and executable permissions.

_Note that “r” is for read, “w” is for write, and “x” is for execute._ 


### Bash Scripting

.sh = shell extension

`#!/bin/bash`


### Configuring provision.sh

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


### Configuring a local file sync

creating a provision file that syncs a local file to the VM
` config.vm.provision "shell", path: "init.sh"`
                      `shell` is how linux knows to run the command in the terminal
                               `path` specifies where it can find the file-name


### Configuring a synced folder
 config.vm.synced_folder ".", "/home/vagrant/app"
                        # . means everything from specified location


### Nano Commands

- to enter nano `nano <filename>`
- to save `ctrl s`
- to exit `ctrl x`

https://gist.githubusercontent.com/harssh/7638233/raw/5c491cfc633d5c83f634a917dd23a9259e712567/nano_text_editor_cmds.txt


### Ruby Commands

Run `gem install bundler` to install package
Run `bundler` to install dependencies

To run the tests `rake <filename>`, this time it was `rake script`. 
 