---
title: Workshop tools
weight: 13
---

In order for us to continue with the exercises, there are several tools that our needed to be installed on our Cloud9 instance.

Download these two repos with git

`git clone https://github.com/strongjz/devsecopspipeline`

`git clone https://github.com/strongjz/aws-container-devsecops`

Or Download the script here.

{{%attachments title="Scripts" pattern="tools-install.sh"/%}}

The script will install

* docker
* kind
* terraform
* eksctl
* kubectl
* helm


Navigate to where you downloaded the installation script.

`cd aws-container-devsecops/content/setup/clone.files/`

`sudo bash ./tools-install.sh`

{{%expand "Expand here is what it looks like in its entirety" %}}
```bash
:~/environment $ git clone https://github.com/strongjz/aws-container-devsecops
Cloning into 'aws-container-devsecops'...
remote: Enumerating objects: 595, done.
remote: Counting objects: 100% (595/595), done.
remote: Compressing objects: 100% (399/399), done.
remote: Total 595 (delta 170), reused 560 (delta 141), pack-reused 0
Receiving objects: 100% (595/595), 8.95 MiB | 23.25 MiB/s, done.
Resolving deltas: 100% (170/170), done.
~/environment $ cd aws-container-devsecops/content/setup/^C
~/environment $ rm -rf aws-container-devsecops/
~/environment $ git clone https://github.com/strongjz/aws-container-devsecops
Cloning into 'aws-container-devsecops'...
remote: Enumerating objects: 624, done.
remote: Counting objects: 100% (624/624), done.
remote: Compressing objects: 100% (410/410), done.
remote: Total 624 (delta 187), reused 587 (delta 156), pack-reused 0
Receiving objects: 100% (624/624), 8.95 MiB | 18.59 MiB/s, done.
Resolving deltas: 100% (187/187), done.
~/environment $ cd aws-container-devsecops/content/setup/clone.files/
~/environment/aws-container-devsecops/content/setup/clone.files (main) $ sudo
Display all 2327 possibilities? (y or n)
~/environment/aws-container-devsecops/content/setup/clone.files (main) $ sudo ls
tools-install.sh
~/environment/aws-container-devsecops/content/setup/clone.files (main) $ ^C
~/environment/aws-container-devsecops/content/setup/clone.files (main) $ sudo bash tools-install.sh
INSTALLING docker
Installing docker
Loaded plugins: extras_suggestions, langpacks, priorities, update-motd
Cleaning repos: amzn2-core amzn2extra-docker amzn2extra-epel amzn2extra-lamp-mariadb10.2-php7.2 epel hashicorp
35 metadata files removed
16 sqlite files removed
0 metadata files removed
Loaded plugins: extras_suggestions, langpacks, priorities, update-motd
amzn2-core                                                                                                         | 3.7 kB  00:00:00
amzn2extra-docker                                                                                                  | 3.0 kB  00:00:00
amzn2extra-epel                                                                                                    | 3.0 kB  00:00:00
amzn2extra-lamp-mariadb10.2-php7.2                                                                                 | 3.0 kB  00:00:00
epel/x86_64/metalink                                                                                               |  15 kB  00:00:00
epel                                                                                                               | 4.7 kB  00:00:00
hashicorp                                                                                                          | 1.4 kB  00:00:00
(1/13): amzn2-core/2/x86_64/group_gz                                                                               | 2.5 kB  00:00:00
(2/13): amzn2-core/2/x86_64/updateinfo                                                                             | 405 kB  00:00:00
(3/13): amzn2extra-epel/2/x86_64/primary_db                                                                        | 1.8 kB  00:00:00
(4/13): amzn2extra-lamp-mariadb10.2-php7.2/2/x86_64/updateinfo                                                     |   76 B  00:00:00
(5/13): amzn2extra-lamp-mariadb10.2-php7.2/2/x86_64/primary_db                                                     | 506 kB  00:00:00
(6/13): amzn2extra-epel/2/x86_64/updateinfo                                                                        |   76 B  00:00:00
(7/13): amzn2extra-docker/2/x86_64/primary_db                                                                      |  79 kB  00:00:00
(8/13): amzn2extra-docker/2/x86_64/updateinfo                                                                      |   76 B  00:00:00
(9/13): epel/x86_64/group_gz                                                                                       |  96 kB  00:00:00
(10/13): epel/x86_64/updateinfo                                                                                    | 1.0 MB  00:00:00
(11/13): epel/x86_64/primary_db                                                                                    | 6.9 MB  00:00:00
(12/13): hashicorp/2/x86_64/primary                                                                                |  55 kB  00:00:00
(13/13): amzn2-core/2/x86_64/primary_db                                                                            |  56 MB  00:00:00
hashicorp                                                                                                                         384/384
242 packages excluded due to repository priority protections
Resolving Dependencies
--> Running transaction check
---> Package docker.x86_64 0:20.10.4-1.amzn2 will be installed
--> Finished Dependency Resolution

Dependencies Resolved

==========================================================================================================================================
Package                    Arch                       Version                                Repository                             Size
==========================================================================================================================================
Installing:
docker                     x86_64                     20.10.4-1.amzn2                        amzn2extra-docker                      32 M

Transaction Summary
==========================================================================================================================================
Install  1 Package

Total download size: 32 M
Installed size: 136 M
Downloading packages:
docker-20.10.4-1.amzn2.x86_64.rpm                                                                                  |  32 MB  00:00:00
Running transaction check
Running transaction test
Transaction test succeeded
Running transaction
Installing : docker-20.10.4-1.amzn2.x86_64                                                                                          1/1
Verifying  : docker-20.10.4-1.amzn2.x86_64                                                                                          1/1

Installed:
docker.x86_64 0:20.10.4-1.amzn2

Complete!
0  ansible2                        available    \
[ =2.4.2  =2.4.6  =2.8  =stable ]
2  httpd_modules                   available    [ =1.0  =stable ]
3  memcached1.5                    available    \
[ =1.5.1  =1.5.16  =1.5.17 ]
5  postgresql9.6                   available    \
[ =9.6.6  =9.6.8  =stable ]
6  postgresql10                    available    [ =10  =stable ]
9  R3.4                            available    [ =3.4.3  =stable ]
10  rust1                           available    \
[ =1.22.1  =1.26.0  =1.26.1  =1.27.2  =1.31.0  =1.38.0
=stable ]
11  vim                             available    [ =8.0  =stable ]
15  php7.2                          available    \
[ =7.2.0  =7.2.4  =7.2.5  =7.2.8  =7.2.11  =7.2.13  =7.2.14
=7.2.16  =7.2.17  =7.2.19  =7.2.21  =7.2.22  =7.2.23
=7.2.24  =7.2.26  =stable ]
17  lamp-mariadb10.2-php7.2=latest  enabled      \
[ =10.2.10_7.2.0  =10.2.10_7.2.4  =10.2.10_7.2.5
=10.2.10_7.2.8  =10.2.10_7.2.11  =10.2.10_7.2.13
=10.2.10_7.2.14  =10.2.10_7.2.16  =10.2.10_7.2.17
=10.2.10_7.2.19  =10.2.10_7.2.22  =10.2.10_7.2.23
=10.2.10_7.2.24  =stable ]
18  libreoffice                     available    \
[ =5.0.6.2_15  =5.3.6.1  =stable ]
19  gimp                            available    [ =2.8.22 ]
20  docker=latest                   enabled      \
[ =17.12.1  =18.03.1  =18.06.1  =18.09.9  =stable ]
21  mate-desktop1.x                 available    \
[ =1.19.0  =1.20.0  =stable ]
22  GraphicsMagick1.3               available    \
[ =1.3.29  =1.3.32  =1.3.34  =stable ]
23  tomcat8.5                       available    \
[ =8.5.31  =8.5.32  =8.5.38  =8.5.40  =8.5.42  =8.5.50
=stable ]
24  epel=latest                     enabled      [ =7.11  =stable ]
25  testing                         available    [ =1.0  =stable ]
26  ecs                             available    [ =stable ]
27  corretto8                       available    \
[ =1.8.0_192  =1.8.0_202  =1.8.0_212  =1.8.0_222  =1.8.0_232
=1.8.0_242  =stable ]
28  firecracker                     available    [ =0.11  =stable ]
29  golang1.11                      available    \
[ =1.11.3  =1.11.11  =1.11.13  =stable ]
30  squid4                          available    [ =4  =stable ]
_  php7.3                          available    \
[ =7.3.2  =7.3.3  =7.3.4  =7.3.6  =7.3.8  =7.3.9  =7.3.10
=7.3.11  =7.3.13  =stable ]
32  lustre2.10                      available    \
[ =2.10.5  =2.10.8  =stable ]
33  java-openjdk11                  available    [ =11  =stable ]
34  lynis                           available    [ =stable ]
35  kernel-ng                       available    [ =stable ]
36  BCC                             available    [ =0.x  =stable ]
37  mono                            available    [ =5.x  =stable ]
38  nginx1                          available    [ =stable ]
39  ruby2.6                         available    [ =2.6  =stable ]
40  mock                            available    [ =stable ]
41  postgresql11                    available    [ =11  =stable ]
_  php7.4                          available    [ =stable ]
43  livepatch                       available    [ =stable ]
44  python3.8                       available    [ =stable ]
45  haproxy2                        available    [ =stable ]
46  collectd                        available    [ =stable ]
47  aws-nitro-enclaves-cli          available    [ =stable ]
48  R4                              available    [ =stable ]
49  kernel-5.4                      available    [ =stable ]
50  selinux-ng                      available    [ =stable ]
_  php8.0                          available    [ =stable ]
52  tomcat9                         available    [ =stable ]
53  unbound1.13                     available    [ =stable ]
_  mariadb10.5                     available    [ =stable ]
55  kernel-5.10                     available    [ =stable ]
56  redis6                          available    [ =stable ]
57  ruby3.0                         available    [ =stable ]
58  postgresql12                    available    [ =stable ]
59  postgresql13                    available    [ =stable ]
60  mock2                           available    [ =stable ]
Loaded plugins: extras_suggestions, langpacks, priorities, update-motd
242 packages excluded due to repository priority protections
Package docker-20.10.4-1.amzn2.x86_64 already installed and latest version
Nothing to do
Redirecting to /bin/systemctl start docker.service

Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
1. The Docker client contacted the Docker daemon.
2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
   (amd64)
3. The Docker daemon created a new container from that image which runs the
   executable that produces the output you are currently reading.
4. The Docker daemon streamed that output to the Docker client, which sent it
   to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
$ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
https://hub.docker.com/

For more examples and ideas, visit:
https://docs.docker.com/get-started/

INSTALLING kind
% Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
Dload  Upload   Total   Spent    Left  Speed
100    98  100    98    0     0    267      0 --:--:-- --:--:-- --:--:--   267
100   624  100   624    0     0   1116      0 --:--:-- --:--:-- --:--:--  1116
100 6660k  100 6660k    0     0  5931k      0  0:00:01  0:00:01 --:--:-- 15.7M
INSTALLING terraform
Loaded plugins: extras_suggestions, langpacks, priorities, update-motd
Existing lock /var/run/yum.pid: another copy is running as pid 25715.
Another app is currently holding the yum lock; waiting for it to exit...
The other application is: yum
Memory : 194 M RSS (410 MB VSZ)
Started: Mon Aug 16 19:23:47 2021 - 00:07 ago
State  : Running, pid: 25715
Another app is currently holding the yum lock; waiting for it to exit...
The other application is: yum
Memory : 298 M RSS (514 MB VSZ)
Started: Mon Aug 16 19:23:47 2021 - 00:09 ago
State  : Running, pid: 25715
Another app is currently holding the yum lock; waiting for it to exit...
The other application is: yum
Memory : 316 M RSS (532 MB VSZ)
Started: Mon Aug 16 19:23:47 2021 - 00:11 ago
State  : Running, pid: 25715
Another app is currently holding the yum lock; waiting for it to exit...
The other application is: yum
Memory : 316 M RSS (532 MB VSZ)
Started: Mon Aug 16 19:23:47 2021 - 00:13 ago
State  : Running, pid: 25715
242 packages excluded due to repository priority protections
Resolving Dependencies
--> Running transaction check
---> Package terraform.x86_64 0:1.0.4-1 will be installed
--> Finished Dependency Resolution

Dependencies Resolved

==========================================================================================================================================
Package                           Arch                           Version                         Repository                         Size
==========================================================================================================================================
Installing:
terraform                         x86_64                         1.0.4-1                         hashicorp                          25 M

Transaction Summary
==========================================================================================================================================
Install  1 Package

Total download size: 25 M
Installed size: 75 M
Downloading packages:
terraform-1.0.4-1.x86_64.rpm                                                                                       |  25 MB  00:00:00
Running transaction check
Running transaction test
Transaction test succeeded
Running transaction
Installing : terraform-1.0.4-1.x86_64                                                                                               1/1
Verifying  : terraform-1.0.4-1.x86_64                                                                                               1/1

Installed:
terraform.x86_64 0:1.0.4-1

Complete!
INSTALLING eksctl
INSTALLING kubectl
% Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
Dload  Upload   Total   Spent    Left  Speed
100 44.2M  100 44.2M    0     0  90.4M      0 --:--:-- --:--:-- --:--:-- 90.3M
INSTALLING helm
```
{{% /expand%}}


