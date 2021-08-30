---
title: "Linting"
date: 2021-08-17T15:07:57-04:00
weight: 22
---

Linting is the process of analyzing code for syntax issues; it can aid in finding bugs and performance issues, offers simplifications, and enforces style rules.

Other notable uses for Linting:

- formatting discrepancy, go fmt.
- non-adherence to coding standards and conventions, shellchecker for example
- diagnosing possible logical errors in your applications. go vet
- Interpreted languages like Python, Ruby, and JavaScript benefit from linting, as these languages don’t have a compiling phase to display errors before execution.


Here is great collection of Linters for many languages

https://github.com/collections/clean-code-linters


My go to everyday linters

https://github.com/koalaman/shellcheck

![](/images/development/shellcheck.png)

Some languages like go have them builtin

```bash
 2021-08-24 09:47:02 ⌚  strongjz-macbook in ~/Documents/code/go/src/github.com/strongjz/go_example_app
± |master ✓| → go vet
go: downloading github.com/gin-gonic/gin v1.6.2
go: downloading github.com/gin-contrib/sse v0.1.0
go: downloading github.com/ugorji/go v1.1.7
go: downloading github.com/golang/protobuf v1.3.3
go: downloading golang.org/x/sys v0.0.0-20200116001909-b77594299b42
go: downloading github.com/go-playground/validator/v10 v10.2.0
go: downloading github.com/ugorji/go/codec v1.1.7
go: downloading github.com/leodido/go-urn v1.2.0
```

```bash
$ go doc cmd/vet
Vet examines Go source code and reports suspicious constructs, such as
Printf calls whose arguments do not align with the format string. Vet uses
heuristics that do not guarantee all reports are genuine problems, but it
can find errors not caught by the compilers.

It can be invoked three ways:

By package, from the go tool:

    go vet package/path/name

vets the package whose path is provided.

By files:

    go tool vet source/directory/*.go
  :
  ```

For Dockerfiles we can use tools like [hadolint](https://github.com/hadolint/hadolint)

```bash
:~/environment $ docker run --rm -i hadolint/hadolint:v2.7.0 < ./content/development/development.files/Dockerfile
-:1 DL3006 warning: Always tag the version of an image explicitly
-:2 DL3015 info: Avoid additional packages by specifying `--no-install-recommends`
-:2 DL3009 info: Delete the apt-get lists after installing something
-:2 SC2154 warning: node_verion is referenced but not assigned (did you mean 'node_version'?).
-:4 DL3045 warning: `COPY` to a relative destination without `WORKDIR` set.
-:5 DL3003 warning: Use WORKDIR to switch to a directory
-:5 DL3016 warning: Pin versions in npm. Instead of `npm install <package>` use `npm install <package>@<version>`
-:8 DL3011 error: Valid UNIX ports range from 0 to 65535
```

