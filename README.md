# Spotlight Demo

Attempting to get a working production prototype of [Project Blacklight][BL] + [Spotlight][SL] working


## Instructions:

### Vagrant Pre-Requisites:

* VirtualBox
* Vagrant
* Ansible
* Git

### Vagrant (manual):

* Clone this [repository][GH]
* Bring up the vagrant instance, create ansible-required files `make all`
* Cache java and solr `ansible-playbook roles/*/helpers/download.yml`
* Run the ansible playbooks `ansible-playbook setup.yml install.yml`
* Run the ansible playbook `ansible-playbook commands.yml -e command=start`
* Create initial admin user: `vagrant ssh -c 'cd /vagrant/blacklight; rake spotlight:initialize'`

The Spotlight server will start, and forward to http://127.0.0.1:3000/ unless there was a port collision. Check the `vagrant up` output, if necessary.

### Vagrant (scripted):

* Clone this [repository][GH]
* Run the `helpers/setup.sh` script

The Spotlight server will start, and forward to http://127.0.0.1:3000/ unless there was a port collision. Check the `vagrant up` output, if necessary.

### Testing / Production:

* Clone this [repository][GH]
* Create appropriate ansible inventory file(s)
* Run the ansible playbook `ansible-playbook install.yml`
* Run the ansible playbook `ansible-playbook commands.yml -e command=start`


This playbook uses the ["hard way"][BLQS] to install Blacklight.


## Playbooks

* `install.yml` Installs and starts Solr, sets up the Blacklight rails Application
* `config.yml` Allows the local network to access the console
* `commands.yml` Starts and stops the rails server


## TODO BEFORE PRODUCTION

Mandatory:

- [ ] Replace sqlite with PostgreSQL
- [ ] Create proper build -> deploy toolchain
- [ ] AD/LDAP Integration
- [ ] Compare / Contrast Apache Proxy with Phusion Passenger or the like

Optional:

- [ ] UCSD Asset Theming

[BL]: http://projectblacklight.org
[SL]: https://github.com/projectblacklight/spotlight
[GH]: https://github.com/ucsdlib/spotlight-demo.git
[BLQS]: https://github.com/projectblacklight/blacklight/wiki/Quickstart
