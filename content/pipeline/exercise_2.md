---
title: Container Pipeline Exercise Part 2
weight: 49
---

Inside the devsecops repo `cd ~/environments/devsecopspipeline/` we are going to manually push our application
image to AWS ECR 

## AWS ECR

Let's push our docker image to ECR that was created from Terraform

`make docker_push`

{{% expand%}}
```bash
docker login -u AWS -p redacted https://123456789012.dkr.ecr.us-west-2.amazonaws.com
WARNING! Using --password via the CLI is insecure. Use --password-stdin.
WARNING! Your password will be stored unencrypted in /home/ec2-user/.docker/config.json.
Configure a credential helper to remove this warning. See
https://docs.docker.com/engine/reference/commandline/login/#credentials-store

Login Succeeded
docker build -t 123456789012.dkr.ecr.us-west-2.amazonaws.com/golang_example-codemash:0.1.20 .
Sending build context to Docker daemon  198.3MB
Step 1/10 : FROM golang:1.13-alpine AS builder
 ---> 5863598a981a
Step 2/10 : RUN apk update && apk add --no-cache git
 ---> Using cache
 ---> 38f3e2c68459
Step 3/10 : WORKDIR /go/src/app
 ---> Using cache
 ---> 7cfc77561295
Step 4/10 : COPY . .
 ---> a6c705d6dc6a
Step 5/10 : RUN GIT_TERMINAL_PROMPT=1 go get -d -v
 ---> Running in 96f459e87b9c
github.com/strongjz/go_example_app (download)
github.com/gin-gonic/gin (download)
github.com/gin-contrib/sse (download)
github.com/go-playground/validator (download)
github.com/go-playground/universal-translator (download)
github.com/go-playground/locales (download)
github.com/leodido/go-urn (download)
get "golang.org/x/crypto/sha3": found meta tag get.metaImport{Prefix:"golang.org/x/crypto", VCS:"git", RepoRoot:"https://go.googlesource.com/crypto"} at //golang.org/x/crypto/sha3?go-get=1
get "golang.org/x/crypto/sha3": verifying non-authoritative meta tag
golang.org/x/crypto (download)
get "golang.org/x/text/language": found meta tag get.metaImport{Prefix:"golang.org/x/text", VCS:"git", RepoRoot:"https://go.googlesource.com/text"} at //golang.org/x/text/language?go-get=1
get "golang.org/x/text/language": verifying non-authoritative meta tag
golang.org/x/text (download)
github.com/ugorji/go (download)
get "google.golang.org/protobuf/proto": found meta tag get.metaImport{Prefix:"google.golang.org/protobuf", VCS:"git", RepoRoot:"https://go.googlesource.com/protobuf"} at //google.golang.org/protobuf/proto?go-get=1
get "google.golang.org/protobuf/proto": verifying non-authoritative meta tag
google.golang.org/protobuf (download)
get "gopkg.in/yaml.v2": found meta tag get.metaImport{Prefix:"gopkg.in/yaml.v2", VCS:"git", RepoRoot:"https://gopkg.in/yaml.v2"} at //gopkg.in/yaml.v2?go-get=1
gopkg.in/yaml.v2 (download)
github.com/mattn/go-isatty (download)
get "golang.org/x/sys/unix": found meta tag get.metaImport{Prefix:"golang.org/x/sys", VCS:"git", RepoRoot:"https://go.googlesource.com/sys"} at //golang.org/x/sys/unix?go-get=1
get "golang.org/x/sys/unix": verifying non-authoritative meta tag
golang.org/x/sys (download)
github.com/lib/pq (download)
Removing intermediate container 96f459e87b9c
 ---> 953ff65afc5d
Step 6/10 : RUN CGO_ENABLED=0 go build -o /go/bin/app
 ---> Running in 49da19462426
Removing intermediate container 49da19462426
 ---> 7e9d11bad96b
Step 7/10 : FROM golang:1.13-alpine
 ---> 5863598a981a
Step 8/10 : COPY --from=builder /go/bin/app /go/bin/app
 ---> Using cache
 ---> abf4839e8c6b
Step 9/10 : EXPOSE 8080
 ---> Using cache
 ---> 62583b2da3ce
Step 10/10 : CMD ["/go/bin/app"]
 ---> Using cache
 ---> 20b885db4549
Successfully built 20b885db4549
Successfully tagged 123456789012.dkr.ecr.us-west-2.amazonaws.com/golang_example-codemash:0.1.20
docker push 123456789012.dkr.ecr.us-west-2.amazonaws.com/golang_example-codemash:0.1.20
The push refers to repository [123456789012.dkr.ecr.us-west-2.amazonaws.com/golang_example-codemash]
6223903865fc: Pushed 
39c40114257b: Pushed 
08161ff6b353: Pushed 
1ba1431fe2ba: Pushed 
0f7493e3a35b: Pushed 
50644c29ef5a: Pushed 
0.1.20: digest: sha256:256531371d0ca8da6d1aa13ad63579f887a1c5e8e2de25136bface4e3e13ccd4 size: 1576
```
{{% /expand%}}

