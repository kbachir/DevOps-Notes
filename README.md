# Intro to DevOps

## The Software Development Life Cycle (SDLC):

The lifecycle refers to a set of defined steps that we have to follow as we create software, especially if we want that software to be high quality. It goes through the following stages:

**The First Phase**

  1. Defining the Objective
   - The software dev team must define the objective and identify the problem that needs to solved.
   - At it's core, it's about gathering the requirements from the stakeholders from the project.
   - Must be precise from early on so that the  team's solution doesn't constantly change.
   - If the requirement's aren't precise, it could mess up delivery schedules.
   - The core objectve of the company needs to be kept in mind. Consistency is important and the company must have it's own priorities.  

      To make sure we have a detailed, comprehensible list of requirements, the team must interact with the end-users, understand how they currently execute a particular task, start to float ideas about potential solutions, and how these solutions may fit their workflow. This is important as this is a cycle, meaning the project could already exist in some version.    


2. Planning Stage
  - Developers determine the costs and resources needed to create the solution during this stage.
  - The team decides what should be built. Resources are scarce, and even if they weren't, developers should aim to avoid implementing useless features. 
  - Team must determine the cost and resources needed for each feature. They should also consider the risks involved. 
  - The team should consider and include alternative solutions as they may be lower risk. 


3. Design Stage
  - _The team defines the solution's structure, like how an app may connect ot a server or a database, and even how the code is going to be divided._
  - This is about planning the solution's architecture. 
  - May detail the connections between a client and server, how a database may be structured and the design pattern that the code itself will follow. 
  - This step requires the developers involvement more as they will directly be working on the results of this plan. 

      By the end of the design phase, a team should know what features are worth building and which ones will work if implemented.

  Reasons why some features aren't worth building:
   - The value wasn't there: _if there are too few users, it's not worth building._
   - The usability isn't there: _a feature may be useful but nobody will use it if it's too complicated._
   - The feasibility isn't there: _may be too difficult, distracting or costly to create._
   - The business viability isn't there: _It may not make any financial sense to implement a feature._

**The Second Phase**

  By now, the list of requirements should be clearly defined and specific. 

   4. Coding Stage
   - This is the developers start to translate the design into code. 
   - Every developer must stick to the previously established design pattern. This ensures consistency within the project.
   - This includes the structure of the project and how each class is defined, potentially even down to the level of naming conventions for files, methods, classes and properties. 
   - These guidelines help the team produce organised code that can be understood by the entire team. 
   - The team must use a form of **source control**. This is the technology that keeps track of changes made to files. It can also assist in merging different versions. 
      - This is a system whereby every team member has a copy of the source code and uploads their changes to a cloud-hosted copy, such as on GitHub.
      - Each developer can make changes locally, create a solution and test it before pushing changes to the cloud. 

   5. Testing Stage
   - The team must test against the requirements to ensure that the solution meets them.Team also tests for bugs and defect.
   - The source code is tested and scanned for any deficiencies to examine if the solution is complete. 
   - This includes testing actual code, examining each feature and its behaviour, and make sure the solution doesn't crash.
   - There are also **User Interface (UI) Tests** to evaluate if the UI interacts with the solution properly.
   - This stage doesn't mean developers don't need to test their code as they develop. 
   - This stage would include beta testing, like in gaming. Beta testers aren't necessarily the ones who identify and report issues. Instead, the team can identify issues based on how beta testers interact and behave with certain features: i.e is it too hard to find, or is it too long to figure out?

   6. Deployment Stage
   - The final step in the first iteration, where the solution is delivered to the end user. 
   - The goal is now to deploy the solution to the production environment. Through this, the users will be able to access the solution.

We follow this process to ensure that development is efficient. 

## About DevOps:

**Four Pillars of DevOps**
- Ease of use
  - Prioritses quick human interaction
- Flexibility
  - Flexible to add features as and when product owner wants
