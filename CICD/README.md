# Jenkins

The process:

!(CICD Pipeline)[https://github.com/kbachir/GitNotes/blob/main/CICD/CICD%20Pipeline.png]

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
ssh-keygen -t rsa -b 4096 -C "kbachir@spartaglobal.com"
Set a name "103a"
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

Continuous Delivery:
- If the tests all pass, Jenkins will automatically deliver the changes into our instances on AWS. This is delivery. But it is NOT LIVE. We still have to do `npm start` physically.

Continuous Deployment:
- This is when the integration and delivery processes result in an automatic deployment or start of the service/update. This could not happen because of things like business decisions etc. 
