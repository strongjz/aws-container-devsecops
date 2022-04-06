---
title: Cleanup
weight: 65
---

# High Level Removal Steps 

1. Delete Falco demo
2. Delete Falco log group
3. Delete Fluent bit deploy
4. Remove Fluent bit iam
5. Remove Application
6. Terraform destroy 
7. Check/Remove for external AWS components
8. Delete Cluster w/ eksctl
9. Delete terraform s3 bucket
10. Delete cloud9 instance

### 1. Delete Falco demo

`kubectl delete -f falco-demo/nodejs-bad-rest-api/falco-demo.yml`

### 2. Delete Falco log group

`aws logs delete-log-group --log-group-name falco`

### 3. Delete Fluent bit deploy

`kubectl delete -f fluent-bit/kubernetes/`

### 4. Remove Fluent bit iam

`aws iam  delete-policy --policy-arn arn:aws:iam::$ACCOUNT_ID:policy/EKS-CloudWatchLogs-devsecops`

### 5. Remove Application

Deleting the cluster removes the application

### 6. Terraform destroy

Delete the Codebuild, Code commit and pipeline

```bash
make tf_destroy
```

### 7. Check/Remove for external AWS components

Make sure to delete any other resources created

#### Load Balancers

Verify there are no Load balancers running, ALB or otherwise

```bash
aws elbv2 describe-load-balancers --query "LoadBalancers[].LoadBalancerArn"
```

```bash
aws elb describe-load-balancers --query "LoadBalancerDescriptions[].DNSName"
```

#### PVC and EBS volumes

Verify there are no left over EBS volumes from the PVC's for test application

```bash
 aws ec2 describe-volumes --filters Name=tag:kubernetes.io/created-for/pv/name,Values=*     --query "Volumes[].{ID:VolumeId}"
```

### 8. Delete Cluster w/ eksctl

Delete the EKS Cluster

```bash
make clean_cluster
```

### 9. Delete terraform s3 bucket

`aws s3 rm s3://$NAME_S3_BUCKET --region us-west-2 --recursive`

### 10. Delete cloud9 instance

1. To open the dashboard, on the menu bar in the IDE, choose AWS Cloud9, Go To Your Dashboard.

2. Do one of the following:
   1. Choose the title inside the card for your Cloud9 instance, and then choose Delete.

   2. Select the Cloud9 instance card, and then choose Delete.

3. In the Delete dialog box, enter Delete, and then choose Delete. 
 
The delete operation takes a few minutes.

