#CentOS8 31 декабря 2021 года была отправлена в архив - правим ссылки
sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

yum -y install net-tools

#Добавляем ключ для подключения по ssh без пароля
mkdir -p /root/.ssh
cp /tmp/id_rsa*  /root/.ssh/
chmod 400 /root/.ssh/id_rsa*
mv /tmp/id_rsa*  /home/vagrant/.ssh/
chmod 400 /home/vagrant/.ssh/id_rsa*

cat /root/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys
chmod 400 /root/.ssh/authorized_keys
cat /home/vagrant/.ssh/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys
chmod 400 /home/vagrant/.ssh/authorized_keys

echo "192.168.42.110 ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBKrXQG6UmkDgjYWFPmrYxim5sCHJ8uhU5CmMF4sfvfwepcBpk3kbVfaZkcLd0r3Cg9slVLxuItn8IOiMsHeQ6VU=" >  /root/.ssh/known_hosts
echo "192.168.42.111 ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBKrXQG6UmkDgjYWFPmrYxim5sCHJ8uhU5CmMF4sfvfwepcBpk3kbVfaZkcLd0r3Cg9slVLxuItn8IOiMsHeQ6VU=" >  /home/vagrant/.ssh/known_hosts

# ssh-keyscan -t rsa 192.168.42.110 > /root/.ssh/known_hosts
# systemctl restart sshd.service

    # bnaibSW: Warning: Permanently added 'bnaibs,192.168.42.110' (ECDSA) to the list of known hosts.
    # bnaibSW: vagrant@bnaibs: Permission denied (publickey).

echo "alias k=kubectl" >> /root/.bashrc
echo "alias k='kubectl'" >> /home/vagrant/.bashrc 

# Добавляем адрес сервера в список хостов
echo "192.168.42.110 bnaibS" | sudo tee -a /etc/hosts

cp /vagrant/token /tmp/token

export K3S_KUBECONFIG_MODE="644"
export K3S_TOKEN_FILE="/tmp/token"
export K3S_URL="https://192.168.42.110:6443"
export INSTALL_K3S_EXEC="agent --node-ip=192.168.42.111"

curl -sfL https://get.k3s.io | sh -
