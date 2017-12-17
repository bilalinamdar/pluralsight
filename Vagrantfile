# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
$scrSSH = <<SCRIPT
echo "Script Started" >> /tmp/vagrant.log
echo "Before SED" >> /tmp/vagrant.log
cat /etc/ssh/sshd_config | grep "PermitRootLogin" >> /tmp/vagrant.log
sed -i 's/#PermitRootLogin yes/PermitRootLogin yes/' /etc/ssh/sshd_config
sed -i '/PasswordAuthentication/s/no/yes/' /etc/ssh/sshd_config
echo "After SED"
cat /etc/ssh/sshd_config | grep "PermitRootLogin" >> /tmp/vagrant.log
echo "Restarting Service"
systemctl restart sshd.service
SCRIPT

Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  #config.vm.box = "base"

# First Control Server started this with the Plural Sight Training.
    # config.vm.define "control" do |ctl|
    #     ctl.vm.box = "ubuntu/trusty64"
    #     ctl.vm.hostname = "ubuntu-control"
    #     ctl.vm.network  "private_network", ip: "192.168.57.2"
    #     ctl.vm.provider "virtualbox" do |vb|
    #         vb.memory= 1024
    #     end
    # end

# This windows box was configured with policies to allow winrm access
    # config.vm.define "webserver01" do |web01|
    #     web01.vm.box = "jptoto/Windows2012R2"
    #     web01.vm.hostname = "windows-webserver01"
    #     web01.vm.communicator = "winrm"
    #     web01.winrm.username = "vagrant"
    #     web01.winrm.password = "vagrant"
    #     web01.vm.network "private_network", ip:"192.168.57.3"
    #     web01.vm.provider "virtualbox" do |vb|
    #         vb.memory = 2048
    #         vb.cpus = 2
    #     end
    # end

# This is a second windows box to test winexe and ansible commands.
    # config.vm.define "winr2server01" do |win01|
    #     win01.vm.box = "jptoto/Windows2012R2"
    #     win01.vm.hostname = "windows-server01"
    #     win01.vm.communicator = "winrm"
    #     win01.winrm.username = "vagrant"
    #     win01.winrm.password = "vagrant"
    #     win01.vm.network "private_network", ip:"192.168.57.7"
    #     win01.vm.provider "virtualbox" do |vb|
    #         vb.memory = 2048
    #         vb.cpus = 2
    #     end
    # end

# This cento box has winexe working Do not destroy
    # config.vm.define "cent7box" do |cent7|
    #     cent7.vm.box = "centos/7"
    #     cent7.vm.hostname = "cent7-control"
    #     cent7.vm.network  "private_network", ip: "192.168.57.6"
    #     cent7.vm.provider "virtualbox" do |vb|
    #         vb.memory= 1024
    #     end
    # end

#     config.vm.define "testbox" do |ctl|
#         ctl.vm.box = "ubuntu/trusty64"
#         ctl.vm.hostname = "ubuntu-control"
#         ctl.vm.network  "private_network", ip: "192.168.57.4"
#         ctl.vm.provider "virtualbox" do |vb|
#             vb.memory= 1024
#         end
#     end

    # config.vm.define "win2008" do |win02|
    #     win02.vm.box = "charris/windows-2008-r2-x64"
    #     win02.vm.box_version = "0.1.0"
    #     win02.vm.hostname = "windows-server02"
    #     win02.vm.communicator = "winrm"
    #     win02.winrm.username = "vagrant"
    #     win02.winrm.password = "vagrant"
    #     win02.vm.network "private_network", ip:"192.168.57.5"
    #     win02.vm.provider "virtualbox" do |vb|
    #         vb.memory = 2048
    #         vb.cpus = 2
    #     end
    # end

    # This Testing Cento Box Automation with SSH Enabled
        config.vm.define "cent7box02" do |cent7svr02|
            cent7svr02.vm.box = "centos/7"
            cent7svr02.vm.hostname = "cent7-control"
            cent7svr02.vm.network  "private_network", ip: "192.168.57.6"
            cent7svr02.vm.provider "virtualbox" do |vb|
                vb.memory= 1024
            end
            cent7svr02.vm.provision "shell", inline: $scrSSH, privileged: true
        end




  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y apache2
  # SHELL
end
