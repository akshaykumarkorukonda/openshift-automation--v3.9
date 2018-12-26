Vagrant.configure("2") do |config|
  config.vm.define "open-admin" do |virtualbox|
    virtualbox.vm.hostname = "open-admin"
    virtualbox.vm.box = "bento/centos-7.5"
    virtualbox.vm.network :private_network, ip: "172.16.3.4"

    config.vm.provider :virtualbox do |v|
      v.gui = false
      v.memory = 512
      v.cpus = 1
    end
    # copy in private key
    config.vm.provision "file", source: "~/.ssh/id_rsa", destination: "$HOME/.ssh/id_rsa"
    # run prerequisites script
    config.vm.provision "shell", path: "scripts/prerequisites.sh"
    # map inventory dir into box
    config.vm.synced_folder "./", "/home/vagrant/openshift-inventory"
  end
end
