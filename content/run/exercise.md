---
title: Running Containers Exercise
weight: 59
draft: true
---

## Installing Prometheus to our cluster 

```bash
make helm_update
helm repo add stable https://charts.helm.sh/stable && \
helm repo update
"stable" has been added to your repositories
Hang tight while we grab the latest from your chart repositories...
...Successfully got an update from the "stable" chart repository
Update Complete. ⎈Happy Helming!⎈
```

```bash
~/environment/devsecopspipeline (master) $ make prom
helm repo add stable https://charts.helm.sh/stable && \
helm repo update
"stable" already exists with the same configuration, skipping
Hang tight while we grab the latest from your chart repositories...
...Successfully got an update from the "stable" chart repository
Update Complete. ⎈Happy Helming!⎈
kubectl apply -f namespace_prometheus.yml && \
helm install prometheus stable/prometheus \
--namespace prometheus \
--set alertmanager.persistentVolume.storageClass="gp2",server.persistentVolume.storageClass="gp2"
namespace/prometheus created
WARNING: This chart is deprecated
W0911 22:48:05.645050   16010 warnings.go:70] rbac.authorization.k8s.io/v1beta1 ClusterRole is deprecated in v1.17+, unavailable in v1.22+; use rbac.authorization.k8s.io/v1 ClusterRole
W0911 22:48:05.656705   16010 warnings.go:70] rbac.authorization.k8s.io/v1beta1 ClusterRole is deprecated in v1.17+, unavailable in v1.22+; use rbac.authorization.k8s.io/v1 ClusterRole
W0911 22:48:05.667391   16010 warnings.go:70] rbac.authorization.k8s.io/v1beta1 ClusterRole is deprecated in v1.17+, unavailable in v1.22+; use rbac.authorization.k8s.io/v1 ClusterRole
W0911 22:48:05.679784   16010 warnings.go:70] rbac.authorization.k8s.io/v1beta1 ClusterRole is deprecated in v1.17+, unavailable in v1.22+; use rbac.authorization.k8s.io/v1 ClusterRole
W0911 22:48:05.691168   16010 warnings.go:70] rbac.authorization.k8s.io/v1beta1 ClusterRoleBinding is deprecated in v1.17+, unavailable in v1.22+; use rbac.authorization.k8s.io/v1 ClusterRoleBinding
W0911 22:48:05.703088   16010 warnings.go:70] rbac.authorization.k8s.io/v1beta1 ClusterRoleBinding is deprecated in v1.17+, unavailable in v1.22+; use rbac.authorization.k8s.io/v1 ClusterRoleBinding
W0911 22:48:05.716013   16010 warnings.go:70] rbac.authorization.k8s.io/v1beta1 ClusterRoleBinding is deprecated in v1.17+, unavailable in v1.22+; use rbac.authorization.k8s.io/v1 ClusterRoleBinding
W0911 22:48:05.733060   16010 warnings.go:70] rbac.authorization.k8s.io/v1beta1 ClusterRoleBinding is deprecated in v1.17+, unavailable in v1.22+; use rbac.authorization.k8s.io/v1 ClusterRoleBinding
W0911 22:48:05.962690   16010 warnings.go:70] rbac.authorization.k8s.io/v1beta1 ClusterRole is deprecated in v1.17+, unavailable in v1.22+; use rbac.authorization.k8s.io/v1 ClusterRole
W0911 22:48:05.965226   16010 warnings.go:70] rbac.authorization.k8s.io/v1beta1 ClusterRole is deprecated in v1.17+, unavailable in v1.22+; use rbac.authorization.k8s.io/v1 ClusterRole
W0911 22:48:05.968345   16010 warnings.go:70] rbac.authorization.k8s.io/v1beta1 ClusterRole is deprecated in v1.17+, unavailable in v1.22+; use rbac.authorization.k8s.io/v1 ClusterRole
W0911 22:48:05.968824   16010 warnings.go:70] rbac.authorization.k8s.io/v1beta1 ClusterRole is deprecated in v1.17+, unavailable in v1.22+; use rbac.authorization.k8s.io/v1 ClusterRole
W0911 22:48:05.978633   16010 warnings.go:70] rbac.authorization.k8s.io/v1beta1 ClusterRoleBinding is deprecated in v1.17+, unavailable in v1.22+; use rbac.authorization.k8s.io/v1 ClusterRoleBinding
W0911 22:48:05.979460   16010 warnings.go:70] rbac.authorization.k8s.io/v1beta1 ClusterRoleBinding is deprecated in v1.17+, unavailable in v1.22+; use rbac.authorization.k8s.io/v1 ClusterRoleBinding
W0911 22:48:05.979460   16010 warnings.go:70] rbac.authorization.k8s.io/v1beta1 ClusterRoleBinding is deprecated in v1.17+, unavailable in v1.22+; use rbac.authorization.k8s.io/v1 ClusterRoleBinding
W0911 22:48:05.980533   16010 warnings.go:70] rbac.authorization.k8s.io/v1beta1 ClusterRoleBinding is deprecated in v1.17+, unavailable in v1.22+; use rbac.authorization.k8s.io/v1 ClusterRoleBinding
NAME: prometheus
LAST DEPLOYED: Sat Sep 11 22:48:05 2021
NAMESPACE: prometheus
STATUS: deployed
REVISION: 1
TEST SUITE: None
NOTES:
DEPRECATED and moved to <https://github.com/prometheus-community/helm-charts>The Prometheus server can be accessed via port 80 on the following DNS name from within your cluster:
prometheus-server.prometheus.svc.cluster.local


Get the Prometheus server URL by running these commands in the same shell:
export POD_NAME=$(kubectl get pods --namespace prometheus -l "app=prometheus,component=server" -o jsonpath="{.items[0].metadata.name}")
kubectl --namespace prometheus port-forward $POD_NAME 9090


The Prometheus alertmanager can be accessed via port 80 on the following DNS name from within your cluster:
prometheus-alertmanager.prometheus.svc.cluster.local


Get the Alertmanager URL by running these commands in the same shell:
export POD_NAME=$(kubectl get pods --namespace prometheus -l "app=prometheus,component=alertmanager" -o jsonpath="{.items[0].metadata.name}")
kubectl --namespace prometheus port-forward $POD_NAME 9093
#################################################################################
######   WARNING: Pod Security Policy has been moved to a global property.  #####
######            use .Values.podSecurityPolicy.enabled with pod-based      #####
######            annotations                                               #####
######            (e.g. .Values.nodeExporter.podSecurityPolicy.annotations) #####
#################################################################################


The Prometheus PushGateway can be accessed via port 9091 on the following DNS name from within your cluster:
prometheus-pushgateway.prometheus.svc.cluster.local


Get the PushGateway URL by running these commands in the same shell:
export POD_NAME=$(kubectl get pods --namespace prometheus -l "app=prometheus,component=pushgateway" -o jsonpath="{.items[0].metadata.name}")
kubectl --namespace prometheus port-forward $POD_NAME 9091

For more information on running Prometheus, visit:
https://prometheus.io/
```


