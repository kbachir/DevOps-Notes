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


- interact with OS `systemctl status/restart/start/stop {package name`}
- `apt-get package manager install/remove/update/upgrade {package name}`
- exit VM `exit`
- super user do (equiv to administrator) `sudo`

![Dev Envrionment Diagram](https://user-images.githubusercontent.com/98312982/151946623-1b12406e-1e10-401b-8478-d8c63ea2371d.png)


### Linux Basics

Linux has loads of different distributions, so how do you find out which distro is being used in someone else's VM?

- The name of the machine `uname` for more detailed info `uname -a`
- Current location `pwd`
- List directories/files `ls` for all including hidden files `ls -a`
- make directory `mkdir _name-of-dir_`
- navigate to dir `cd _name-of-dir_`
- create a new file `touch _file-name_` or `nano _file-name_`
- display content of a file `cat _file_name_`
- remove file `rm -rf _file-name_` [rf is for removing open files] [r is for recursive, f is for forcing]
- copy a file `cp _file-destination-name_ _final-destination_`
- to rename `mv _file-name_ _new-name_` if not in the same working dir `mv file-name /different/folders/new-name`
- to move `mv _file-name_ _new-dir_`
- view all running processes `top` to return to terminal `ctrl + C`


### Permissions

- READ / Write / Executable / Read Only
- check permissions `ll`
- change permissions `chmod _permission [+x, ]_ _file-name_`
`chmod +rwx filename` to add permissions.
`chmod -rwx directoryname` to remove permissions.
`chmod +x filename` to allow executable permissions.
`chmod -wx filename` to take out write and executable permissions.

_Note that “r” is for read, “w” is for write, and “x” is for execute._ 


### Bash Scripting

.sh = shell extension



### Nano Commands

- to enter nano `nano _filename_`
- to save `ctrl s` 
- to exit `ctrl x`