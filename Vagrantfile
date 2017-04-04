# -*- mode: ruby -*-
# vi: set ft=ruby :

# Reasonable Defaults - can be overwridden with environmental variables
IP_NETWORK=ENV.fetch('IP_NETWORK','172.16.1')
DEFAULT_BOX=ENV.fetch('DEFAULT_BOX', 'centos/7')

# List guests here, one per line.
# :name, name of the box
# :box (optional), box to build from. Default DEFAULT_BOX
# :ip (optional), IP address for local networking. Can be full dotted quad
#     or the last octet, which will be appended to the IP_NETWORK environmental
#     variable. Default none.
# :sync (optional) Should /vagrant be mounted? Default false
# :needs_python (optional) Install python packages? Default false
#     (Debian/Ubuntu only)
# If there are multiple systems, the first one will be marked "primary"
guests = [
  { :name => 'spotlight', :box => 'ubuntu/xenial64', :memory=>'2048', :sync => true, :needs_python => true, },
  #{ :name => 'default' },
  #{ :name => 'web1', :box => 'centos/6', :ip => '2' },
  #{ :name => 'web2', :ip => '192.168.1.3' },
  #{ :name => 'db1' },
  #{ :name => 'app', :sync => true },
  #{ :name => 'datastore', :box => 'ubuntu/xenial64', :needs_python => true },
]

Vagrant.configure(2) do |config|
  guests.each_with_index do |guest, i|
    config.vm.define "#{guest[:name]}", primary: i==0 do |box|
      box.vm.box_check_update = false
      box.vm.box = ( guest.key?(:box) ? guest[:box] : DEFAULT_BOX )
      unless guest.has_key?(:sync)
         box.vm.synced_folder '.', '/vagrant', disabled: true
      else
         box.vm.synced_folder '.', '/vagrant', disabled: ! guest[:sync]
      end
      box.vm.network "forwarded_port", guest: 3000, host: 3000, auto_correct: true, id: "Spotlight"
      if guest.has_key?(:ip)
        box.vm.network 'private_network',
          ip: guest[:ip].to_s.match('\.') ? guest[:ip] : "#{IP_NETWORK}.#{guest[:ip].to_s}"
      end
      # Provider specific settings
      box.vm.provider "virtualbox" do |v|
        v.cpus   = guest[:cpus]   if guest.has_key?(:cpus)
        v.gui    = guest[:gui]    if guest.has_key?(:gui)
        v.memory = guest[:memory] if guest.has_key?(:memory)
      end
      config.vm.provider "vmware_fusion" do |v|
        v.gui             = guest[:gui]    if guest.has_key?(:gui)
        v.vmx["memsize"]  = guest[:memory] if guest.has_key?(:memory)
        v.vmx["numvcpus"] = guest[:cpus]   if guest.has_key?(:cpus)
      end
      config.vm.provider "vmware_workstation" do |v|
        v.gui             = guest[:gui]    if guest.has_key?(:gui)
        v.vmx["memsize"]  = guest[:memory] if guest.has_key?(:memory)
        v.vmx["numvcpus"] = guest[:cpus]   if guest.has_key?(:cpus)
      end
      # Some boxes lack python
      if guest.has_key?(:needs_python) && guest[:needs_python]
        box.vm.provision 'shell',
          inline: <<-'SCRIPT'
            apt-get update
            apt-get install --assume-yes python python-apt
          SCRIPT
      end
    end
  end
end