- Robustness
  - Faster and more consistent delivery of product with less risk
- Cost Effective 
  - Automation and efficiency increases significantly reduce cost

### Monolith, Two-Tier & Microservices Architecture

**Monolith**: 
- A single layer that contains front end and back end code.
- The programme needs to be interrupted and rebuilt whenever changes are made or features are added.
  
**Two-tier**:
- Breaking down into client and server applications. Users will not interact with server applications.
- Will run faster
- Two tier applications don't typically present data to users. Instead, they interact with a presentation layer on the client, which will feed them data from the database server.
Tier 1 = Client Server (what users interact with)
Tier 2 = Database Server (where data is stored and pulled from)

**Microservices**:
- Separating a large application into smaller independent parts that each have their own realm of responsibility. 
- Services/features are hosted on separate servers that are loosely connected. 
- The services work relatively indepedently of each other but communicate together when necessary. 

# Linux and Virtual Machines

![Dev Envrionment Diagram](https://user-images.githubusercontent.com/98312982/151946623-1b12406e-1e10-401b-8478-d8c63ea2371d.png)

## Installing Vagrant

Download [Normal installers for] Vagrant, VirtualBox, Ruby one-click installer and install them.

**Configuring vagrantfile for Ubuntu**

```
$script = <<-'SCRIPT'
apt-get update -y
apt-get upgrade -y
apt-get install -y nginx
SCRIPT

Vagrant.configure("2") do |config|
 config.vm.box = "ubuntu/xenial64"
# creating a virtual machine ubuntu 
 config.vm.network "private_network", ip: "192.168.56.4"
 config.vm.synced_folder "src/", "/home/vagrant/code"
 config.vm.provision "shell", inline: $script
 config.vm.provision "shell", path: "src/init.sh"
end
```
**Configuring a local file sync**

creating a provision file that syncs a local file to the VM
` config.vm.provision "shell", path: "init.sh"`
                      `shell` is how linux knows to run the command in the terminal
                               `path` specifies where it can find the file-name

**Configuring a synced folder**
 config.vm.synced_folder ".", "/home/vagrant/app"
                        # _. means everything from specified location_


Then, launch gitbash in the same folder as "vagrantfile"
And do `vagrant up` command to launch the VM and start downloading Ubuntu.  
  
This will install virtualbox, set up a local ip you can reach with your browser for nginx, and then run the script which updates the vm and installs nginx  
  
Once its up, do `vagrant ssh`, and use logout to leave VM  
`vagrant halt` stops the vm.

- `vagrant ssh <vm>` to access
- `vagrant up <vm>` to launch 
- `vagrant reload <vm>` to restart 
- `vagrant destroy <vm>` to shutdown and reset a VM
- `vagrant halt <vm>` to pause VM but not reset
- `logout/exit` to logout

## Linux Commands

- `uname`/`uname -a` for machine info
- `pwd` for present working directory
- `mkdir` to create a new directory
- `ls`/`ls -a` to list directories and files
- `cd <name-of-dir>` to navigate to a directory
- `nano <filename>` to create or access a file
- `cat <filename>` to view contents of a file
- `rm -rf <filename>` to remove a file
- `mv <filename> <new-dir>` to move a file
- `mv <file-name> <new-name>` to rename a file `mv file-name /different/folders/new-name` if not in the same working directory
- `cp <file-source-name> <destination>` to copy a file
- `top` to list all running processes
- `ps aux` to view all running services
- `kill <id-from-ps-aux>` to kill a service/process


- `apt-get package manager install/remove/update/upgrade <package name>` to install packages
- `systemctl status/restart/start/stop <pkg name>` to interact with OS and package
- `sudo` super user do, grants admin privileges
- `su` substitute user, to change user
- `ctrl + c` to return to terminal

### Nano Commands

- `nano <filename>` to enter a file
- `ctrl s` to save
- `ctrl x` to exit
- `ctrl O` to writeout 

For cheat sheet: https://gist.githubusercontent.com/harssh/7638233/raw/5c491cfc633d5c83f634a917dd23a9259e712567/nano_text_editor_cmds.txt

### Permissions

- READ / Write / Executable / Read Only
- check permissions `ll`
- `chmod +rwx <filename>` to add permissions.
- `chmod -rwx <filename>` to remove permissions.
- `chmod +x <filename>` to allow executable permissions.
- `chmod -wx <filename>` to take out write and executable permissions.

_Note that “r” is for read, “w” is for write, and “x” is for execute._ 

### Bash Scripting _(shebang!)_

< instructs the OS on which interpeter to run >

.sh = shell extension

`#!/bin/bash` to configure a script

### Configuring provision.sh file for Vagrant
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

### Linux Variables

< _Linux variables work under the same concept as Python vars, they store information_ >

- `<var-name>=value` to create a variable
- `echo $<var-name>` to check a variable

### Environment Variables

- `env var` = environment variable
- `printenv <variable>` or `env` to print variables 
- `export` allows the system to recognise the term as an environment variable
- `sudo nano .bashrc` the bashrc file allows you to make an env-var persistent
- `unset var_name` to delete an env-var

## Ruby Commands

< installed a package that automatically scanned for and installed dependencies for our ruby file: >

Run `gem install bundler` to install package

Run `bundler` to install dependencies

To run the tests `rake <filename>`, this time it was `rake script`. 

## NGINX

### Reverse Proxy with NGINX

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
![2 Tier Architecture Diagram](https://user-images.githubusercontent.com/98312982/152544826-a46f71c6-6fb6-4358-a55c-95c747d2268d.png)

## Creating two or more VMs

- Saved in separate do statements in the Vagrantfile:

```
Vagrant.configure("2") do |config|
 config.vm.define "app" do |app|
  app.vm.box = "ubuntu/xenial64"
#  creating a virtual machine ubuntu 
#  config.vm.network "forwarded_port", guest: 80, host: 8080, id: "nginx"
  app.vm.network "private_network", ip: "192.168.56.4"
  app.vm.synced_folder "src/", "/home/vagrant/code"
#  config.vm.provision "shell", inline: $script
  app.vm.provision "shell", path: "src/init.sh"
 end

 config.vm.define "db" do |db|
  db.vm.box = "ubuntu/xenial64"
  db.vm.network "private_network", ip: "192.168.56.5"
 end

end

```

## NodeJS and NPM in the APP VM
- `vagrant ssh` to enter VM
- `sudo apt-get install nodejs -y` to install nodejs, `nodejs -v` to check version. 
If version is incorrect (v4 but we needed v6.x) do..

- `sudo apt-get install python-software-properties` for the module
- `curl -sl https://deb.nodesource.com/setup_6.x | sudo -E bash -` to install nodejs v6.x
- to install the correct version of nodejs `sudo apt-get install nodejs -y`
- `sudo npm install pm2 -g` to install pm2. 

```
PM2: A production process manager for Node. js applications that has a built-in load balancer. PM2 enables you to keep applications alive forever, reloads them without downtime, helps you to manage application logging, monitoring, and clustering.  
```

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

# Amazon Web Services (AWS)

## AWS and Cloud Computing

- We are using Europe
- There are usually at least two servers available for each region. 
- Choose location based on who you're deploying for. ATM we only have access to Ireland servers. 

EC2 (_Amazon Elastic Compute Cloud_)

- Enables you to have multiple instances with as many or as few virtual servers as you need.
- Allows you to configure security networking, and manage storage. Can scale up and down as needed.
- Saves for us because migrated servers are managed by Amazon and we can get access to great hardware and internet easily. 
- Go global in relative seconds. 

Migration of Demo App:

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

## AMI as a Service

- AWS AMIs: Amazon Machine Image(s) AKA 
- Simply creates a template that creates your configuration. 
- This allows you to save the data, much like VirtualBox Snapshots.
- Helps automate deployment on cloud, esp between numerous people. 
  
How to create an AMI:
- Click on running instance
- Under Actions > Images > Create Image

To deploy an AMI:
- Go to AMIs tab on AWS
- Select AMI and choose "Launch Instance from this AMI" 
- Fill out configuration for instance in the same way as previous
- You can select a pre-existing security group so you don't have to redo port stuffs. 

## Monitoring with CloudWatch

What should we monitor?
- Number of users (Networks)
- CPU Utilisation
- Memory Availability
- Status = 200 OK (can make an API call to check the health of the instance)

Metric notifications > DevOps need to be alerted of issues and logs need to be provided
Cloudwatch will do this with an alarm that sends an:
SNS: Simple Nofitication Service
We then need to respond to the alarm
If this was a CPU issue, we can auto-scale to increase CPU supply. 

To add dashboard:
- Manage detailed monitoring
- Enable detailed monitoring and save
- Return to the monitoring tab of your instance
- Add to dashboard > select DevOps
- Adding metrics and logs to dashboard makes it more understandable and presentable. 


## SQS - Simple Queue Service

![SR3](SR3CDN.png)


SR3 (AWS service) is simple storage service that is globally available. You can store anything.
- Used for disaster recovery
- We can apply Create bucket/object, Read, Update Delete (CRUD) actions 

- Our data is all stored on Ireland EC2 servers atm.
- In order to make it `highly available` on S3, we can use `AWSCLI` configuration with the right secure access keys. 
- Our current key is the `/ssh/eng103a.pem` file

S3 Storage Classes:
- Standard/Normal - You can access data anytime
- Glacier - Infrequent data access _(you pay less for this)_ 
    _Ex: Sparta holds onto lots of personal data - current and former employees for example. Sparta needs to be able to access current employee data instantly as needed, whereas they don't need immediate access to ex-employee data._
Your data is made highly available as it is stored across 3 availability zones that are separated by a certain amount of mileage.  

### Accessing SQS

- Search for S3 on AWS (_note how when we select S3, region automatically changes to 'global'_)
- `AWSCLI` depends on Python3 to or above to install PIP3
- Ubuntu uses Python2.7 by default, so we need to ensure that we're using Python3:
```
sudo apt install update -y
sudo apt install upgrade -y
sudo apt install python3-pip -y

alias python=python3.7
sudo apt install python3.70-minimal
alias python=python3.7 <-- we do this to specify which version of Python ubunutu should use>

sudo pip3 install awscli

aws configure
AWS Access Key ID: {see excel sheet}
AWS Secret Access Key: {see excel sheet}

Default Region Name:`eu-west-1` (this is the area code of each region on AWS. Check region drop down list to find yours.)
Default output format: json
```
`aws s3 ls` - searches directories in AWS S3
On AWS site > S3 > Buckets, you should be able to see the same list

### Buckets (CreateReadUpdateDelete)

S3 does NOT allow underscores. Naming convention is different, must use `-` instead. No caps either.
aws s3

- Make bucket `m3` s3://eng103a-karim-devops

We now have our own bucket in S3

- We'll make a file as usual: `sudo nano test.txt`
- We can add a file to our bucket through `aws s3 cp test.txt s3://eng103a-karim-devops`
- Downloading a file from our bucket to our local pc is the same process but with the source and destination locations reversed `aws s3 cp s3://eng103a-karim-devops ~`
- To delete a bucket we use `aws s3 rb s3://`
- To delete a file we use `aws s3 rm s3://eng103a-karim-devops/<FileName>`

More CLI Commands: https://docs.aws.amazon.com/cli/latest/userguide/cli-services-s3-commands.html#using-s3-commands-listing-buckets

## Autoscaling and Load Balancing 

- Autoscaling _automatically adjusts_ the amount of computational resources based on the server load.
- Load balancing _distributes traffic_ between EC2 instances so that no one instance gets overwhelmed. 

*Launch Templates
*
> AWS > EC2 Dashboard > Instances Sidebar > Launch Templates > Create Template
> 
> Enter name, tick auto scaling guidance, add a tag with the same name
> 
> Quick start > Ubuntu 180.04
> 
> Instance type > t2..micro
> 
> Create security group > enter names and desc > add rule: HTTP, TCP 80, Anywhere. Add rule: ssh, TCP, 22, My IP.
> 
> Adv Details > DNS Hostname "Enable resource-based IPV4 DNS Requests". 
> Adv Details > User Data: 
> 
```
#!/bin/bash
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install nginx -y
sudo systemctl restart nginx 
sudo systemctl enable nginx
```
*Auto Scaling Groups
*
> AWS > EC2 Dashboard > Auto Scaling Sidebar > Auto Scaling Groups > Create Auto Scaling Group > Enter Name > Select Launch Template: <Launch Template Name> > Version: Latest 1 > Next
> 
> Network > VPD: Default > Avail Zones and subnets: Default 1a, Default 1b, Default 1c _(make sure the port is the same on all, in this case its /20)_ > Next
> 
> Load Balancing > Attach to a new load balancer > Application Load Balancer _(this is the strongest one and provides accessibilty for HTTP and HTTPS)_ >  Name: "eng103a-karim-alb" _(note '-' naming convention)_ > Internet-facing > Default routing: Create a target group: "eng103a-karim-lg"
> 
> Health Checks > tick EC2 and ELB > 
> 
> Configure Group size and scaling policies > desired: 2, minimum: 2, maximum: 3 
> 
> Scaling policies > Target tracking scaling policy > scaling policy name: <eng103a-karim-alb> > metric type: avg cpu utilization > Target Value: 25 > Next
> 
> to Review > Create Auto Scaling Group

High Availability:
- There are always servers available in case one goes down, one runs in its place. It means that there's always a minimum # servers running that allow the service to stay up and running.

High Scalability: 
- Can your app scale in and out in response to # of users or % of CPU Utilisation. 
- If the load on the load balancer increases more than the threshold we specified, a new server will be spun up and the extra traffic will be diverted to the new one.

# VPCs and AWS Networking

![VPC](VPC%20Diagram.png)

**IP addresses:**
- A series of unique numbers assigned to a computer
- This is the ID code of a machine, and is how it communicates and accesses other networks and areas on the internet. 

**Virtual Private Cloud (VPC):**
- A VPC is a private virtual network dedicated to your AWS account
- It is isolated from other virtual networks in the AWS cloud
- In the VPC, the user can change IPs, subnets, internet gateways, routes tables, security groups and networking configs. 
- You can connect and peer privately to other VPC's across a network. 
- We could use VPC’s to implement different environments, such as demo, test, staging and production environments. Since production environments don’t need access to our test environments, and vice versa. There are many different use cases for the VPC

**Subnet:** 
- A subnet is simply a smaller piece of a larger network, think of it like a room within a house.
- Subnets can have networking rules applied to them, so you can have multiple subnets with different permissions and rules, allowing you to chop up your VPC into manageable snippets.

**CIDR Block (Classless Inter-Domain Routing):**
- A method for allocating IP addresses for; for example, 10.0.0.0/16
- VPCs and Subnets have CIDRs
- The CIDR Value denotes the max number of IP addresses that can be used in the VPC.
  
**Route Tables:**
- Route tables decides how traffic flows between subnets. 
- Can have no public routes, or can be connected to an internet gateway to allow public access.
- When you first create a route table, there are no routes. You need to tell it where to find traffic and where to allow it to.
- Populated with addresses that determine who can go where. 

**Internet Gateway:**
- A component that attaches to a VPC, giving it public internet access. 

**Security Groups:** 
- Security groups are like firewalls on an instance level.
- They are a set of networking rules that are applied to a resource.
- They are responsible for defining what traffic can enter or leave on an instance level (based on port and protocol).
- This is how they differ to NACLs: Outbound rules for security groups are default to allow all.

**Network ACL (NACL):**
- An NACL is used as an extra protective layer or firewall for the entire subnet.
- NACLs allow you to dictate what and who can leave and re-enter a subnet. Think of it like stamping someone's hand at a concert or football game. 
- NACL Outbound rules default to off: you must manually add outbound rules, even just to allow all.  

## **Step-by-step Setup**

```
Step 1:
- Select Region (i.e Ireland)
- Create a VPC - Virtual Private Cloud
- Valid CDIR Block for VPC - 10.0.0.0/16 
  
Step 2:  
- Create Internet Gateway (IG)
    2.1:
    - Attach the IG to our VPC 
    - Add only one rule: 0.0.0.0/0

Step 3: 
- Create a public subnet
    3.1:
    - Associate subnet to VPC

Step 4:
- Create route table/s (RT) for public subnet
    4.1:
    - Edit routes to allow IG to allow traffic
    4.2:
    - Associate to our public subnet
    - (If you're making a private subnet: add a rule of 0.0.0.0/0 for the NAT instance)

Step 5:
- Create a security group in our public subnet to allow required ports/traffic
- Allow port 80 for all (public facing)
- Allow Port 3000 for all (public facing)
- Allow port 22 for private IP 
- Allow HTTPS - SSL
```
Rules for the private subnet: 
- None from our side
- Step 1: we associate with the subnet
- We need the db to have internet 
- So we connect private RT to Public RT so it gets internet from the NAT instance
- Ideally there should be a third instance with the NAT instance. So if someone wanted to hack in, they'd need to go through app subnet > NAT subnet and then into DB subnet. That's a very long and difficult process. 
- NAT instance is not a simple EC2 instance: it's a specific type of instance
- The NAT instance is empty, it's only role is to connect the DB to the internet. 
- It's essentially just an extra layer of security - an additional subnet you have to get through to access the DB

- In the private DB route table, you connect it to the NAT instance, NOT the private gateway

You select instance > your NAT instance and allow a 0.0.0.0/0 rule

The PEM file is either on the local host or in an app instance. 
- **^ look into this more.**


Data Security:
- On Prem
- In transit
- On cloud

Good example: End-to-end encryption in Whatsapp was introduced after someone stole messages in transit and Whatsapp was fined heavily. 


# Jenkins and CICDE Pipelines

The process:

![CICD Pipeline](CICD%20Pipeline.png)

Localhost > SHH to GitHub > SSH to Jenkins > automated tests in Jenkins Agent and Master nodes > AWS.

Jenkins has an agent and a master node

Step 1:
- Create SSH connection from localhost to GitHub
  1.1: 
  - Generate SSH key-pair _(key & lock)_ on locahost
- 1.2:
  - Put the lock on GitHub by copying the public SSH key to GitHub
  - Create a new repo for CICD on our GitHub


GitHub key gen:
ssh-keygen -t rsa -b 4096 -C "<emailaddress@x.com>"
Set a name "<name>"
Enter pass: we skip by pressing enter

This creates two files: 103a and 103a.pub

On GitHub, go to settings > SSH & GPG keys > "New SSH Key" > enter title and paste the key from the 103a.pub file. 
- Do this by typing `cat 103a.pub` and copy the key presented
- Copy it end to end, make sure you don't miss any and that there are 0 spaces anywhere.
- It will ask you to enter your password and then add the key to your account. 

### In Jenkins

- Create new jobs: Freestyle Project
- Discard old builds > max # of builds to keep = 3
- Build > Add Build Step > Execute Shell: 
```
uname -a
date
```
- Apply and Save
- In left sidebar, "Build Now", will return a status 

## Setting Up a Master Jenkins (AWS)

- Launch an ubuntu instance and ssh into it
- Run `sudo apt-get update` and `sudo apt-get upgrade`
- Run `sudo apt install default-jre` _(java-runtime-environment)_ followed by:

```
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo tee \
    /usr/share/keyrings/jenkins-keyring.asc > /dev/null

echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
    https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
    /etc/apt/sources.list.d/jenkins.list > /dev/null

sudo apt-get update
  sudo apt-get install jenkins

{documentation link: https://pkg.jenkins.io/debian-stable/}
```

- When you go to jenkins, itll ask for a authentication key. You find this by SSHing into the server and running:
- `sudo cat /var/lib/jenkins/secrets/initialAdminPassword`


## Setting up an SSH on Jenkins

- Create new
- Enter name
- Discard old builds = 3
- Github project url = HTTPS link project of repo. When it asks for a url, use https.
- 
- Office 365 connector > restrict > we're using a precreated label called sparta-ubuntu-node
- Source code management > git > repository url: ssh key (repo url is ssh, project url is https)
- We now need to provide the private key to Jenkins
  - to add a key:
  - click add > jenkins > kind: SSH Username with private key > select private key > add: private ssh key (include _all_ text)
  - chain branch specifier to /main
  - add build > execute shell > enter path of test folder
  - in script: `cd app, npm install, npm test`
  - Build environment > tick provide node & npm (this saves us from having to install node and all packages)

With this, we still had to manually press build now. For a full CICD pipeline, we need this to run automatically from a localhost commit. 

## Setting up a webhook

- Configure Jenkins and ensure Build triggers > "Github hook trigger for GITScm polling" is enabled
- Go to Github repo > settings > webhooks
- Add webhook > payload url: Jenkins dashboard url/github-webhook (you have to add the github-webhook part)
- Content type: application json.


### Glossary

SSH: 
Think of it as a key and a lock. 
There are private and public keys. 
Localhost will generate two keys: keyName and keyName.pub. The .pub extension is what we paste into our GitHub account to authenticate. 

Webhook:

A webhook is listening for any ages 24/7. 
When it receives a change from a valid user, it will automatically trigger the process and inform Jenkins. 
Jenkins will run a test and trigger a pass/fail response from Master Node. If fail, nothing happens. If pass, Jenkins will respond that it's ready to deploy them and make the changes on AWS. 

Continuous Integration:
- Ensuring that the code on your local host is continuously integrated into your GitHub, automatically process and integrating any changes on every level.
- From a single git push on local host, the changes should be integrated at every step until AWS automatically. 
  1. _A developer pushes new code to a remote source control repository._
  2. _That new code gets built in a pre-configured sever._
  3. _If the build succeds, the new code is added to the solution._
  4. _Could have a continuous testing element too, having to pass User Interface tests or making sure certain features return the values expected._


Continuous Delivery:
- If the tests all pass, Jenkins will automatically deliver the changes into our instances on AWS. This is delivery. But it is NOT LIVE. We still have to do `npm start` physically.

Continuous Deployment:
- This is when the integration and delivery processes result in an automatic deployment or start of the service/update. This could not happen because of things like business decisions etc. 

Since many of the tasks are now automated, any team can significantly **speed up the delivery of new value, reduce bottlenecks, and avoid common integration problems**. 

## Agent Node

Set up agent and master node
SSH into them

In Master: 
`ssh-keygen`
`cat ~/.ssh/id_rsa.pub`
In Agent:
`echo '<paste here the id_rsa.pub content>' >> ~/.ssh/authorized_keys`
In Master:
`ssh ubuntu@<jenkins-agent-private-ip>`

this is how we check if it allows us to connect to the agent from the master

In agent:
`sudo apt-get update`
`sudo apt-get install -y openjdk-8-jdk` < installing java >
sudo apt-get install openssh-server
mkdir ~/jenkins

Go to jenkins > manage jenkins > configure cloud 
For credentials > AWS credentials > enter key id and secret access key from excel file
Paste ami ID, select 


















# IaC

-	Infrastructure as Code (IaC) is the managing and provisioning of infrastructure through code using tools like Ansible and Terraform instead of through manual processes
-	With IaC, configuration files are created that contain your infrastructure specifications, which makes it easier to edit and distribute configurations. It also ensures that you provision the same environment every time.
-	Good configuration management means you always use well documented and smaller components that enable more collaboration, ease of use and automation.

## Ansible and Terraform
- Configuration Management 
- Orchestration
- Push Config - Ansible to push config
- Terraform for Orchestration
- Ansible YAML/YML.file

### Setting up Ansible Controller

- Install required dependencies i.e Python
- Install Ansible
- Tree
- Set up the agent nodes
- Default folder structures etc/ansible
- Hosts file - agent node called IP of the web

### Controller Setup:

- `sudo apt-get install software-properties-common -y` 
- `sudo apt-add-repository ppa:ansible/ansible -y`
- `sudo apt-get install ansible -y`
- `sudo apt-get install tree -y`
- `ansible --version` 
```
ssh vagrant@192.168.33.10
password: vagrant
```

This is how we'll get into the web or db VMs through the controller

- `ping <IP>` to ping and check if the node is reachable

- `ansible web -m ping`
web = name of VM
-m = module
-a = argument
- Can use 'all' in place of 'web' to check all VMs

### Hosts Setup & Informing Controller of Nodes

in /etc/ansible: `tree`, `sudo nano hosts`, in here we can add IPs for node instances. 
- Do this by [header name] followed by the list of IPs.
- We can add `ansible_connection=ssh ansible_ssh_user=vagrant ansible_ssh_pass=vagrant`.
This is defining pre-existing variables and telling ansible that it should use these parameters to ping the VM.
- Without these, it will deny you permission as there is no ssh key/password specified.
- This only works if the VM fingerprint has been added already.

### Ansible Playbooks

- They are YAML/yml files with scripts to implement configuration management
- Playbooks are reusable, meaning they can be used for multiple instances with us only needing to change the IP/path
- They save us time 
- We can create a playbook by using `filename.yml` or `filename.yaml`
- YAML files start with three dashes `---`. YAML files can be used for Docker, Kubernetes and other services. YAML is a very useful language.

```
# `sudo nano install_nginx.yml`
# - _File names before `.yml` are case insensitive._

# YAML/YML file to create a playbook to configure nginx in our web instance.
---
# it starts with three dashes
# psuedo-coding first:

# add the name of the host/instance/vm - we are letting the controller know who to talk to (remember the name of the host is case sensitive)
- hosts: web

# collect logs or gather facts - good to collect details so we can see what's happening
  gather_facts: yes

# we need admin access to install anything (become: true means anything we run will auto have sudo attached to it)
  become: true

# add the instructions for the actual task - i.e install nginx in web server (tasks are the instructions. The 'name' key is what the gather_facts will return. The name is not case sensitive, but the actual instruction under is. pkg=package, state=check status)
  tasks: 
  - name: Installing Nginx web-server in our app machine
    apt: pkg=nginx state=present

# HINT: be mindful of indentation 
# best practice is to use 2 spaces - avoid using tab. 

# [To run, we use `ansible-playbook install_nginx.yml`]

# We can then check status with `ansible web -a "systemctl status nginx"`, and if we check the IP of web, we'll see nginx installed!
```

If we want to migrate these to AWS, here's what we do:
- Update the hosts file with the correct IPs of the instances through 

-`ansible-playbook <filename.yml>` to run a playbook
-`- import_playbook: <filename.yml>` to import a playbook into a yml script and run it

### Ansible Adhoc Commands

- `ansible all -a "uname -a"` will return the name of all servers
- `-a` = argument
- `ansible all -a "free"`
- `ansible all -a "uptime"`
-`ansible all -m copy -a "src=/filepath/filename.txt dest=/filepath/filename.txt`
