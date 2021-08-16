#!/usr/bin/env bash

yum update -y
yum group install "Development Tools"
yum install -y yum-utils
#Docker
amazon-linux-extras install docker
yum install -y docker
service docker start
usermod -a -G docker ec2-user
docker run hello-world

#kind
curl -o /usr/local/bin/kind --location https://kind.sigs.k8s.io/dl/v0.11.1/kind-$(uname -s)-amd64
chmod +x /usr/local/bin/kind

#terraform
curl --silent --location https://releases.hashicorp.com/terraform/1.0.4/terraform_1.0.4_linux_amd64.zip | tar xz -C /tmp
mv -v /tmp/terraform /usr/local/bin/

/usr/local/bin/terraform -help


#eksctl
curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
mv -v /tmp/eksctl /usr/local/bin/

/usr/local/bin/eksctl --help

#Kubectl
wget -q https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl \
	    -O /usr/bin/kubectl && \
	        chmod +x /usr/local/bin/kubectl

#Helm
curl --silent --location https://get.helm.sh/helm-v3.6.3-linux-amd64.tar.gz | tar xz -C /tmp
mv -v /tmp/helm /usr/local/bin/



