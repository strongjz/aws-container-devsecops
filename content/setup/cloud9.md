---
title: AWS Cloud9
weight: 11
---


{{% notice info %}}
A list of supported browsers for AWS Cloud9 is found [here]( https://docs.aws.amazon.com/cloud9/latest/user-guide/browsers.html).
{{% /notice %}}

1. Log into your AWS Account

2. Launch Cloud9 in your closest region

   Create a Cloud9 Environment: https://us-west-2.console.aws.amazon.com/cloud9/home?region=us-west-2

   You'll be prompt to log into your AWS Account in order to provision a Cloud9 Workspace

![cloud9step_0](/images/setup/cloud9_step0_create.png)

3. Configure the Cloud9 instance

![cloud9_step1](/images/setup/cloud9_step1_name.png)

4. Review the setup before submitting for creation

{{% notice warning %}}
Make sure to choose Amazon Linux 2, the tools install and other commands have been set up for Amazon Linux Only.  
{{% /notice %}}

![cloud9_step2_configure](/images/setup/cloud9_step2_configure.png)

5. Wait for the Cloud9 instance to boot

![cloud9_step3_review](/images/setup/cloud9_step3_review.png)

6. Increase disk size for your Cloud9 Instance

Increase the disk size of your instances, this will cause your instance to reboot

With the docker images and all the other information it would be helpful to have a larger working space.

```bash
yum install -y jq
export AWS_DEFAULT_REGION=$(curl --silent http://169.254.169.254/latest/dynamic/instance-identity/document | jq -r .region)
export instance_id=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)
export vol_id=$(aws ec2 describe-instances --instance-id $instance_id --query 'Reservations[0].Instances[0].BlockDeviceMappings[0].Ebs.VolumeId' --output text)
aws ec2 modify-volume --size 100 --volume-id $vol_id
sudo reboot

```

This will force a reboot of your Cloud9 instance

Double check it was successful 

```bash
$ df -h
Filesystem      Size  Used Avail Use% Mounted on
devtmpfs        3.8G     0  3.8G   0% /dev
tmpfs           3.8G     0  3.8G   0% /dev/shm
tmpfs           3.8G  424K  3.8G   1% /run
tmpfs           3.8G     0  3.8G   0% /sys/fs/cgroup
/dev/nvme0n1p1  100G  8.2G   92G   9% /
tmpfs           768M     0  768M   0% /run/user/1000
```

![cloud9_reboot](/images/setup/cloud9_reboot.png)