### ECR scans our images for vulnerabilities

`make ecr_scan_findings`

{{% expand%}}
```bash
aws ecr describe-image-scan-findings --repository-name golang_example-codemash --image-id imageTag=0.1.20
{
    "imageScanStatus": {
        "status": "COMPLETE", 
        "description": "The scan was completed successfully."
    }, 
    "repositoryName": "golang_example-codemash", 
    "registryId": "123456789012", 
    "imageId": {
        "imageTag": "0.1.20", 
        "imageDigest": "sha256:256531371d0ca8da6d1aa13ad63579f887a1c5e8e2de25136bface4e3e13ccd4"
    }, 
    "imageScanFindings": {
        "imageScanCompletedAt": 1631403103.0, 
        "vulnerabilitySourceUpdatedAt": 1631377466.0, 
        "findings": [
            {
                "severity": "MEDIUM", 
                "attributes": [
                    {
                        "value": "2.10.5-r1", 
                        "key": "package_version"
                    }, 
                    {
                        "value": "apk-tools", 
                        "key": "package_name"
                    }, 
                    {
                        "value": "AV:N/AC:L/Au:N/C:N/I:N/A:P", 
                        "key": "CVSS2_VECTOR"
                    }, 
                    {
                        "value": "5", 
                        "key": "CVSS2_SCORE"
                    }
                ], 
                "name": "CVE-2021-30139", 
                "uri": "https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-30139"
            }, 
            {
                "severity": "MEDIUM", 
                "attributes": [
                    {
                        "value": "2.10.5-r1", 
                        "key": "package_version"
                    }, 
                    {
                        "value": "apk-tools", 
                        "key": "package_name"
                    }, 
                    {
                        "value": "AV:N/AC:L/Au:N/C:P/I:N/A:P", 
                        "key": "CVSS2_VECTOR"
                    }, 
                    {
                        "value": "6.4", 
                        "key": "CVSS2_SCORE"
                    }
                ], 
                "name": "CVE-2021-36159", 
                "uri": "https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-36159"
            }, 
            {
                "severity": "MEDIUM", 
                "attributes": [
                    {
                        "value": "1.31.1-r16", 
                        "key": "package_version"
                    }, 
                    {
                        "value": "busybox", 
                        "key": "package_name"
                    }, 
                    {
                        "value": "AV:N/AC:L/Au:N/C:N/I:N/A:P", 
                        "key": "CVSS2_VECTOR"
                    }, 
                    {
                        "value": "5", 
                        "key": "CVSS2_SCORE"
                    }
                ], 
                "name": "CVE-2021-28831", 
                "uri": "https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-28831"
            }, 
            {
                "severity": "LOW", 
                "attributes": [
                    {
                        "value": "1.1.24-r9", 
                        "key": "package_version"
                    }, 
                    {
                        "value": "musl", 
                        "key": "package_name"
                    }, 
                    {
                        "value": "AV:L/AC:L/Au:N/C:N/I:N/A:P", 
                        "key": "CVSS2_VECTOR"
                    }, 
                    {
                        "value": "2.1", 
                        "key": "CVSS2_SCORE"
                    }
                ], 
                "name": "CVE-2020-28928", 
                "uri": "https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-28928"
            }
        ], 
        "findingSeverityCounts": {
            "MEDIUM": 3, 
            "LOW": 1
        }
    }
}
```
{{% /expand%}}

In the Console it would look this

