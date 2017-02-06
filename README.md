# Spotlight Demo

Attempting to get a working production prototype of [Project Blacklight][BL] + [Spotlight][SL] working


## Instructions:

### Vagrant:

* Clone this [repository][GH]
* Bring up the vagrant instance, create ansible-required files `make all`
* Run the ansible playbook `ansible-playbook setup.yml`
* Run the ansible playbook `ansible-playbook install.yml`
* Run the ansible playbook `ansible-playbook config.yml`
* Run the ansible playbook `ansible-playbook commands.yml -e command=start`
* Create initial admin user: `vagrant ssh -c 'cd <app_dir>; rake spotlight:admin'`

The Spotlight server will start on http://172.16.21.2:3000/ unless the IP was changed in the Vagrantfile.

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
[GH]: https://github.com/jhriv/spotlight-demo.git
[BLQS]: https://github.com/projectblacklight/blacklight/wiki/Quickstart
