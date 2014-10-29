Haraka-Ansible
==============

This project is an attempt at creating an [Ansible](http://www.ansible.com/) playbook capable of setting up a bare Debian server to a fully functional email server using [Node.JS](http://www.node.js/) and [Haraka](http://haraka.github.io/), using [haraka-alias-forward](http://github.com/chadsmith/haraka-alias-forward/).

Configuration
-------------

To allow this playbook to work entirely, you will need to configure your [Ansible inventory](http://docs.ansible.com/intro_inventory.html) for your destination IPs and your variables. You will of course need to use at least two variables (three if you decide to keep and create a second user).


Those variables are : 
- **user1** :  in this variable goes the username of your first user
- **user2** :  in this variable goes the username of your second user, should you desire to keep it.
- **password** 	 : in this variable goes your default password (will be changed when you first ssh on your server). The method I used to create the password is using `openssl passwd -salt 'some_plain_salt' -1 'password'`

Usage
-----

###[Install Ansible](http://docs.ansible.com/intro_installation.html#installing-the-control-machine)###

For Debian / Ubuntu :
```bash
 $ sudo apt-get install software-properties-common
 $ sudo apt-add-repository ppa:ansible/ansible
 $ sudo apt-get update
 $ sudo apt-get install ansible
``` 

For RedHat-based systems (Fedora, CentOS, RHEL) : 

```bash
# install the epel-release RPM if needed on CentOS, RHEL, or Scientific Linux
$ sudo yum install ansible
```

###[Fill your inventory](#Configuration)###

###Copy your public RSA key in your servers###
```bash
$ ssh-copy-id root@$SERVERIP
```

###Execute the Playbook###
```bash
$ ansible-playbook haraka-ansible-playbook.yml
```