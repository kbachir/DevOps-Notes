[Amazon Web Services (AWS)](#amazon-web-services-aws)
  - [AWS and Cloud Computing](#aws-and-cloud-computing)
  - [AMI as a Service](#ami-as-a-service)
  - [Monitoring with CloudWatch](#monitoring-with-cloudwatch)
  - [SQS - Simple Queue Service](#sqs---simple-queue-service)
    - [Accessing SQS](#accessing-sqs)
    - [Buckets (CreateReadUpdateDelete)](#buckets-createreadupdatedelete)
  - [Autoscaling and Load Balancing](#autoscaling-and-load-balancing)
  - [VPCs and AWS Networking](#vpcs-and-aws-networking)
    - [Step-by-step Setup](#step-by-step-setup)



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

![SR3](images/SR3CDN.png)

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

## VPCs and AWS Networking

![VPC](images/VPC%20Diagram.png)

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

### Step-by-step Setup

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
