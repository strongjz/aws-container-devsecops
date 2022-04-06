---
title: Running Kubernetes
weight: 52
---

#### Cluster

- Use IDP for Authorization 
- Service Accounts for Workloads 
- RBAC configured for users and workloads

#### Nodes

- CIS/NIST benchmarks for Node Security
- Kubebench for Cluster 

#### Network

- All namespaces should have NetworkPolicy
- DO NOT EXPOSE your cluster to the Internet
- Differentiate between public and private workloads

#### Secrets

- Secrets should be stored in third-party storage 
  - HashiCorp Vault
  - Conjur 
  - etcd in encrypted form.
- Secrets should be added to the container using the volumeMount mechanism or the secretKeyRef mechanism.