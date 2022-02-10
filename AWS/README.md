# AWS Networking

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
- When you create a VPC, you must specify a range of IPv4 addresses for the VPC in the form of a Classless Inter-Domain Routing (CIDR) block; for example, 10.0.0.0/16
- VPCs and Subnets have unique CIDRs
- A set of Internet protocol (IP) standards that is used to create unique identifiers for networks and individual devices. The IP addresses allow particular information packets to be sent to specific computers.
- 
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

```
**If you were doing everything from scratch, steps are as follows:**

Step 1:
- Select Region (i.e Ireland)
- Create a VPC - Virtual Private Cloud
- Valid CDIR Block for VPC - 10.0.0.0/16 
  
Step 2:  
- Create Internet Gateway (IG)
_2.1:_
- Attach the IG to our VPC 

Step 3: 
- Create a public subnet
_3.1_:
- Associate subnet to VPC

Step 4:
- Create route table/s (RT) for public subnet
_4.1:_
- Edit routes to allow IG to allow traffic
_4.2:_
- Associate to our public subnet

Step 5:
- Create a security group in our public subnet to allow required ports/traffic
- Allow port 80
- Allow Port 3000
- Allow HTTPS - SSL
```
