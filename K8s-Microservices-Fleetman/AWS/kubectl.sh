#!/bin/bash

# Add the Kubernetes signing key
sudo apt-get update && sudo apt-get install -y apt-transport-https
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -

# Add the Kubernetes apt repository
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list

# Update the package list and install kubectl
sudo apt-get update
sudo apt-get install -y kubectl

# Verify the installation
kubectl version --client
