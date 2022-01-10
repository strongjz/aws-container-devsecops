---
title: "Pre Commit"
date: 2021-08-17T15:08:20-04:00
weight: 24
---

## Introduction

The pre-commit hook is run first, before you even type in a commit message. It’s used to inspect the snapshot that’s about to be committed,

It can be used to detect

- missing semicolons
- trailing whitespace
- debug statements
- aws credentials
- private keys 

Pre-commit is a framework for managing and maintaining multi-language pre-commit hooks.

https://github.com/pre-commit/pre-commit

- detect-aws-credentials - Checks for the existence of AWS secrets that you have set up with the AWS CLI. The following arguments are available
- detect-private-key - Checks for the existence of private keys.
- check-xml - This hook checks xml files for parseable syntax.
- check-yaml - This hook checks yaml files for parseable syntax.
- check-json - This hook checks json files for parseable syntax.
- check-shebang-scripts-are-executable - Ensures that (non-binary) files with a shebang are executable.
- pretty-format-json - This hook sets a standard for formatting JSON files.
- check-merge-conflict - Check for files that contain merge conflict strings.


# Exercise 

## Install

`pip install pre-commit`

```bash
pre-commit installed at .git/hooks/pre-commit
pre-commit --version
pre-commit 1.21.0
```

## Configure

We have already created the .pre-commit-config.yaml in the Files directory

`cat ~/environment/aws-container-devsecops/content/development/development.files/.pre-commit-config.yaml`

```yaml
repos:
-   repo: https://github.com/pre-commit/pre-commit-hooks
    rev: v2.3.0
    hooks:
    -   id: detect-private-key
```

## Test

```bash
cd ~/environment/aws-container-devsecops/content/development.files
```

Using the pre-commit hook cli we can run the checks and see that the commit would fail. `pre-commit run --all-files`

```bash
Detect Private Key.......................................................Failed
- hook id: detect-private-key
- exit code: 1

Private key found: content/development/development.files/secret.yaml
```