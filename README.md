Spin up a Kubernetes two-node cluster on Windows with Hyper-V
---

### Vagrant box
To speedup the kubeadm init bootstrapping process, I have created a vagrant box with all required binaries and dependencies including
the docker images of pod network addon (calico) and which is available here [hyperv-ubuntu-vagrant](https://github.com/sukujgrg/hypervm-ubuntu-vagrant).

### Start the cluster
```
vagrant up
```