https://us-west-2.console.aws.amazon.com/ecr/repositories

![](/images/pipeline/ecr-scan.png)

### Let's reduce our image size

Update your Dockerfile

`FROM golang:1.13-alpine`

to

`FROM scratch`

you should get an error

```bash
tag invalid: The image tag '0.1.20' already exists in the 'golang_example-codemash' repository and cannot be overwritten because the repository is immutable.
make: *** [docker_push] Error 1
```

Update the `~/environment/devsecopspipeline/VERSION.txt` to the number you think is appropriate

Then rebuild `make docker_build`

Inspect the image size differences
```bash
docker images 
123456789012.dkr.ecr.us-west-2.amazonaws.com/golang_example-codemash   0.1.21        e199bbd29e43   3 minutes ago    16.1MB
123456789012.dkr.ecr.us-west-2.amazonaws.com/golang_example-codemash   0.1.20        20b885db4549   12 minutes ago   376MB
```

Now scratch container only has the go binary in it, and ECR doesnt not support scanning Scratch. 

`make ecr_scan_findings`

```bash
aws ecr describe-image-scan-findings --repository-name golang_example-codemash --image-id imageTag=0.1.21
{
    "imageScanStatus": {
        "status": "FAILED", 
        "description": "UnsupportedImageError: The operating system and/or package manager are not supported."
    }, 
    "repositoryName": "golang_example-codemash", 
    "registryId": "123456789012", 
    "imageId": {
        "imageTag": "0.1.21", 
        "imageDigest": "sha256:97169aa383bf476466e9af45079aed95e8bfdb09cbf94ca05a11ede20631c323"
    }, 
    "imageScanFindings": null
}
```

## AWS CodePipeline

Now that we have a CodePipeline setup thanks to terraform let's push our code there and watch the pipeline run, 
and do everything we just did but in the CodePipeline

First We need to give our Codepipeline Role access to the cluster `make cluster_iam`

```bash
eksctl create iamidentitymapping --cluster devsecops --arn arn:aws:iam::123456789012:role/devsecops-codemash-codebuild   --username admin \
--group system:masters
2021-09-18 20:33:43 [ℹ]  eksctl version 0.67.0
2021-09-18 20:33:43 [ℹ]  using region us-west-2
2021-09-18 20:33:43 [ℹ]  adding identity "arn:aws:iam::123456789012:role/devsecops-codemash-codebuild" to auth ConfigMap
```

We clone the repo from GitHub but now let's push it to AWS CodeCommit

If you don't remember the name we can use the aws cli to find it for use `aws codecommit list-repositories`

```bash
{
    "repositories": [
        {
            "repositoryName": "codemash-devsecops-repo", 
            "repositoryId": "568b8724-36c5-44fe-9848-42e2db43a861"
        }
}
```

Now we can push the repo to AWS Code commit by adding a new remote

```bash
git remote add aws https://git-codecommit.us-west-2.amazonaws.com/v1/repos/codemash-devsecops-repo
git push aws 
```

[Navigate to the CodePipeline console to build in progress](https://us-west-2.console.aws.amazon.com/codesuite/codepipeline/pipelines)

![](/images/pipeline/code-pipeline-progress.png)

Once our deployment finishes we can test the cluster in AWS `kubectl get svc clusterip-service`

```bash
NAME                TYPE           CLUSTER-IP       EXTERNAL-IP                                                              PORT(S)        AGE
clusterip-service   LoadBalancer   10.100.254.156   a9d40a7cc91b447e7a7830a6aa4a1b97-970438419.us-west-2.elb.amazonaws.com   80:30430/TCP   87m
```

Take that EXTERNAL-IP and test the application 

```bash
curl a9d40a7cc91b447e7a7830a6aa4a1b97-970438419.us-west-2.elb.amazonaws.com/
{"message":"Default Page"}

curl a9d40a7cc91b447e7a7830a6aa4a1b97-970438419.us-west-2.elb.amazonaws.com/data
{"message":"Database Connected"}

curl a9d40a7cc91b447e7a7830a6aa4a1b97-970438419.us-west-2.elb.amazonaws.com/host
{"message":"NODE: ip-192-168-62-23.us-west-2.compute.internal, POD IP:192.168.51.0"}
```