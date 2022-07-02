#!/usr/bin/env bash

# cluster
k3d cluster create mycluster --servers 1 --agents 0 -p "8080:80@loadbalancer" -p "8888:8888@loadbalancer"

# namespace
kubectl create namespace argocd
kubectl create namespace dev

# argrocd
curl https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml | sed -e 's/\( *\)- argocd-server/&\n\1- --insecure/' | kubectl apply -n argocd -f -
kubectl apply -f /root/scripts/configs/ingress.yaml
kubectl apply -f /root/scripts/configs/argo.yaml
