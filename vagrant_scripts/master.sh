kubeadm reset --force; kubeadm init --pod-network-cidr=192.168.0.0/16

rm -rf /home/vagrant/.kube
mkdir -p /home/vagrant/.kube
cp -f /etc/kubernetes/admin.conf /home/vagrant/.kube/config
chown vagrant:vagrant /home/vagrant/.kube/config

kubectl apply -f https://docs.projectcalico.org/v3.8/manifests/calico.yaml --kubeconfig=/etc/kubernetes/admin.conf
