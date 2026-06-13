#!/bin/bash

set -e

echo "Installing Longhorn..."

kubectl create namespace longhorn-system --dry-run=client -o yaml | kubectl apply -f -

kubectl apply -f https://raw.githubusercontent.com/longhorn/longhorn/master/deploy/longhorn.yaml

echo "Waiting for Longhorn pods..."

kubectl wait \
  --for=condition=Ready \
  pod \
  --all \
  -n longhorn-system \
  --timeout=600s

echo "Longhorn installation completed."
