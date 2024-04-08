#!/bin/bash

# Step 1: Installing Docker
echo "Installing Docker..."
sudo apt update
sudo apt install -y docker.io

# Step 2: Updating system packages and installing Minikube dependencies
echo "Updating system packages and installing Minikube dependencies..."
sudo apt update
sudo apt install -y curl wget apt-transport-https

# Step 3: Installing Minikube
echo "Installing Minikube..."
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube

# Verifying Minikube installation
minikube version

# Step 4: Installing kubectl utility
echo "Installing kubectl..."
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
chmod +x kubectl
sudo mv kubectl /usr/local/bin/

# Verifying kubectl version
kubectl version -o yaml

# Step 5: Adding user "kato" to the "docker" group
echo "Adding user 'kato' to the 'docker' group..."
sudo usermod -aG docker kato

# Step 6: Starting Minikube with Docker driver
echo "Starting Minikube with Docker driver..."
minikube start --driver=docker

echo "Minikube installation and setup completed."

