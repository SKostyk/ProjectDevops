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
 #Зробити host-only мережу, де є 10мережа
 #треба ключик, щоб конфлюен не задавав питань

#  cd ../
#  [vagrant@vm nginx]$ sudo nginx -t
#  nginx: the configuration file /etc/nginx/nginx.conf syntax is ok
#  nginx: configuration file /etc/nginx/nginx.conf test is successful
 

# AAABLA0ODAoPeNptkMtqwzAQRff6CkM37UJBcponCNrahjrYSYiTrrqZikkqsGUjyWnz91XipC8CE
# gjduXfOzE1e6yBGGfChP1M2mLJxEBXrIGR8QmK00qjGqVqLqNbbskUtMbgt0OzR3L1Og2QPZQvHA
# hIZPD1icCiOdspDykfEGx1IN4cKhYRGOfgYP+wqUGVP1hWRPrfndbVH4UyL3UfhwDg0YgulxUtEk
# nvTtYwfil8RmZKoLa4PDZ56R4s8T1ZR+piRspNe0NijJyQ+WDvU4KdLPhtlDuchQkYZp3xIFmYHW
# tmuxxWCbiNpLJ6G/T5drkYbOhukMX2eZDNSJHPhL834/YgPGOPkzObrszT+K53Y5231hmax3ViPK
# Oi34TrcsjXyHSz+3/wXi2KbnTAsAhQU3xQ2VX1hdMPb2jqFK6gKXIWxVQIUDY2/nXn4jxc9hb9Lc
# Lv9X6UglUs=X02f3