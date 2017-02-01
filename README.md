# Spotlight Demo

Attempting to get a working production prototype of [Project Blacklight](http://projectblacklight.org) + [Spotlight](https://github.com/projectblacklight/spotlight) working


## Instructions:

* Clone this [repository](https://github.com/jhriv/spotlight-demo.git)
* Bring up the vagrant instance, create ansible-required files `make all`
* Run the ansible playbook `ansible-playbook install.yml`
* Run the ansible playbook `ansible-playbook config.yml`
* Run the ansible playbook `ansible-playbook commands.yml -e command=start`

This playbook uses the ["hard way"](https://github.com/projectblacklight/blacklight/wiki/Quickstart) to install Blacklight.

## Playbooks

* `install.yml` Installs and starts Solr, sets up the Blacklight rails Application
* `config.yml` Allows the local network to access the console
* `commands.yml` Starts and stops the rails server



## TODO BEFORE PRODUCTION

Mandatory:

[ ] Replace sqlite with PostgreSQL
[ ] Create proper build -> deploy toolchain
[ ] AD/LDAP Integration

Optional:

[ ] UCSD Asset Themeing
