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

**Consistency**  - Run the same commands no matter where you are: Linux, macOS, Windows, CI/CD tools that supports Docker like GitHub Actions, Travis CI, CircleCI, and GitLab CI.

**Control** - Take control of languages, versions, and tools you need, and version source control your pipelines with your preferred VCS like GitHub and GitLab.

**Confidence** - Test your code and pipelines locally before your CI/CD tool runs it. Feel confident that if it works locally, it will work in your CI/CD server.

# Exercise

In this simple exercise were going to use Docker compose, make to start a simple docker echo container. 

{{%attachments title="3M Example" /%}}

`cd ~/environment/aws-container-devsecops/content/development/3-musketeers.files/`

`make echo`

```bash
$/environment/aws-container-devsecops/content/development/3-musketeers.files (main) $ make echo
docker-compose run --rm alpine echo 'Hello, World!'
Creating network "3-musketeersfiles_default" with the default driver
Pulling alpine (alpine:)...
latest: Pulling from library/alpine
59bf1c3509f3: Pull complete
Digest: sha256:21a3deaa0d32a8057914f36584b5288d2e5ecc984380bc0118285c70fa8c9300
Status: Downloaded newer image for alpine:latest
Creating 3-musketeersfiles_alpine_run ... done
Hello, World!
```

Make sure this works it will build on our next exercises! 