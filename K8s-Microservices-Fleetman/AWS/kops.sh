#!/bin/bash

# Download kops binary
curl -Lo kops https://github.com/kubernetes/kops/releases/download/$(curl -s https://api.github.com/repos/kubernetes/kops/releases/latest | grep tag_name | cut -d '"' -f 4)/kops-linux-amd64

# Make it executable
chmod +x kops

# Move it to a directory in the system PATH
sudo mv kops /usr/local/bin/kops

# Verify installation
kops version
