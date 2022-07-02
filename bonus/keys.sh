# sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
# sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

# yum -y install net-tools

mkdir -p /root/.ssh
cp /tmp/id_rsa*  /root/.ssh/
chmod 400 /root/.ssh/id_rsa*
mv /tmp/id_rsa*  /home/vagrant/.ssh/
chmod 400 /home/vagrant/.ssh/id_rsa*

cat /root/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys
chmod 400 /root/.ssh/authorized_keys
cat /home/vagrant/.ssh/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys
chmod 400 /home/vagrant/.ssh/authorized_keys

# echo "192.168.42.111 ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBKrXQG6UmkDgjYWFPmrYxim5sCHJ8uhU5CmMF4sfvfwepcBpk3kbVfaZkcLd0r3Cg9slVLxuItn8IOiMsHeQ6VU=" >  /root/.ssh/known_hosts
# echo "192.168.42.111 ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBKrXQG6UmkDgjYWFPmrYxim5sCHJ8uhU5CmMF4sfvfwepcBpk3kbVfaZkcLd0r3Cg9slVLxuItn8IOiMsHeQ6VU=" >  /home/vagrant/.ssh/known_hosts
