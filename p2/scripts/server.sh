#!/usr/bin/env bash

sudo systemctl stop firewalld
sudo systemctl disable firewalld
sudo yum install yum-utils podman net-tools -y &> /dev/null

sudo echo "alias k='kubectl'" >> /home/vagrant/.bashrc 

export K3S_KUBECONFIG_MODE="644"
export INSTALL_K3S_EXEC="server --cluster-init --node-ip=192.168.42.110 --tls-san=192.168.42.110 --flannel-iface=eth1"
curl -sfL https://get.k3s.io | sh -

kubectl apply -f /tmp/app1.yml
kubectl apply -f /tmp/app2.yml
kubectl apply -f /tmp/app3.yml
kubectl apply -f /tmp/ing0.yml
