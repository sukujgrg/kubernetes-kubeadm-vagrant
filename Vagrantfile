# -*- mode: ruby -*-
# vi: set ft=ruby :

# https://github.com/hashicorp/vagrant/issues/9893
# https://michele.sciabarra.com/2018/02/12/devops/Kubernetes-with-KubeAdm-Ansible-Vagrant/

IMAGE_NAME = "sukujgrg/ubuntu-kubeadm"

master = { :hostname => 'master01', :group => 'master', :cpu => 2}
workers = [
  { :hostname => 'worker01', :group => 'worker', :cpu => 1},
]


Vagrant.configure("2") do |config|
    # Turn off shared folders
    config.vm.synced_folder ".", "/vagrant", id: "vagrant-root", disabled: true

    config.vm.define master[:hostname] do |master_config|
        master_config.vm.box_check_update = false
        master_config.vm.box = IMAGE_NAME
        master_config.vm.hostname = master[:hostname]
        master_config.vm.provider "hyperv" do |v|
            v.memory = 2048
            v.cpus = master[:cpu]
            v.linked_clone = true
        end
        master_config.vm.provision "shell", path: "vagrant_scripts/master.sh"
        master_config.trigger.after [:up, :provision] do |trigger|
            trigger.name = "create token"
            trigger.run = {"inline": "vagrant ssh --no-tty -c 'kubeadm token create --print-join-command' master01 > vagrant_scripts/token.sh"}
        end
    end

    workers.each do |worker|
        config.vm.define worker[:hostname] do |worker_config|
            worker_config.vm.box_check_update = false
            worker_config.vm.box = IMAGE_NAME
            worker_config.vm.hostname = worker[:hostname]
            worker_config.vm.provider "hyperv" do |v|
                v.memory = 2048
                v.cpus = worker[:cpu]
                v.linked_clone = true
            end
			worker_config.vm.provision "file", source: "vagrant_scripts/.", destination: "/tmp/"
			worker_config.vm.provision "shell", path: "vagrant_scripts/worker.sh"
        end
    end
end
