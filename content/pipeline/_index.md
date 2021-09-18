---
title: Container Pipeline
weight: 40
---

## Running Rules for CI/CD

- Maintain a code repository
- Automate the build
- Keep the build fast
- Make the build self-testing
- Commit early, commit often
- Every commit to the mainline gets built
- Everyone can see the results of the build
- Automate the deployment

## Things to Secure the Container Pipeline

- Secure Pipelines
- Image scanning
- Signed Images
- Verify Trusted Images
- Kickoff Security Assessment


## AWS CI/CD 

We are going to deploy a pipeline with AWS Services

**Build** - Build our golang example applications, in a docker container and stores it in the AWS ECR

**Invoke** - Runs the Go Report Static Code analysis

**Test** - runs any tests in the golang example applications

**Deploy** - deploys the application via Code build, aws eks cli and kubectl
