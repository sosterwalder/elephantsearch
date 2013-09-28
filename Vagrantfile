# -*- mode: ruby -*-
# vi: set ft=ruby :
HERE = File.dirname(__FILE__)
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box     = 'precise64'
  config.vm.box_url = 'http://files.vagrantup.com/precise64.box'

  config.vm.network "forwarded_port", guest: 80, host: 8080

  config.vm.synced_folder "data/", "/opt/nginx/sites/elephantsearch"

  config.vm.provision :shell, :path => 'kitchen_renovator.sh'
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ["#{HERE}/cookbooks", "#{HERE}/site-cookbooks"]
    chef.add_recipe 'passenger_nginx'
    chef.add_recipe 'elephantsearch::deploy'
    chef.json = { :passenger => { :nginx_prefix => '/opt/nginx' } }
  end

end
