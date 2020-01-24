Vagrant.configure("2") do |config|

  config.vm.define "db" do |db|
    db.vm.box = "ubuntu/bionic64"

    # app.vm.network "forwarded_port", guest: 80, host: 8082  #del
    db.vm.network "forwarded_port", guest: 3306, host: 3306  #del
    db.vm.network "private_network", ip: "192.168.10.21"
    db.vm.hostname = "vm.db"
    db.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--natdnshostresolver2", "on"]
      v.customize ["modifyvm", :id, "--memory", 1024]
      v.customize ["modifyvm", :id, "--name", "db"]
    end

    db.vm.provision "shell", path: "provision/db_vm_provision.sh" #172.17.0.1 mysql
  end
  
  config.vm.define "app" do |app|
    app.vm.box = "ubuntu/bionic64"

    app.vm.network "forwarded_port", guest: 26112, host: 26110  #del
    app.vm.network "forwarded_port", guest: 8091, host: 26111  #del

    # app.vm.network "public_network" #del
    app.vm.network "private_network", ip: "192.168.10.31"
    app.vm.hostname = "vm.app"

    app.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--natdnshostresolver2", "on"]
      v.customize ["modifyvm", :id, "--memory", 3096]
      v.customize ["modifyvm", :id, "--name", "app"]
    end
    app.vm.provision "shell", path: "provision/app_vm_provision.sh"

  end


end
