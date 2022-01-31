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
- access VM `vagrant ssh`
- exit VM `vagrant logout`


- `systemctl status/restart/start/stop {package name`}
- `apt-get package manager install/remove/update/upgrade {package name}`
