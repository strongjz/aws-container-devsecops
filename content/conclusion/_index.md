---
title: Conclusion
weight: 60
---

## CI/CD

- Maintain a code repository - AWS CodeCommit
- Automate the build - AWS CodePipeline
- Keep the build fast
- Make the build self-testing - AWS CodeBuild
- Commit early, commit often
- Every commit to the mainline gets built
- Everyone can see the results of the build
- Automate the deployment - AWS CodeBuild

## Security

- Immutable artifacts - AWS ECR 
- Static Code Analysis - GoSec or other related tools 
- CVE Scanning - AWS ECR
- Least Privileged - Docker and Pod Security settings
- Network Isolation - Network Policies
- Run Time protection - Falco
- Signed Commits - Git and GPG 
- Signed Images - Docker Notary and SigStore cosign


## Additional AWS Resources 

[Practicing CI/CD on AWS Whitepaper](https://d0.awsstatic.com/whitepapers/DevOps/practicing-continuous-integration-continuous-delivery-on-AWS.pdf)

[AWS Macie - ML Security](https://aws.amazon.com/macie/)

[AWS Security Hub](https://aws.amazon.com/security-hub/)

Additional Container Workshops

https://containersonaws.com/

https://www.eksworkshop.com/010_introduction/

https://containersfromthecouch.com/

