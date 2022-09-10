#!/usr/bin/env bash

sudo yum install -y yum-utils epel-release

# Устанавливаем Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo systemctl enable --now docker

# Устанавливаем kubectl
curl -LO "https://dl.k8s.io/release/$(curl -sL https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# Устанавливаем K3D
curl -s https://raw.githubusercontent.com/rancher/k3d/main/install.sh | bash
