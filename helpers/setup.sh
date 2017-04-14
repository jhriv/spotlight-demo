#!/bin/bash

# Exit on error, saves a lot of '|| exit 1'
set -e

# Set up initial vagrant environment, automating some of the manual steps

# Are pre-requisites installed?
echo '> Checking for pre-requisites..'
for i in ansible git vagrant VirtualBox; do
  command -v "$i" > /dev/null || { echo "$i missing"; exit 1; }
done

# Start work from the top level directory
cd "$( dirname "$0")"
cd "$(git rev-parse --show-toplevel)"

# Walk through steps
echo '> Creating Vagrant box..'
make clean
make up

echo '> Downloading Ansible roles from Galaxy..'
make roles

echo '> Creating Ansilbe required files..'
make ansible.cfg

echo '> Testing ssh conectivity..'
make ip

echo '> Caching vendor packages..'
ansible-playbook roles/*/helpers/download.yml

echo '> Intilizing guest VM and application..'
ansible-playbook setup.yml install.yml

echo '> Start the rails application..'
ansible-playbook commands.yml -e command=start

echo '> Creating the initial admin user..'
vagrant ssh -c 'cd /vagrant/blacklight; rake spotlight:initialize'
