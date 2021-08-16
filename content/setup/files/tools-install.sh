#!/usr/bin/env bash

#yum update -y
#yum group install "Development Tools"
#yum install -y yum-utils

function verify_command() {
    if command -v $1 &> /dev/null
    then
        echo "$1 found"
        return 0
    else
        echo "$1 could not be found"
        return 1
    fi
}

#Docker
install_docker() {
    amazon-linux-extras install docker -y
    yum install -y docker

    service docker start
    usermod -a -G docker ec2-user
    docker run hello-world
}

#kind
install_kind() {
    curl -q -o /usr/local/bin/kind --location https://kind.sigs.k8s.io/dl/v0.11.1/kind-$(uname -s)-amd64
    chmod +x /usr/local/bin/kind
    #/usr/local/bin/kind --help
}

#terraform
install_terraform() {
    yum install -y terraform
    #terraform --help
}

#eksctl
install_eksctl() {
    curl -q --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
    mv -f /tmp/eksctl /usr/local/bin/
    chmod +x /usr/local/bin/eksctl
    #/usr/local/bin/eksctl --help
}

#Kubectl
install_kubectl() {
    curl -o /usr/local/bin/kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.21.2/2021-07-05/bin/linux/amd64/kubectl
    chmod +x /usr/local/bin/kubectl
    #/usr/local/bin/kubectl --help
}

#Helm
install_helm(){
    curl --silent --location https://get.helm.sh/helm-v3.6.3-linux-amd64.tar.gz | tar xz -C /tmp/
    mv -f /tmp/linux-amd64/helm /usr/local/bin/
    chmod +x /usr/local/bin/helm
    #/usr/local/bin/helm --help
}

installs=(docker kind terraform eksctl kubectl helm)

for i in "${installs[@]}"; do
    echo "INSTALLING $i"
    install_"$i"
done
