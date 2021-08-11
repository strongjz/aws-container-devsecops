---
title: Securely Running Containers
weight: 50
---

# Securely Running Containers

Minimal OS
Bottle Rocket
Ubuntu Core


CI/CD - Images should be scanned for CVE’s

Run time - tools should be deployed that monitor running containers that miss behave

Continuous scan images in registry for vulnerabilities in the registries, images can run in production but not get updated and deployed 


Create separate environments for development, test, production and other scenarios, each with specific controls to provide RBAC for container deployment and management activities.

Shared Kernel – Do not mix containerized and non-containerized workloads on the same host instance. (e.g.: if a host is running a web server container, it should not also run a web server as a regularly installed component directly within the host OS). This will also make it easy to apply optimized countermeasures for container protection.

https://github.com/aquasecurity/kube-bench

Network Policies

Per Namespace if using Kubernetes network policies

Applications should have their own define with the deployment

Admins should have examples so application developers can understand how it impacts their applications 















