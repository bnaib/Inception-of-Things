#CentOS8 31 декабря 2021 года была отправлена в архив - правим ссылки
sudo sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
sudo sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

sudo systemctl stop firewalld
sudo systemctl disable firewalld
sudo yum install yum-utils podman net-tools -y &> /dev/null

#Добавляем ключ для подключения по ssh без пароля
# sudo mkdir -p /root/.ssh
# sudo cp /tmp/id_rsa*  /root/.ssh/
# sudo chmod 400 /root/.ssh/id_rsa*
# sudo mv /tmp/id_rsa*  /home/vagrant/.ssh/
# sudo chmod 400 /home/vagrant/.ssh/id_rsa*

# sudo cat /root/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys
# sudo chmod 400 /root/.ssh/authorized_keys
# sudo cat /home/vagrant/.ssh/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys
# sudo chmod 400 /home/vagrant/.ssh/authorized_keys

# sudo echo "192.168.42.111 ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBKrXQG6UmkDgjYWFPmrYxim5sCHJ8uhU5CmMF4sfvfwepcBpk3kbVfaZkcLd0r3Cg9slVLxuItn8IOiMsHeQ6VU=" >  /root/.ssh/known_hosts
# sudo echo "192.168.42.111 ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBKrXQG6UmkDgjYWFPmrYxim5sCHJ8uhU5CmMF4sfvfwepcBpk3kbVfaZkcLd0r3Cg9slVLxuItn8IOiMsHeQ6VU=" >  /home/vagrant/.ssh/known_hosts

# sudo echo "alias k=kubectl" >> /root/.bashrc
sudo echo "alias k='kubectl'" >> /home/vagrant/.bashrc 

export K3S_KUBECONFIG_MODE="644"
export INSTALL_K3S_EXEC="server --cluster-init --node-ip=192.168.42.110 --tls-san=192.168.42.110 --flannel-iface=eth1"
curl -sfL https://get.k3s.io | sh -
# sudo curl -sfL https://get.k3s.io |
# 		K3S_KUBECONFIG_MODE="644" INSTALL_K3S_EXEC="server --cluster-init --node-ip=$(ifconfig eth1 | awk '/netmask/{print $2}')" bash -


# sudo cp /var/lib/rancher/k3s/server/token /vagrant/token

kubectl apply -f /tmp/app1.yml
kubectl apply -f /tmp/app2.yml
kubectl apply -f /tmp/app3.yml
kubectl apply -f /tmp/ing0.yml
