# -*- mode: ruby -*-
# vi: set ft=ruby :

# A Vagrantfile that sets up 3 VM's - two web servers and a database server.

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility).
Vagrant.configure("2") do |config|

  # All servers will run Ubuntu
  config.vm.box = "ubuntu/xenial64"
  
  # Automatically checks for Ubuntu updates when "vagrant up" is called from terminal
  config.vm.box_check_update = true

  # Sets up the webserver for admins to update contents of the library, adding to the SQL database on dbserver.
  # This server interacts with the database server.
  config.vm.define "websiteserver" do |websiteserver|

    # Set server name
    websiteserver.vm.hostname = "websiteserver"
  
    # Enables port forwarding. 
    # The host computer can connect to IPv4 Address 127.0.0.1 port 8080.
    # Network request will reach our webserver VM's port 80.
    websiteserver.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

    # Set server name
    websiteserver.vm.network "private_network", ip: "192.168.2.12"

    # Permissions to ensure this will run properly on lab computers.
    websiteserver.vm.synced_folder ".", "/vagrant", owner: "vagrant", group: "vagrant", mount_options: ["dmode=775,fmode=777"]

    websiteserver.vm.provision "shell", path: "webscript.sh"
  end

  # Sets up the webserver for public to view the library's contents.
  # This server interacts with the database server.
  config.vm.define "queryserver" do |queryserver|

    # Set server name
    queryserver.vm.hostname = "queryserver"

    # Enables port forwarding. 
    # The host computer can connect to IPv4 Address 127.0.0.1 port 8081.
    # Network request will reach our webserver VM's port 80.
    queryserver.vm.network "forwarded_port", guest: 80, host: 8081, host_ip: "127.0.0.1"

    # Set server name
    queryserver.vm.network "private_network", ip: "192.168.2.11"

    # Permissions to ensure this will run properly on lab computers.
    queryserver.vm.synced_folder ".", "/vagrant", owner: "vagrant", group: "vagrant", mount_options: ["dmode=775,fmode=777"]

    
    queryserver.vm.provision "shell", path: "querysitescript.sh"
  end

  # Sets up a VM as a database server which will interact with both the public and private web servers.  
  config.vm.define "dbserver" do |dbserver|

    # Set server name
    dbserver.vm.hostname = "dbserver"
	
    # Assign the IP for the VM on the private network
    dbserver.vm.network "private_network", ip: "192.168.2.13"

    # Permissions to ensure this will run properly on lab computers.
    dbserver.vm.synced_folder ".", "/vagrant", owner: "vagrant", group: "vagrant", mount_options: ["dmode=775,fmode=777"]


    dbserver.vm.provision "shell", path:"dbserverscript.sh"
  end
end

