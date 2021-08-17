---
title: Container Pipeline
weight: 40
---

{{% children  %}}


Automating your build pipelines
Visibility
Troubleshooting
Defect Remediation
Build small autonomous pieces

CI/CD
Maintain a code repository
Automate the build
Keep the build fast
Make the build self-testing
Commit early, commit often
Every commit gets built
Everyone can see the results of the build
Automate the deployment

Secure Pipelines
Signed Images
Verify Trusted Images
Kickoff Security Assessment


CI/CD - AWS Codepipeline/Build
Stages for Code pipeline

Build - Build golang example applications, in a docker container and stores it in the AWS ECR

Invoke - Runs the Go Report Static Code analysis

Test - runs any tests in the golang example applications

Deploy - deploys the application via Code build, aws eks cli and kubectl