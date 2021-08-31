---
title: "3 Musketeers"
date: 2021-08-17T15:08:14-04:00
weight: 25
---

![3-musketeers](/images/development/3-musketeers.jpg)

Tools used in the 3 Musketeers pattern: 
* Make
* Docker
* Docker Compose

From https://3musketeers.io/

**Consistency**  - Run the same commands no matter where you are: Linux, MacOS, Windows, CI/CD tools that supports Docker like GitHub Actions, Travis CI, CircleCI, and GitLab CI.

**Control** - Take control of languages, versions, and tools you need, and version source control your pipelines with your preferred VCS like GitHub and GitLab.

**Confidence** - Test your code and pipelines locally before your CI/CD tool runs it. Feel confident that if it works locally, it will work in your CI/CD server.

{{%attachments title="3M Example" /%}}

```bash
:~/environment $ cd ~/environment/aws-container-devsecops/content/development/3-musketeers.files/

:~/environment $ make echo
docker-compose run --rm alpine echo 'Hello, World!'
[+] Running 1/1
 ⠿ Network 3-musketeersfiles_default  Created                                                                                                                                                                                                                                                                      0.4s
[+] Running 2/2
 ⠿ alpine Pulled                                                                                                                                                                                                                                                                                                   4.7s
   ⠿ a0d0a0d46f8b Pull complete                                                                                                                                                                                                                                                                                    2.9s
Hello, World!
:~/environment $
```