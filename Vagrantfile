# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = "ubuntu/xenial64"

  config.vm.network "forwarded_port", guest: 3000, host: 3000

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
  end

  config.vm.provision "shell", privileged: false,  inline: <<-SHELL
    sudo apt-get update
    sudo apt-get install -y build-essential git

    sudo apt-get install -y postgresql-9.5 postgresql-contrib postgresql-server-dev-9.5
    sudo -u postgres psql --dbname=postgres -f /vagrant/create_dev_and_test_dbs.sql

    gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
    curl -sSL https://get.rvm.io | bash -s stable
    source ~/.rvm/scripts/rvm
    rvm install 2.5.1
    gem install bundler
  SHELL
end
