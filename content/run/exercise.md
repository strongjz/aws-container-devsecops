---
title: Running Containers Exercise
weight: 59
---

## Installing Prometheus to our cluster 

`make helm_update`

```bash
helm repo add stable https://charts.helm.sh/stable && \
helm repo update
"stable" has been added to your repositories
Hang tight while we grab the latest from your chart repositories...
...Successfully got an update from the "stable" chart repository
Update Complete. ⎈Happy Helming!⎈
```

`make prom`
{{% expand%}}
```bash
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
{{% /expand%}}

## Deploying Fluentbit for our logs 

"FireLens gives you a simplified interface to filter logs at source, add useful metadata and send logs to almost any destination. You can now stream logs directly to Amazon CloudWatch, Amazon Kinesis Data Firehose destinations such as Amazon Elasticsearch, Amazon S3, Amazon Kinesis Data Streams and partner tools. Using Amazon ECS task definition parameters, you can select destinations and optionally define filters for additional control and FireLens will ingest logs to target destinations."

Update the EKS node group with permissions to push to the log group 

`make deploy-fluent-iam`

Then Deploy fluent bit `make deploy-fluent-bit`

{{% expand%}}
```bash
$ 
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
{{% /expand%}}

We now have deployed the Fluentbit plugin, we should see logs in our CloudWatch log Groups for our application. 

![](/images/run/cloudwatch/png)

## Deploy Falco 

`make deploy-falco`

{{% expand%}}
```bash
helm repo add falcosecurity https://falcosecurity.github.io/charts; \
helm repo update; \
helm install falco --set falco.jsonOutput=true --set image.tag=0.24.0 falcosecurity/falco
"falcosecurity" has been added to your repositories
Hang tight while we grab the latest from your chart repositories...
...Successfully got an update from the "falcosecurity" chart repository
...Successfully got an update from the "stable" chart repository
Update Complete. ⎈Happy Helming!⎈
NAME: falco
LAST DEPLOYED: Tue Sep 21 19:02:22 2021
NAMESPACE: default
STATUS: deployed
REVISION: 1
TEST SUITE: None
NOTES:
Falco agents are spinning up on each node in your cluster. After a few
seconds, they are going to start monitoring your containers looking for
security issues.


No further action should be required.


Tip: 
You can easily forward Falco events to Slack, Kafka, AWS Lambda and more with falcosidekick. 
Full list of outputs: https://github.com/falcosecurity/charts/falcosidekick.
You can enable its deployment with `--set falcosidekick.enabled=true` or in your values.yaml. 
See: https://github.com/falcosecurity/charts/blob/master/falcosidekick/values.yaml for configuration values.
```
{{% /expand%}}

You can see in Cloud Watch Falco Logs 

https://us-west-2.console.aws.amazon.com/cloudwatch/home?region=us-west-2#logsV2:log-groups/log-group/falco/log-events/alerts

![](/images/run/falco-logs.png)

Now we can deploy the demo app to raise alerts in Cloud watch 

`kubectl apply -f falco-demo/nodejs-bad-rest-api/falco-demo.yml`

Get the Loadbalancer EXTERNAL-IP for the falco-demo 

`kubectl get svc falco-demo`

```bash
NAME         TYPE           CLUSTER-IP       EXTERNAL-IP                                                              PORT(S)        AGE
falco-demo   LoadBalancer   10.100.249.117   adb9d277014bd4bdd9eef8e94f000f1b-1234566.us-west-2.elb.amazonaws.com   80:32527/TCP   4h9m
```

### Access urls under `/api/exec/<cmd>` to run arbitrary commands.

Run the following commands to execute arbitrary commands like 'ls', 'pwd', etc:

```
$ curl http://$LOAD_BALANCER_API/api/exec/ls

demo.yml
node_modules
package.json
README.md
server.js
```

```bash
$ curl http://$LOAD_BALANCER_API:8181/api/exec/pwd
```

### Try to run bash via `/api/exec/bash`, falco sends alert.

If you try to run bash via `/api/exec/bash`, falco will generate an alert:

```bash
$ curl http://$LOAD_BALANCER_API:8181/api/exec/bash
```

```bash
falco          | 22:26:53.536628076: Warning Shell spawned in a container other than entrypoint (user=root container_id=6f339b8aeb0a container_name=express_server shell=bash parent=sh cmdline=bash )
```

Navigate to CloudWatch Logs 

![](/images/run/falco-demo-alert.png)