## Deploying Fluentbit for our logs 

"FireLens gives you a simplified interface to filter logs at source, add useful metadata and send logs to almost any destination. You can now stream logs directly to Amazon CloudWatch, Amazon Kinesis Data Firehose destinations such as Amazon Elasticsearch, Amazon S3, Amazon Kinesis Data Streams and partner tools. Using Amazon ECS task definition parameters, you can select destinations and optionally define filters for additional control and FireLens will ingest logs to target destinations."

```bash
$ make deploy-fluent-bit
aws iam create-policy --policy-name EKS-CloudWatchLogs-"devsecops" --policy-document file://./fluent-bit/aws/iam_role_policy.json
{
"Policy": {
"PolicyName": "EKS-CloudWatchLogs-devsecops",
"PermissionsBoundaryUsageCount": 0,
"CreateDate": "2021-09-11T22:48:53Z",
"AttachmentCount": 0,
"IsAttachable": true,
"PolicyId": "ANPAUKKITVMH4UNGDATVQ",
"DefaultVersionId": "v1",
"Path": "/",
"Arn": "arn:aws:iam::297041898255:policy/EKS-CloudWatchLogs-devsecops",
"UpdateDate": "2021-09-11T22:48:53Z"
}
}
aws iam attach-role-policy --role-name ng-1 --policy-arn `aws iam list-policies | jq -r '.[][] | select(.PolicyName == "EKS-CloudWatchLogs-devsecops") | .Arn'`
```

We now have deployed the Fluentbit plugin, we should see logs in our CloudWatch log Groups for our application. 

![](/images/run/cloudwatch/png)

## Deploy Falco 

```bash
make deploy-falco
```
