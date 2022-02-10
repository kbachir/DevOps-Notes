### AWS Networking

AWS Networking:

VPC: 
- Public Virtual Private Cloud
- In this, there are internet gateways, subnets, route tables and security groups that are available to us. 
- These together are called a 'network environment'

To increase the level of security, we need to create our own VPC. 


IP addresses:
- A series of unique numbers assigned to a computer
- This is the ID code of a machine, and is how it communicates and accesses other networks and areas on the internet. 


Virtual Private Cloud (VPC):
- A VPC is a private virtual network dedicated to your AWS account
- It is isolated from other virtual networks in the AWS cloud
- In the VPC, the user can change IPs, subnets, internet gateways, routes tables, security groups and networking configs. 
- You can connect and peer privately to other VPC's across a network. 
- We could use VPC’s to implement different environments, such as demo, test, staging and production environments. Since production environments don’t need access to our test environments, and vice versa. There are many different use cases for the VPC

Subnet: 
- A subnet is simply a smaller piece of a larger network, think of it like a room within a house.
- Subnets can have networking rules applied to them, so you can have multiple subnets with different permissions and rules, allowing you to chop up your VPC into manageable snippets.

Netmask:


CIDR Block:
- When you create a VPC, you must specify a range of IPv4 addresses for the VPC in the form of a Classless Inter-Domain Routing (CIDR) block; for example, 10.0.0.0/16
- 


Route Tables:
- Route tables decides how traffic flows between subnets. 
- Can have no public routes, or can be connected to an internet gateway to allow public access. 


Internet Gateway:
- A component that attaches to a VPC, giving it public internet access. 

Security Groups: 
- Security groups are like firewalls.
- They are a set of networking rules that are applied to a resource.
- They are responsible for defining what traffic can enter or leave certain areas (based on port and protocol).

![VPC_Diagram.png] (GitRepo\GitNotes\AWS)