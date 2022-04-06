---
title: Secure Containers
weight: 31
---

## Baseline

- DISABLE ROOT
- Mount the container's root filesystem as read-only
- set [k8s Security context](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.22/#securitycontext-v1-core) 
- set [Linux Capabilities](https://man7.org/linux/man-pages/man7/capabilities.7.html)
- Disable privilege escalation

```yaml
    securityContext:
      allowPrivilegeEscalation: false
```
- Least Privilege by defining user 
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: pod-security
spec:
  securityContext:
    runAsUser: 10000
    runAsGroup: 30000
    fsGroup: 20000
```
- Network policies

- Workload configuration should be audited regularly, [Kubesec](https://github.com/controlplaneio/kubesec)

- Container Capabilities
```yaml
     capabilities:
        add: ["NET_ADMIN", "SYS_TIME"]
```

- Do not install wget, curl, netcat in production application image
- An image signature should be generated, tools like [Cosign](https://github.com/sigstore/cosign)

- DISABLE ROOT

## Helpers 

Versioning
- Invest in Strategy
- Containers follow build Versions of Software
  - [Semantic Versioning](https://semver.org/)
- Metadata
```yaml
LABEL <key>=<value> <key>=<value> <key>=<value> ...
LABEL "com.example.vendor"="ACME Incorporated"
LABEL com.example.label-with-value="foo"
LABEL version="1.0"
LABEL description="This text illustrates \
that label-values can span multiple lines."
```

## No really do this

Latest Tag

- Avoid using :latest tags
- Unable to control
- Unknown updates
- Versions the way to go
- Container digest most secure

## Reduce, reuse

Base Container

- Reduce Build Times
- Scratch Container
- Golden images