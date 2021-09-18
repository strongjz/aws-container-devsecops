---
title: Conclusion
weight: 60
---

{{% children  %}}

CI/CD

- Maintain a code repository - AWS CodeCommit
- Automate the build - AWS CodePipeline
- Keep the build fast
- Make the build self-testing - AWS CodeBuild
- Commit early, commit often
- Every commit to the mainline gets built
- Everyone can see the results of the build
- Automate the deployment - AWS CodeBuild

Security

- Immutable artifacts - AWS ECR 
- Static Code Analysis - GoSec or other related tools 
- CVE Scanning - AWS ECR
- Least Privileged - Docker and Pod Security settings
- Network Isolation - Network Policies
- Run Time protection - Falco
- Signed Commits - Git and PGP 
- Signed Images - Docker Notary and SigStore cosign


https://d0.awsstatic.com/whitepapers/DevOps/practicing-continuous-integration-continuous-delivery-on-AWS.pdf

https://aws.amazon.com/macie/

https://aws.amazon.com/security-hub/
