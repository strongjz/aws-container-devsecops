---
title: Running Containers
weight: 50
---

- Minimal OS
    - Federa CoreOS
    - CoreOS’s Container Linux
    - Rancher OS
    - Ubuntu Core OS
    - AWS BottleRocket
    - VMware Photon OS

- Run time - tools should be deployed that monitor running containers that misbehave

- Resource Caps to reduce DDOS possibilities 

- Continuous scan images in registry for vulnerabilities in the registries, images can run in production but not get updated and deployed

- Create separate environments for development, test, production and other scenarios, each with specific controls to provide RBAC for container deployment and management activities.

- Shared Kernel – Do not mix containerized and non-containerized workloads on the same host instance

- Regular rebuild clusters and benchmark security 
  - https://github.com/aquasecurity/kube-bench

- Network Policies 
  - Per Namespace if using Kubernetes network policies 
  - Applications should have their own define with the deployment

- Admins should have examples so application developers can understand how it impacts their applications
