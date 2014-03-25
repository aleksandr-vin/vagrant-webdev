# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "hashicorp/precise64"

  # provision
  config.vm.provision "puppet" do |puppet|
    puppet.manifests_path = "puppet/manifests"
    puppet.module_path    = "puppet/modules"
    puppet.manifest_file  = "site.pp"
  end  

  # proxy config
  if Vagrant.has_plugin?("vagrant-proxyconf")
    config.proxy.http 	  = ""
    config.proxy.https 	  = ""
    config.yum_proxy.http = ""
    config.proxy.no_proxy = "localhost, 127.0.0.*, 10.*, 192.168.*"
  end                                 
end
