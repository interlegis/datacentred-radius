# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Virtualbox Provider
  config.vm.provider "virtualbox" do |virtualbox, override|
    override.vm.box     = 'ubuntu-server-12042-x64-vbox4210'
    override.vm.box_url = 'http://puppet-vagrant-boxes.puppetlabs.com/ubuntu-server-12042-x64-vbox4210.box'
  end

  # VMware Fusion Provider
  config.vm.provider "vmware_fusion" do |vmware, override|
    override.vm.box     = 'ubuntu-server-12042-x64-fusion503'
    override.vm.box_url = 'http://puppet-vagrant-boxes.puppetlabs.com/ubuntu-server-12042-x64-fusion503.box'
  end

  #
  config.vm.synced_folder "./", "/etc/puppet/modules/radius"

  # Puppet
  config.vm.provision "puppet" do |puppet|
    puppet.manifests_path = "tests"
    puppet.manifest_file  = "init.pp"
    puppet.options        = "--verbose --debug --pluginsync"
  end
end
