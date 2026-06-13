#!/bin/bash

echo "Checking Longhorn Pods..."

kubectl get pods -n longhorn-system

echo
echo "Checking Storage Classes..."

kubectl get storageclass

echo
echo "Checking Longhorn Volumes..."

kubectl get volumes.longhorn.io -n longhorn-system
