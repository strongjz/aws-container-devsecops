---
title: Container Pipeline Exercise Overview
weight: 48
---

## AWS CI/CD

We are going to deploy a pipeline with AWS Services

**Static** - Build our golang example applications, in a docker container and stores it in the AWS ECR

**Build** - Runs the Go Report Static Code analysis

**Deploy** - deploys the application via Code build, aws eks cli and kubectl

![](/images/pipeline/aws-codepipeline.svg)
