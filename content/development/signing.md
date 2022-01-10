---
title: "Git Commit Signing"
date: 2021-08-17T15:07:49-04:00
weight: 21
---

Needed:
* GPG Key
* Github Account

# Generating a GPG Key
1. Generate a key with gpg ```gpg --gen-key```
3. Select what key you want to use
4. Select what elliptic curve you want
5. Fill out your name and your email address. Make sure this matches the one in your GitHub account.
6. Add a comment if you want to remind you what the key is for.
7. You may be prompted for a passphrase to add to the key for extra security

Here is what the prompts will look like.
{{%expand "Expand here is what it looks like in its entirety" %}}
```bash
± |main U:26 ?:9 ✗| → gpg --gen-key
gpg (GnuPG) 2.3.1; Copyright (C) 2021 Free Software Foundation, Inc.
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.

Please select what kind of key you want:
   (1) RSA and RSA
   (2) DSA and Elgamal
   (3) DSA (sign only)
   (4) RSA (sign only)
   (9) ECC (sign and encrypt) *default*
  (10) ECC (sign only)
  (14) Existing key from card
Your selection? 9
Please select which elliptic curve you want:
   (1) Curve 25519 *default*
   (4) NIST P-384
   (6) Brainpool P-256
Your selection? 1
Please specify how long the key should be valid.
         0 = key does not expire
      <n>  = key expires in n days
      <n>w = key expires in n weeks
      <n>m = key expires in n months
      <n>y = key expires in n years
Key is valid for? (0) 0
Key does not expire at all
Is this correct? (y/N) y

GnuPG needs to construct a user ID to identify your key.

Real name: James Strong
Email address: strong.james.e@gmail.com
Comment: testing for workshop
You selected this USER-ID:
    "James Strong (testing for workshop) <strong.james.e@gmail.com>"

Change (N)ame, (C)omment, (E)mail or (O)kay/(Q)uit? O
We need to generate a lot of random bytes. It is a good idea to perform
some other action (type on the keyboard, move the mouse, utilize the
disks) during the prime generation; this gives the random number
generator a better chance to gain enough entropy.
We need to generate a lot of random bytes. It is a good idea to perform
some other action (type on the keyboard, move the mouse, utilize the
disks) during the prime generation; this gives the random number
generator a better chance to gain enough entropy.
gpg: key 8246A1EC900B5E30 marked as ultimately trusted
gpg: directory '/Users/strongjz/.gnupg/openpgp-revocs.d' created
gpg: revocation certificate stored as '/Users/strongjz/.gnupg/openpgp-revocs.d/3E0424931246D33A86890BC78246A1EC900B5E30.rev'
public and secret key created and signed.

pub   ed25519 2021-08-17 [SC]
      3E0424931246D33A86890BC78246A1EC900B5E30
uid                      James Strong (testing for workshop) <strong.james.e@gmail.com>
sub   cv25519 2021-08-17 [E]
```
{{% /expand%}}

# Added it to GitHub Account

## 1. Export public key

Get the Key ID with `gpg --list-keys $EMAIL`

Export the public key with `gpg --armor --export 3E0424931246D33A86890BC78246A1EC900B5E30`

```bash
-----BEGIN PGP PUBLIC KEY BLOCK-----

mDMEYRwLhBYJKwYBBAHaRw8BAQdAsQbWuqV2P5y1HXlkoFTM9qyrypc+zB9YO/fI
DYAjZ6C0PkphbWVzIFN0cm9uZyAodGVzdGluZyBmb3Igd29ya3Nob3ApIDxzdHJv
bmcuamFtZXMuZUBnbWFpbC5jb20+iJQEExYKADwWIQQ+BCSTEkbTOoaJC8eCRqHs
kAteMAUCYRwLhAIbAwULCQgHAgMiAgEGFQoJCAsCBBYCAwECHgcCF4AACgkQgkah
7JALXjDeKgEA1JtsGyIEg8ZUANvkbJfdNEs2e1Ns/M3PcRYMUxc1yugA/3tHEDJb
Fw+QghwzcHXWsqlkAmj5TZglHyfYsbwlgzoLuDgEYRwLhBIKKwYBBAGXVQEFAQEH
QGg2S81eJftEiG4AeiKC3D6H94y1ifSuTZ6BBofcilsTAwEIB4h4BBgWCgAgFiEE
PgQkkxJG0zqGiQvHgkah7JALXjAFAmEcC4QCGwwACgkQgkah7JALXjCVgwD+Ob4+
fG5zzmP/Hg13SFsxLZc+5EKrxHJ1z+bNQQ5ARxYBANbOuPnxLtPL4eY4TqIY0k1X
8HmXv9JXEwMHLYiN4fwF
=03gp
-----END PGP PUBLIC KEY BLOCK-----
```

## 2. Add to Github

Open https://github.com/settings/keys

![sign_add_key](/images/development/sign_account_add.png)

Copy and Paste the Public Key into your GitHub account

![sign_add_key](/images/development/sign_add_new_key.png)

## 3. Add to git config

Get the key id for the one we just created.

```bash
$ gpg --list-secret-keys --keyid-format LONG $EMAIL

sec   ed25519/8246A1EC900B5E30 2021-08-17 [SC]
      3E0424931246D33A86890BC78246A1EC900B5E30
uid                 [ultimate] James Strong (testing for workshop) <strong.james.e@gmail.com>
ssb   cv25519/0BAFF11345FB8338 2021-08-17 [E]
```

Update git config to use the key.
```bash
$ git config --global user.signingkey 3E0424931246D33A86890BC78246A1EC900B5E30
$ git config --global commit.gpgsign true
```

## 4. Test a Commit.

```bash
cd ~/environment/
mkdir signing-test
git init
  Initialized empty Git repository in /home/ec2-user/environment/signing-test/.git/
echo "signing-test" >> README.md
git add -A
git commit -m "signing"
  [main b2a6fb5] signing
git push origin master 
```

## 5. Verify in GitHub

In the commit history you can see a "Verified" tag on your commits now

![sign_add_key](/images/development/sign_verify.png)


{{% notice warning %}}
Make sure to store this GPG private key in a secure location
{{% /notice  %}}

## 6. Store GPG key (optional)

To export the key use this.

Identify your private key: ```gpg --list-secret-keys $EMAIL```

```bash
sec   ed25519 2021-08-17 [SC]
      3E0424931246D33A86890BC78246A1EC900B5E30
uid           [ultimate] James Strong (testing for workshop) <strong.james.e@gmail.com>
ssb   cv25519 2021-08-17 [E]
```

Run this command to export your key: ```gpg --export-secret-keys 3E0424931246D33A86890BC78246A1EC900B5E30 > private.key```

If you have a passphrase on the key you'll have to enter it to export it.

Copy the key file to another secure location.

To import on a new machine, run `gpg --import private.key`

Sources:

Using Keybase: https://github.com/pstadler/keybase-gpg-github

Plain GPG: https://docs.github.com/en/github/authenticating-to-github/managing-commit-signature-verification/generating-a-new-gpg-key
