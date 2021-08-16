---
title: Workshop tools
weight: 12
---

In order for us to continue with the exercises, there are several tools that our needed to be installed on our Cloud9 instance. 

You can download the entire repo with git 

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


Navigate to where you downloaded the install script. 

`cd aws-container-devsecops/content/setup/clone.files/`

`sudo ./tools-install.sh`

