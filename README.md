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
* Change go the _vagrant_ directorry `cd vagrant`
* Bring up the vagrant instance, create ansible-required files `make all`
* Cache java and solr `ansible-playbook roles/*/helpers/download.yml`
* Run the ansible playbooks `ansible-playbook vagrant-main.yml`

The Spotlight server will start, and forward to http://127.0.0.1:8000/ unless there was a port collision. Check the `vagrant up` output, if necessary.

### Vagrant (scripted):

* Clone this [repository][GH]
* cd to the vagrant directory
* Run the `helpers/setup.sh` script

The Spotlight server will start, and forward to http://127.0.0.1:8000/ unless there was a port collision. Check the `vagrant up` output, if necessary.

### Testing / Production:

* Clone this [repository][GH]
* Create appropriate ansible inventory file(s)
* Run the ansible playbook `ansible-playbook main.yml`

## Playbooks

* `after-*-sym.yml` [Ansistrano.deploy][AD] hooks
* `config.yml` Allows the local network to access the console
* `deploy.yml` Deploys latest version of app
* `main.yml` Does it all
* `nginx.yml` Installs, configures, starts web server
* `packages.yml` Installs OS required packages
* `puma.yml` Installs app server (part of Ansitrano.deploy)
* `ruby.yml` Installs rbenv
* `solr.yml` Installs Solr

## TODO BEFORE PRODUCTION

Mandatory:

- [X] Replace sqlite with PostgreSQL
- [ ] Create proper build -> deploy toolchain
- [ ] AD/LDAP Integration
- [X] Compare / Contrast Apache Proxy with Phusion Passenger or the like

Optional:

- [ ] UCSD Asset Theming
- [ ] Review applicability of ["The Hard Way"][BLQS]

[BL]: http://projectblacklight.org
[SL]: https://github.com/projectblacklight/spotlight
[GH]: https://github.com/ucsdlib/spotlight-demo.git
[AD]: https://github.com/ansistrano/deploy#hooks-custom-tasks
[BLQS]: https://github.com/projectblacklight/blacklight/wiki/Quickstart
