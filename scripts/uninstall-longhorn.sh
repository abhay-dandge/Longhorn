#!/bin/bash

echo "Removing Longhorn..."

kubectl delete -f https://raw.githubusercontent.com/longhorn/longhorn/master/deploy/longhorn.yaml

kubectl delete namespace longhorn-system

echo "Longhorn removed."
