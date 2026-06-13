# Longhorn on Kubernetes

Deploy and manage Longhorn distributed block storage on Kubernetes.

## Overview

Longhorn is a cloud-native distributed block storage platform for Kubernetes that provides:

- Persistent Storage
- High Availability
- Snapshots
- Backups
- Disaster Recovery
- Volume Replication

## Architecture

```text
Application Pod
       │
       ▼
 Persistent Volume
       │
       ▼
 Longhorn Engine
       │
 ┌─────┼─────┐
 ▼     ▼     ▼
Replica Replica Replica
Node A  Node B Node C
```

## Prerequisites

- Kubernetes Cluster
- kubectl configured
- 3 Worker Nodes (Recommended)
- Open-iSCSI installed

## Repository Structure

```text
longhorn-k8s-demo/
├── manifests/
├── scripts/
└── README.md
```

## Installation

### Clone Repository

```bash
git clone https://github.com/abhay-dandge/Longhorn.git
cd longhorn-k8s-demo
```

### Install Longhorn

```bash
chmod +x scripts/install-longhorn.sh
./scripts/install-longhorn.sh
```
<img width="830" height="574" alt="image" src="https://github.com/user-attachments/assets/3fb3b4ab-0bf6-438a-b7a6-ee116edbc7dd" />

<img width="777" height="293" alt="image" src="https://github.com/user-attachments/assets/1ee10014-6cd6-43f6-8009-ea92e25b3718" />

### Verify Installation

```bash
chmod +x scripts/verify-installation.sh
./scripts/verify-installation.sh
```

## Deploy Test Workload

```bash
kubectl apply -f manifests/pvc.yaml
kubectl apply -f manifests/nginx-pod.yaml
```
<img width="609" height="108" alt="image" src="https://github.com/user-attachments/assets/eb2c0b5c-82d8-466b-93de-d2d4a31871aa" />

## Validate Storage

```bash
kubectl exec -it nginx-longhorn -- sh
```

```bash
echo "Longhorn Test" > /data/test.txt
```
<img width="667" height="74" alt="image" src="https://github.com/user-attachments/assets/7a712bd8-1df7-4367-8f42-ec4362178a3f" />

Delete and recreate pod:

```bash
kubectl delete pod nginx-longhorn
kubectl apply -f manifests/nginx-pod.yaml
```
<img width="598" height="111" alt="image" src="https://github.com/user-attachments/assets/5f653a1a-cb5d-4513-935a-b1ec1d614840" />

Verify:

```bash
kubectl exec nginx-longhorn -- cat /data/test.txt
```
<img width="735" height="73" alt="image" src="https://github.com/user-attachments/assets/bb99e38d-056f-427f-a5a1-53934ee7ed97" />

## Access Longhorn UI

```bash
kubectl patch svc longhorn-frontend \
-n longhorn-system \
-p '{"spec":{"type":"NodePort"}}'

kubectl get svc longhorn-frontend -n longhorn-system
```
<img width="826" height="169" alt="image" src="https://github.com/user-attachments/assets/b86dbfcf-4b57-4535-8eb1-721a24631206" />


Open:

```text
http://localhost:31793 | Access using nodeport 
```
<img width="1366" height="617" alt="image" src="https://github.com/user-attachments/assets/e7cb3a05-0eb1-4174-a900-3a0a79a5c876" />

## Cleanup

```bash
./scripts/uninstall-longhorn.sh
```

## References

- Longhorn Documentation
- Kubernetes Storage Documentation

## Author

Abhay Dandge

LinkedIn: https://www.linkedin.com/in/abhaydandge/
