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