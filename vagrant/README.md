Spotlight for Exhibits Demo on Vagrant
===

Ensure there is a local copy of `.vaultpassword` prior to running `make all`. 

1. hostname.yml (optional)
2. postgres.yml (vagrant only)
3. playbooks/solr.yml
4. playbooks/packages.yml
5. playbooks/nginx.yml
6. playbooks/ruby.yml
7. playbooks/deploy.yml

All `playbooks/*yml` playbooks are listed in `playbooks/main.yml` and are
referenced in `vagrant-main.yml`
