#!/bin/bash

# Define variables
KIND_VERSION="v0.11.1"
CLUSTER_NAME="kind-cluster-proj"

# Install KIND (if not already installed)
if ! command -v kind &> /dev/null; then
    echo "Installing KIND..."
    curl -Lo ./kind https://kind.sigs.k8s.io/dl/$KIND_VERSION/kind-linux-amd64
    chmod +x ./kind
    sudo mv ./kind /usr/local/bin/kind
fi

# Create KIND cluster
echo "Creating KIND cluster..."
kind create cluster --name $CLUSTER_NAME

# Set kubeconfig context
echo "Setting kubeconfig context..."
export KUBECONFIG=~/.kube/config