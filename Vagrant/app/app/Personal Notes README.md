### Questions we should ask when receiving a README like this one:

- What dependencies do we require? The README.md does not specify this.
    - i.e NPM package is required but this is not specified.

- Which operating system can it be tested or deployed on?
    - we can't test on Linux if it's not designed for it.

- Which port do we need to allow?
    - if we put port 3000 but the OS does not allow that port, it won't work.

- What hardware specs does the software need to run fine?


### Investigate the code briefly


### Testing:

- We are going to run the test on our local host terminal to test which dependencies we need
- We do this *before* we launch the app.

`gem install bundler`
`bundler`

`sudo apt-get install nodejs -y`

`sudo apt-get install python-software-properties -y`

`curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -`


launching app: 

ls

sudo apt-get update -y

sudo apt-get upgrade -y

sudo apt-get install nginx -y

sudo apt-get install nodejs -y

sudo apt-get install python-software-properties

curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -

sudo apt-get install nodejs -y

sudo npm install pm2 -g

```

- Navigate to `app` folder where you can see `app.js`

- run `npm install`

- run `npm start`