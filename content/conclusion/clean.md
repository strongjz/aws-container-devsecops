---
title: Cleanup
weight: 65
---

## AWS Code resources 

Delete the Codebuild, Code commit and pipeline 

```bash
make tf_destroy
```

## Cluster 
Delete the EKS Cluster 

```bash
make clean_cluster
```

Make sure to delete any other resources created 

## Load Balancers

Verify there are no Load balancers running, ALB or otherwise

```bash
aws elbv2 describe-load-balancers --query "LoadBalancers[].LoadBalancerArn"
```

```bash
aws elb describe-load-balancers --query "LoadBalancerDescriptions[].DNSName"
```

## PVC and EBS volumes

Verify there are no left over EBS volumes from the PVC's for test application

```bash
 aws ec2 describe-volumes --filters Name=tag:kubernetes.io/created-for/pv/name,Values=*     --query "Volumes[].{ID:VolumeId}"
```

