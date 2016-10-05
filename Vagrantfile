# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    config.vm.box = "ubuntu/xenial64"

    # Django runserver networking
    config.vm.network "forwarded_port", guest: 8888, host: 8888
    config.vm.network "forwarded_port", guest: 80, host: 8989

    config.vm.provision "shell", path:"./scripts/server-setup.sh"

    config.vm.provider :virtualbox do |vb, override|
        vb.memory = 512
    end
end
