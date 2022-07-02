#!/usr/bin/env bash

curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

# curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
# sh get_helm.sh

kubectl create namespace gitlab

helm repo add gitlab https://charts.gitlab.io/
helm repo update

helm install gitlab gitlab/gitlab \
  -n gitlab \
  --set global.hosts.domain=192.168.56.128.nip.io \
  --set global.hosts.externalIP=192.168.56.128 \
  --set certmanager-issuer.email=box.steel@mail.ru
#   --set global.edition=ce \
#   --timeout 600s