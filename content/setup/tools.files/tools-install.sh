#!/usr/bin/env bash

yum update -y
yum group install "Development Tools" -y
yum install -y yum-utils jq gettext bash-completion moreutils make

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
    systemctl enable docker
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

#Docker-compose
install_docker_compose(){
  curl -L --silent "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
  chmod +x /usr/local/bin/docker-compose
}

install_golang(){
  curl -o go1.17.5.linux-amd64.tar.gz https://go.dev/dl/go1.17.5.linux-amd64.tar.gz -vvv -L
  shasum -a 256 -c <<< 'bd78114b0d441b029c8fe0341f4910370925a4d270a6a590668840675b0c653e  go1.17.5.linux-amd64.tar.gz'
  rm -rf /usr/local/go && tar -C /usr/local -xzf go1.17.5.linux-amd64.tar.gz
  export PATH=/usr/local/go/bin:$PATH
  go version
}
install_cosign(){

    go install github.com/sigstore/cosign/cmd/cosign@v1.7.1
}

installs=(golang docker docker_compose kind terraform eksctl kubectl helm cosign)

for i in "${installs[@]}"; do
    echo "INSTALLING $i"
    install_"$i"
done
