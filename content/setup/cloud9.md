---
title: AWS Cloud9
weight: 11
---


{{% notice info %}}
A list of supported browsers for AWS Cloud9 is found [here]( https://docs.aws.amazon.com/cloud9/latest/user-guide/browsers.html).
{{% /notice %}}

1. Launch Cloud9 in your closest region

   Create a Cloud9 Environment: https://us-west-2.console.aws.amazon.com/cloud9/home?region=us-west-2

   You'll be prompt to log into your AWS Account in order to provision a Cloud9 Workspace

![cloud9create](images/setup/cloud9_step0_create.png)

2. Configure the Cloud9 instance

![cloud9create](images/setup/cloud9_step1_name.png)

3. Review the setup before submitting for creation

![cloud9create](images/setup/cloud9_step2_configure.png)

4. Wait for the Cloud9 instance to boot

![cloud9create](images/setup/cloud9_step3_review.png)

5. Increase disk size for your Cloud9 Instance 

Increase the disk size of your instances, this will cause your instance to reboot

With the docker images and all the other information it would be helpful to have a larger working space. 

```bash
pip3 install --user --upgrade boto3
export instance_id=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)
python -c "import boto3
import os
from botocore.exceptions import ClientError 
ec2 = boto3.client('ec2')
volume_info = ec2.describe_volumes(
    Filters=[
        {
            'Name': 'attachment.instance-id',
            'Values': [
                os.getenv('instance_id')
            ]
        }
    ]
)
volume_id = volume_info['Volumes'][0]['VolumeId']
try:
    resize = ec2.modify_volume(    
            VolumeId=volume_id,    
            Size=30
    )
    print(resize)
except ClientError as e:
    if e.response['Error']['Code'] == 'InvalidParameterValue':
        print('ERROR MESSAGE: {}'.format(e))"
if [ $? -eq 0 ]; then
    sudo reboot
fi
```

This will force a reboot of your Cloud9 instance 

![cloud9create](images/setup/cloud9_reboot.png)
