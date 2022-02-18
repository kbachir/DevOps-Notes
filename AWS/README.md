# AWS Networking

## **Glossary**

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


![VPC_Diagram.png](https://github.com/kbachir/GitNotes/blob/main/AWS/VPC_Diagram.png)

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


Jumbox/Bastion Server/NAT instance
- You will be able to access DB instance from app through a NAT instance or a bastion server. The pem file gets stored in the middle ground and not the app. 
- **^ look into this more**


Jenkins

Setting up an SSH on Jenkins

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
- 
