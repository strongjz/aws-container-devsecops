---
title: Cloud 9 Settings Configuration 
weight: 12
---

# Create IAM Role 
1. Log into your AWS Account you are using for this workshop.
2. Follow this [link to create an IAM role with Administrator access.](https://console.aws.amazon.com/iam/home#/roles$new?step=type&commonUseCase=EC2%2BEC2&selectedUseCase=EC2&policies=arn:aws:iam::aws:policy%2FAdministratorAccess&roleName=devsecops-workshop-admin)

3. Confirm that AWS service and EC2 are selected, then click Next: Permissions to view permissions.
![cloud9create](/images/setup/cloud9_role_1_create.png)
4. Confirm that AdministratorAccess is checked, then click Next: Tags to assign tags.
![cloud9create](/images/setup/cloud9_role_2_permissions.png)
5. Take the defaults, and click Next: Review to review.
![cloud9create](/images/setup/cloud9_role_3_tag.png)
7. Enter devsecop-workshop-admin for the Name, and click Create role.
![cloud9create](/images/setup/cloud9_role_4_review.png)

# Attach IAM Role to your Cloud9 instance 

1. Click the grey circle button (in top right corner) and select Manage EC2 Instance
![cloud9create](/images/setup/cloud9_console_change_instance.png)
2. Select the instance, then choose Actions / Security / Modify IAM Role
![cloud9create](/images/setup/cloud9_instance_settings_iam.png)  
3. Choose devsecop-workshop-admin from the IAM Role dropdown, and select Save
![cloud9create](/images/setup/cloud9_modify_iam_console.png)



# Update Cloud9 IAM Settings 

Return to your Cloud9 workspace and click the gear icon (in top right corner)

1. Open Project Settings
2. Select AWS SETTINGS
3. Turn off AWS managed temporary credentials

Let's make sure we have the right settings with the AWS CLI. 

To ensure temporary credentials aren’t already in place we will also remove any existing credentials file:

`rm -vf ${HOME}/.aws/credentials`

Use the [GetCallerIdentity CLI command](https://docs.aws.amazon.com/cli/latest/reference/sts/get-caller-identity.html) to validate that the Cloud9 IDE is using the correct IAM role.

`aws sts get-caller-identity --query Arn | grep devsecops-workshop-admin -q && echo "IAM role valid" || echo "IAM role NOT valid"`

![cloud9create](/images/setup/cloud9_verify_iam_cli.png)

# Change EC2 Instance Settings 
1. Open Project Settings
2. Select EC2 Instance 
3. Change Stop my environment to a day. 

![cloud9create](/images/setup/cloud9_stop_ec2.png)

