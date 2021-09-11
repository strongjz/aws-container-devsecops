---
title: Container Builds
weight: 30
---

- One process per container
```yaml
CMD ["nginx", "-g", "daemon off;"]
```
- Run with local user
```yaml
FROM alpine:3.14.2
RUN groupadd -r swuser -g 433 && \
    useradd -u 431 -r -g swuser -s /sbin/nologin -c "Docker image user" swuser
USER root
RUN apk update && apk upgrade
RUN apk add --update curl && \
rm -rf /var/cache/apk/*
USER swuser
```

- Write logs to stdout & stderr
- Leverage environment variables
```bash
docker run -e MYVAR1 --env MYVAR2=foo --env-file ./env.list ubuntu bash
```
- Config 
  - Separating environmental concerns
  - Use environment variables to define runtime parameters, as opposed to hard config files.
  - Mount configuration files

- Secrets – Application secrets should be instantiated at run-time.