Now since EKS takes about 20 mins to create a cluster we need to start that now so it's ready when we need it. 

```bash
~/environment/devsecopspipeline (master) $ make cluster
eksctl create cluster -f eks-config.yml
2021-09-11 21:58:05 [ℹ]  eksctl version 0.61.0
2021-09-11 21:58:05 [ℹ]  using region us-west-2
2021-09-11 21:58:05 [ℹ]  setting availability zones to [us-west-2d us-west-2c us-west-2a]
2021-09-11 21:58:05 [ℹ]  subnets for us-west-2d - public:192.168.0.0/19 private:192.168.96.0/19
2021-09-11 21:58:05 [ℹ]  subnets for us-west-2c - public:192.168.32.0/19 private:192.168.128.0/19
2021-09-11 21:58:05 [ℹ]  subnets for us-west-2a - public:192.168.64.0/19 private:192.168.160.0/19
2021-09-11 21:58:05 [ℹ]  nodegroup "node-group-1" will use "ami-0bb07d9c8d6ca41e8" [AmazonLinux2/1.21]
2021-09-11 21:58:05 [ℹ]  using Kubernetes version 1.21
2021-09-11 21:58:05 [ℹ]  creating EKS cluster "devsecops" in "us-west-2" region with un-managed nodes
2021-09-11 21:58:05 [ℹ]  1 nodegroup (node-group-1) was included (based on the include/exclude rules)
2021-09-11 21:58:05 [ℹ]  will create a CloudFormation stack for cluster itself and 1 nodegroup stack(s)
2021-09-11 21:58:05 [ℹ]  will create a CloudFormation stack for cluster itself and 0 managed nodegroup stack(s)
2021-09-11 21:58:05 [ℹ]  if you encounter any issues, check CloudFormation console or try 'eksctl utils describe-stacks --region=us-west-2 --cluster=devsecops'
2021-09-11 21:58:05 [ℹ]  CloudWatch logging will not be enabled for cluster "devsecops" in "us-west-2"
2021-09-11 21:58:05 [ℹ]  you can enable it with 'eksctl utils update-cluster-logging --enable-types={SPECIFY-YOUR-LOG-TYPES-HERE (e.g. all)} --region=us-west-2 --cluster=devsecops'
2021-09-11 21:58:05 [ℹ]  Kubernetes API endpoint access will use default of {publicAccess=true, privateAccess=false} for cluster "devsecops" in "us-west-2"
2021-09-11 21:58:05 [ℹ]  2 sequential tasks: { create cluster control plane "devsecops", 3 sequential sub-tasks: { wait for control plane to become ready, 1 task: { create addons }, create nodegroup "node-group-1" } }
2021-09-11 21:58:05 [ℹ]  building cluster stack "eksctl-devsecops-cluster"
2021-09-11 21:58:06 [ℹ]  deploying stack "eksctl-devsecops-cluster"
```
