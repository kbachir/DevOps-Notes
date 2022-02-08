# SR3

![SR3](DevOpsIsh.png)

AWSCLI<br>
AWS SEC & Access Keys<br>
Required to access SR3 from EC2 storage for CRUD
actions from any AWS zone.

Standard - Data be accessed anytime<br>
Glacier - Infrequent access to data, but cheaper<br>
CDN - Content Delivery Network<br><br>

S3 (AWS service) is simple storage service that is globally available. You can store anything.
- Used for disaster recovery
- We can apply Create bucket/object, Read, Update Delete (CRUD) actions 

- Our data is all stored on Ireland EC2 servers atm.
- In order to make it `highly available` on S3, we can use `AWSCLI` configuration with the right secure access keys. 
- Our current key is the `/ssh/eng103a.pem` file

S3 Storage Classes:
- Standard/Normal - You can access data anytime, faster, more costly
- Glacier - Infrequent data access _(you pay less for this)_, cheaper, longer, requires notice for access to data. Can only be accessed a few times. 
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

make bucket `m3` s3://eng103a-karim-devops

We now have our own bucket in S3

We'll make a file as usual: `sudo nano test.txt`

We can add a file to our bucket through `aws s3 cp test.txt s3://eng103a-karim-devops`

Downloading a file from our bucket to our local pc is the same process but with the source and destination locations reversed `aws s3 cp s3://eng103a-karim-devops ~`

To delete a bucket we use `aws s3 rb s3://`

To delete a file we use `aws s3 rm s3://eng103a-karim-devops/<FileName>`




~ = home folder
. = pwd
/ = root

_We need to change the permissions of this file to be viewable by all public and authenticated users under the "Permissions" tab._

Task:

Installing boto3 `pip3 install boto3`


CLI Commands: https://docs.aws.amazon.com/cli/latest/userguide/cli-services-s3-commands.html#using-s3-commands-listing-buckets