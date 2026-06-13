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
├── docs/
└── images/
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
./scripts/verify-installation.sh
```

## Deploy Test Workload

```bash
kubectl apply -f manifests/pvc.yaml
kubectl apply -f manifests/nginx-pod.yaml
```

## Validate Storage

```bash
kubectl exec -it nginx-longhorn -- sh
```

```bash
echo "Longhorn Test" > /data/test.txt
```

Delete and recreate pod:

```bash
kubectl delete pod nginx-longhorn
kubectl apply -f manifests/nginx-pod.yaml
```

Verify:

```bash
kubectl exec nginx-longhorn -- cat /data/test.txt
```

## Access Longhorn UI

```bash
kubectl -n longhorn-system port-forward svc/longhorn-frontend 8080:80
```

Open:

```text
http://localhost:8080
```

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
