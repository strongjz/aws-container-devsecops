---
title: Secure Containers Exercise
weight: 32
---

In this Exercise we are going to 

1. Run Application locally
2. Run in Docker compose
3. Go Reporter for static Analysis 
4. Go Sec for code cve scanning 
5. Secure Dockerfile 

{{% notice info %}}
You may need to start docker
{{% /notice %}}

`sudo service docker start`

```bash
Redirecting to /bin/systemctl start docker.service
```

Navigate to DevSecops repo `cd ~/environment/devsecopspipeline`

Set a temp password for the local database

`export DB_PASSWORD=temppassword`

## 1. Run locally

Run the Golang tests locally 

`make test`

Now we can run the application locally
`make run`

{{% expand%}}
```bash
env GIT_TERMINAL_PROMPT=1 go get -d -v .
github.com/strongjz/go_example_app (download)
created GOPATH=/home/ec2-user/go; see 'go help gopath'
github.com/gin-gonic/gin (download)
github.com/gin-contrib/sse (download)
github.com/go-playground/validator (download)
github.com/go-playground/universal-translator (download)
github.com/go-playground/locales (download)
github.com/leodido/go-urn (download)
get "golang.org/x/crypto/sha3": found meta tag get.metaImport{Prefix:"golang.org/x/crypto", VCS:"git", RepoRoot:"https://go.googlesource.com/crypto"} at //golang.org/x/crypto/sha3?go-get=1
get "golang.org/x/crypto/sha3": verifying non-authoritative meta tag
golang.org/x/crypto (download)
get "golang.org/x/text/language": found meta tag get.metaImport{Prefix:"golang.org/x/text", VCS:"git", RepoRoot:"https://go.googlesource.com/text"} at //golang.org/x/text/language?go-get=1
get "golang.org/x/text/language": verifying non-authoritative meta tag
golang.org/x/text (download)
github.com/ugorji/go (download)
get "google.golang.org/protobuf/proto": found meta tag get.metaImport{Prefix:"google.golang.org/protobuf", VCS:"git", RepoRoot:"https://go.googlesource.com/protobuf"} at //google.golang.org/protobuf/proto?go-get=1
get "google.golang.org/protobuf/proto": verifying non-authoritative meta tag
google.golang.org/protobuf (download)
get "gopkg.in/yaml.v2": found meta tag get.metaImport{Prefix:"gopkg.in/yaml.v2", VCS:"git", RepoRoot:"https://gopkg.in/yaml.v2"} at //gopkg.in/yaml.v2?go-get=1
gopkg.in/yaml.v2 (download)
github.com/mattn/go-isatty (download)
get "golang.org/x/sys/unix": found meta tag get.metaImport{Prefix:"golang.org/x/sys", VCS:"git", RepoRoot:"https://go.googlesource.com/sys"} at //golang.org/x/sys/unix?go-get=1
get "golang.org/x/sys/unix": verifying non-authoritative meta tag
golang.org/x/sys (download)
github.com/lib/pq (download)
go run main.go
Starting App
Starting App Engine
[GIN-debug] [WARNING] Running in "debug" mode. Switch to "release" mode in production.
- using env:   export GIN_MODE=release
- using code:  gin.SetMode(gin.ReleaseMode)

[GIN-debug] GET    /                         --> github.com/strongjz/go_example_app/app.rootHandler (3 handlers)
[GIN-debug] GET    /ping                     --> github.com/strongjz/go_example_app/app.pingHandler (3 handlers)
[GIN-debug] GET    /data                     --> github.com/strongjz/go_example_app/app.dataHandler (3 handlers)
[GIN-debug] GET    /secret                   --> github.com/strongjz/go_example_app/app.secretHandler (3 handlers)
[GIN-debug] GET    /host                     --> github.com/strongjz/go_example_app/app.hostHandler (3 handlers)
[GIN-debug] GET    /external                 --> github.com/strongjz/go_example_app/app.externalHandler (3 handlers)
[GIN-debug] Environment variable PORT="8080"
[GIN-debug] Listening and serving HTTP on :8080
[GIN-debug] [ERROR] listen tcp :8080: bind: address already in use
~/environment/devsecopspipeline (master) $ make run
env GIT_TERMINAL_PROMPT=1 go get -d -v .
go run main.go
Starting App
Starting App Engine
[GIN-debug] [WARNING] Running in "debug" mode. Switch to "release" mode in production.
- using env:   export GIN_MODE=release
- using code:  gin.SetMode(gin.ReleaseMode)

[GIN-debug] GET    /                         --> github.com/strongjz/go_example_app/app.rootHandler (3 handlers)
[GIN-debug] GET    /ping                     --> github.com/strongjz/go_example_app/app.pingHandler (3 handlers)
[GIN-debug] GET    /data                     --> github.com/strongjz/go_example_app/app.dataHandler (3 handlers)
[GIN-debug] GET    /secret                   --> github.com/strongjz/go_example_app/app.secretHandler (3 handlers)
[GIN-debug] GET    /host                     --> github.com/strongjz/go_example_app/app.hostHandler (3 handlers)
[GIN-debug] GET    /external                 --> github.com/strongjz/go_example_app/app.externalHandler (3 handlers)
[GIN-debug] Environment variable PORT="8080"
[GIN-debug] Listening and serving HTTP on :8080
```
{{% /expand%}}

Test 

In a new terminal test the application `cd ~/environment/devsecopspipeline`. 

The `make run` just runs the golang app and not the database

`make test_local`
```bash
~/environment/devsecopspipeline (master) $ curl localhost:8080/
{"message":"Default Page"}
~/environment/devsecopspipeline (master) $ curl localhost:8080/data
{"message":"DB is not connected"}
```

## 2. Running in Docker Compose 

{{% notice info %}}
Update Makefile NAME with your name or some unique identifier. 
{{% /notice %}}

Stop the local `make run` and run the app with compose

`make compose_up`

{{% expand%}}
```bash
docker-compose up
Recreating devsecopspipeline_db_1 ... done
Recreating devsecopspipeline_go-example_1 ... done
Attaching to devsecopspipeline_db_1, devsecopspipeline_go-example_1
db_1          | The files belonging to this database system will be owned by user "postgres".
db_1          | This user must also own the server process.
db_1          | 
db_1          | The database cluster will be initialized with locale "en_US.utf8".
db_1          | The default database encoding has accordingly been set to "UTF8".
db_1          | The default text search configuration will be set to "english".
db_1          | 
db_1          | Data page checksums are disabled.
db_1          | 
db_1          | fixing permissions on existing directory /var/lib/postgresql/data ... ok
db_1          | creating subdirectories ... ok
db_1          | selecting dynamic shared memory implementation ... posix
db_1          | selecting default max_connections ... 100
db_1          | selecting default shared_buffers ... 128MB
db_1          | selecting default time zone ... Etc/UTC
db_1          | creating configuration files ... ok
db_1          | running bootstrap script ... ok
db_1          | performing post-bootstrap initialization ... ok
db_1          | syncing data to disk ... ok
db_1          | 
db_1          | initdb: warning: enabling "trust" authentication for local connections
db_1          | You can change this by editing pg_hba.conf or using the option -A, or
db_1          | --auth-local and --auth-host, the next time you run initdb.
db_1          | 
db_1          | Success. You can now start the database server using:
db_1          | 
db_1          |     pg_ctl -D /var/lib/postgresql/data -l logfile start
db_1          | 
db_1          | waiting for server to start....2021-09-11 22:16:05.430 UTC [47] LOG:  starting PostgreSQL 12.2 (Debian 12.2-2.pgdg100+1) on x86_64-pc-linux-gnu, compiled by gcc (Debian 8.3.0-6) 8.3.0, 64-bit
db_1          | 2021-09-11 22:16:05.432 UTC [47] LOG:  listening on Unix socket "/var/run/postgresql/.s.PGSQL.5432"
db_1          | 2021-09-11 22:16:05.455 UTC [48] LOG:  database system was shut down at 2021-09-11 22:16:05 UTC
db_1          | 2021-09-11 22:16:05.460 UTC [47] LOG:  database system is ready to accept connections
go-example_1  | Starting App
go-example_1  | Starting App Engine
go-example_1  | [GIN-debug] [WARNING] Running in "debug" mode. Switch to "release" mode in production.
go-example_1  |  - using env:   export GIN_MODE=release
go-example_1  |  - using code:  gin.SetMode(gin.ReleaseMode)
go-example_1  | 
go-example_1  | [GIN-debug] GET    /                         --> github.com/strongjz/go_example_app/app.rootHandler (3 handlers)
go-example_1  | [GIN-debug] GET    /ping                     --> github.com/strongjz/go_example_app/app.pingHandler (3 handlers)
go-example_1  | [GIN-debug] GET    /data                     --> github.com/strongjz/go_example_app/app.dataHandler (3 handlers)
go-example_1  | [GIN-debug] GET    /secret                   --> github.com/strongjz/go_example_app/app.secretHandler (3 handlers)
go-example_1  | [GIN-debug] GET    /host                     --> github.com/strongjz/go_example_app/app.hostHandler (3 handlers)
go-example_1  | [GIN-debug] GET    /external                 --> github.com/strongjz/go_example_app/app.externalHandler (3 handlers)
go-example_1  | [GIN-debug] Environment variable PORT="8080"
go-example_1  | [GIN-debug] Listening and serving HTTP on :8080
go-example_1  | [GIN-debug] [WARNING] Creating an Engine instance with the Logger and Recovery middleware already attached.
go-example_1  | 
go-example_1  | [GIN-debug] [WARNING] Running in "debug" mode. Switch to "release" mode in production.
go-example_1  |  - using env:   export GIN_MODE=release
go-example_1  |  - using code:  gin.SetMode(gin.ReleaseMode)
go-example_1  | 
go-example_1  | [GIN-debug] GET    /admin                    --> main.main.func1.1 (3 handlers)
go-example_1  | [GIN-debug] Listening and serving HTTP on :8090
db_1          |  done
db_1          | server started
db_1          | 
db_1          | /usr/local/bin/docker-entrypoint.sh: ignoring /docker-entrypoint-initdb.d/*
db_1          | 
db_1          | 2021-09-11 22:16:05.517 UTC [47] LOG:  received fast shutdown request
db_1          | waiting for server to shut down....2021-09-11 22:16:05.519 UTC [47] LOG:  aborting any active transactions
db_1          | 2021-09-11 22:16:05.520 UTC [47] LOG:  background worker "logical replication launcher" (PID 54) exited with exit code 1
db_1          | 2021-09-11 22:16:05.523 UTC [49] LOG:  shutting down
db_1          | 2021-09-11 22:16:05.536 UTC [47] LOG:  database system is shut down
db_1          |  done
db_1          | server stopped
db_1          | 
db_1          | PostgreSQL init process complete; ready for start up.
db_1          | 
db_1          | 2021-09-11 22:16:05.630 UTC [1] LOG:  starting PostgreSQL 12.2 (Debian 12.2-2.pgdg100+1) on x86_64-pc-linux-gnu, compiled by gcc (Debian 8.3.0-6) 8.3.0, 64-bit
db_1          | 2021-09-11 22:16:05.630 UTC [1] LOG:  listening on IPv4 address "0.0.0.0", port 5432
db_1          | 2021-09-11 22:16:05.630 UTC [1] LOG:  listening on IPv6 address "::", port 5432
db_1          | 2021-09-11 22:16:05.634 UTC [1] LOG:  listening on Unix socket "/var/run/postgresql/.s.PGSQL.5432"
db_1          | 2021-09-11 22:16:05.649 UTC [56] LOG:  database system was shut down at 2021-09-11 22:16:05 UTC
db_1          | 2021-09-11 22:16:05.653 UTC [1] LOG:  database system is ready to accept connections
```
{{% /expand%}}

Once it is up we can test the applications running in compose, same thing, new terminal and test  

`make test_local`

```bash
~/environment/devsecopspipeline (master) $ curl localhost:8080/
{"message":"Default Page"}
~/environment/devsecopspipeline (master) $ curl localhost:8080/ping
{"message":"Pong Version `0.1.20`"}
~/environment/devsecopspipeline (master) $ curl localhost:8080/data
{"message":"Database Connected"}
```

## 3. Go Reporter 

A Golang tool that does static analysis, unit testing, code review and generate code quality report.

https://github.com/qax-os/goreporter


`make go_report`

{{% expand%}}
```bash
rm -rf goreporter/
git clone https://github.com/qax-os/goreporter.git && \
cd goreporter/ && \
go mod init github.com/360EntSecGroup-Skylar/goreporter && \
go build && \
ls -la
Cloning into 'goreporter'...
remote: Enumerating objects: 4146, done.
remote: Total 4146 (delta 0), reused 0 (delta 0), pack-reused 4146
Receiving objects: 100% (4146/4146), 29.61 MiB | 9.99 MiB/s, done.
Resolving deltas: 100% (1510/1510), done.
go: creating new go.mod: module github.com/360EntSecGroup-Skylar/goreporter
total 16848
drwxrwxr-x 10 ec2-user ec2-user      334 Jan 11 20:40 .
drwxrwxr-x 10 ec2-user ec2-user     4096 Jan 11 20:40 ..
-rw-rw-r--  1 ec2-user ec2-user     3215 Jan 11 20:40 CODE_OF_CONDUCT.md
-rw-rw-r--  1 ec2-user ec2-user    17083 Jan 11 20:40 CONTRIBUTING.md
-rw-rw-r--  1 ec2-user ec2-user   895165 Jan 11 20:40 DISPLAY.gif
drwxrwxr-x  2 ec2-user ec2-user      237 Jan 11 20:40 doc
drwxrwxr-x  3 ec2-user ec2-user     4096 Jan 11 20:40 engine
drwxrwxr-x  8 ec2-user ec2-user      163 Jan 11 20:40 .git
-rw-rw-r--  1 ec2-user ec2-user      272 Jan 11 20:40 .gitignore
drwxrwxr-x  2 ec2-user ec2-user       20 Jan 11 20:40 Godeps
-rw-rw-r--  1 ec2-user ec2-user       60 Jan 11 20:40 go.mod
-rwxrwxr-x  1 ec2-user ec2-user 16148838 Jan 11 20:40 goreporter
-rwxrwxr-x  1 ec2-user ec2-user      265 Jan 11 20:40 go.test.sh
-rw-rw-r--  1 ec2-user ec2-user    11357 Jan 11 20:40 LICENSE
drwxrwxr-x 22 ec2-user ec2-user      323 Jan 11 20:40 linters
-rw-rw-r--  1 ec2-user ec2-user   125706 Jan 11 20:40 logo.png
-rw-rw-r--  1 ec2-user ec2-user     5114 Jan 11 20:40 main.go
-rw-rw-r--  1 ec2-user ec2-user     4760 Jan 11 20:40 README.md
drwxrwxr-x  2 ec2-user ec2-user       75 Jan 11 20:40 templates
-rw-rw-r--  1 ec2-user ec2-user      205 Jan 11 20:40 .travis.yml
drwxrwxr-x  2 ec2-user ec2-user       43 Jan 11 20:40 utils
drwxrwxr-x  5 ec2-user ec2-user       58 Jan 11 20:40 vendor
chmod u+x ./goreporter
cd ..
./goreporter/goreporter -p . -f html
2022/01/11 20:40:14 The template path is not specified,and will use the default template
2022/01/11 20:40:14 The report path is not specified, and the current path is used by default
2022/01/11 20:40:14 There are no packages that are excepted, review all items of the package
2022/01/11 20:40:14 Linter:CountCode over,time consuming 0.061658138s
2022/01/11 20:40:14 Linter:Cyclo over,time consuming 0.063365171s
2022/01/11 20:40:14 Linter:Deadcode over,time consuming 0.063735884s
E0111 20:40:23.226420   17200 depend.go:139] exec: "dot": executable file not found in $PATH
E0111 20:40:23.227365   17200 depend.go:144] open pkgdep.svg: no such file or directory
E0111 20:40:23.227492   17200 depend.go:149] remove pkgdep.svg: no such file or directory
2022/01/11 20:40:23 Linter:DependGraph over,time consuming 8.787942044s
2022/01/11 20:40:23 Linter:Depth over,time consuming 8.790083664s
2022/01/11 20:40:23 Linter:ImportPackages over,time consuming 9.416117587s
package skip/testdata is not in GOROOT (/usr/lib/golang/src/skip/testdata)
package deps is not in GOROOT (/usr/lib/golang/src/deps)
package grab-import/def is not in GOROOT (/usr/lib/golang/src/grab-import/def)
package grab-import is not in GOROOT (/usr/lib/golang/src/grab-import)
package single is not in GOROOT (/usr/lib/golang/src/single)
package skip/.hidden is not in GOROOT (/usr/lib/golang/src/skip/.hidden)
package skip is not in GOROOT (/usr/lib/golang/src/skip)
package nested/pkg is not in GOROOT (/usr/lib/golang/src/nested/pkg)
package grab-import/def/nested is not in GOROOT (/usr/lib/golang/src/grab-import/def/nested)
2022/01/11 20:40:25 no initial packages were loaded
2022/01/11 20:40:25 Linter:Interfacer over,time consuming 10.582002842s
can't load package "goreporter/linters/interfacer/testdata/src/deps": package goreporter/linters/interfacer/testdata/src/deps is not in GOROOT (/usr/lib/golang/src/goreporter/linters/interfacer/testdata/src/deps)
package goreporter/linters/interfacer/testdata/src/deps is not in GOROOT (/usr/lib/golang/src/goreporter/linters/interfacer/testdata/src/deps)
can't load package "goreporter/linters/interfacer/testdata/src/grab-import/def": package goreporter/linters/interfacer/testdata/src/grab-import/def is not in GOROOT (/usr/lib/golang/src/goreporter/linters/interfacer/testdata/src/grab-import/def)
package goreporter/linters/interfacer/testdata/src/grab-import/def is not in GOROOT (/usr/lib/golang/src/goreporter/linters/interfacer/testdata/src/grab-import/def)
can't load package "goreporter/linters/interfacer/testdata/src/grab-import/def/nested": package goreporter/linters/interfacer/testdata/src/grab-import/def/nested is not in GOROOT (/usr/lib/golang/src/goreporter/linters/interfacer/testdata/src/grab-import/def/nested)
package goreporter/linters/interfacer/testdata/src/grab-import/def/nested is not in GOROOT (/usr/lib/golang/src/goreporter/linters/interfacer/testdata/src/grab-import/def/nested)
can't load package "goreporter/linters/interfacer/testdata/src/grab-import": package goreporter/linters/interfacer/testdata/src/grab-import is not in GOROOT (/usr/lib/golang/src/goreporter/linters/interfacer/testdata/src/grab-import)
package goreporter/linters/interfacer/testdata/src/grab-import is not in GOROOT (/usr/lib/golang/src/goreporter/linters/interfacer/testdata/src/grab-import)
can't load package "goreporter/linters/interfacer/testdata/src/nested/pkg": package goreporter/linters/interfacer/testdata/src/nested/pkg is not in GOROOT (/usr/lib/golang/src/goreporter/linters/interfacer/testdata/src/nested/pkg)
package goreporter/linters/interfacer/testdata/src/nested/pkg is not in GOROOT (/usr/lib/golang/src/goreporter/linters/interfacer/testdata/src/nested/pkg)
can't load package "goreporter/linters/interfacer/testdata/src/single": package goreporter/linters/interfacer/testdata/src/single is not in GOROOT (/usr/lib/golang/src/goreporter/linters/interfacer/testdata/src/single)
package goreporter/linters/interfacer/testdata/src/single is not in GOROOT (/usr/lib/golang/src/goreporter/linters/interfacer/testdata/src/single)
can't load package "goreporter/linters/interfacer/testdata/src/skip/.hidden": package goreporter/linters/interfacer/testdata/src/skip/.hidden is not in GOROOT (/usr/lib/golang/src/goreporter/linters/interfacer/testdata/src/skip/.hidden)
package goreporter/linters/interfacer/testdata/src/skip/.hidden is not in GOROOT (/usr/lib/golang/src/goreporter/linters/interfacer/testdata/src/skip/.hidden)
can't load package "goreporter/linters/interfacer/testdata/src/skip": package goreporter/linters/interfacer/testdata/src/skip is not in GOROOT (/usr/lib/golang/src/goreporter/linters/interfacer/testdata/src/skip)
package goreporter/linters/interfacer/testdata/src/skip is not in GOROOT (/usr/lib/golang/src/goreporter/linters/interfacer/testdata/src/skip)
can't load package "goreporter/linters/interfacer/testdata/src/skip/testdata": package goreporter/linters/interfacer/testdata/src/skip/testdata is not in GOROOT (/usr/lib/golang/src/goreporter/linters/interfacer/testdata/src/skip/testdata)
package goreporter/linters/interfacer/testdata/src/skip/testdata is not in GOROOT (/usr/lib/golang/src/goreporter/linters/interfacer/testdata/src/skip/testdata)
2022/01/11 20:40:27 Linter:Simple over,time consuming 12.955047065s
2022/01/11 20:40:27 Linter:SpellCheck over,time consuming 13.463511588s
2022/01/11 20:41:02 Linter:UnitTest over,time consuming 47.960319904s
2022/01/11 20:41:02 Linter:GoLint over,time consuming 47.981047773s
2022/01/11 20:41:02 Linter:GoVet over,time consuming 47.988504482s
2022/01/11 20:41:04 To display report file:///home/ec2-user/environment/devsecopspipeline/devsecopspipeline-2022-01-11-20-41-04.html in browser
2022/01/11 20:41:04 exec: "xdg-open": executable file not found in $PATH
2022/01/11 20:41:04 GoReporter Finished,time consuming 49.725472744s```
```
{{% /expand%}}

## 4. Go Sec 

Inspects source code for security problems by scanning the Go AST.

https://securego.io/docs/rules/rule-intro.html

`make go_sec`

{{% expand%}}
```bash

wget -O - -q https://raw.githubusercontent.com/securego/gosec/master/install.sh | sh -s v2.9.5
securego/gosec info checking GitHub for tag 'v2.9.5'
securego/gosec info found version: 2.9.5 for v2.9.5/linux/amd64
securego/gosec info installed ./bin/gosec
./bin/gosec -fmt=json -out=security.json -stdout .
[gosec] 2022/01/11 20:42:59 Including rules: default
[gosec] 2022/01/11 20:42:59 Excluding rules: default
[gosec] 2022/01/11 20:42:59 Import directory: /home/ec2-user/environment/devsecopspipeline
[gosec] 2022/01/11 20:42:59 Checking package: main
[gosec] 2022/01/11 20:42:59 Checking file: /home/ec2-user/environment/devsecopspipeline/main.go
{
        "Golang errors": {},
        "Issues": [],
        "Stats": {
                "files": 1,
                "lines": 18,
                "nosec": 0,
                "found": 0
        },
        "GosecVersion": "2.9.5"
}AWSReservedSSO_Engineering-Admin_a62927498966bb0a:~/environment/devsecopspipeline 
```
{{% /expand%}}

## 5. Secure Dockerfile

Let's create a user for the application and rebuild our image

Add these lines to the dockerfile to create a new user 
```bash 
# Create appuser.
ENV USER=appuser
ENV UID=10001
# See https://stackoverflow.com/a/55757473/12429735RUN
RUN adduser \    
--disabled-password \    
--gecos "" \    
--home "/nonexistent" \    
--shell "/sbin/nologin" \    
--no-create-home \    
--uid "${UID}" \    
"${USER}"
```

Inside the app container add these lines. 
```bash
# Import the user and group files from the builder.
COPY --from=builder /etc/passwd /etc/passwd
COPY --from=builder /etc/group /etc/group

# Use an unprivileged user.
USER appuser:appuser
```

The Dockerfile should look like this now

```dockerfile
FROM golang:1.13-alpine AS builder

RUN apk update && apk add --no-cache git
# Create appuser.
ENV USER=appuser
ENV UID=10001
# See https://stackoverflow.com/a/55757473/12429735RUN
RUN adduser \
  --disabled-password \
  --gecos "" \
  --home "/nonexistent" \
  --shell "/sbin/nologin" \
  --no-create-home \
  --uid "${UID}" \
  "${USER}"

WORKDIR /go/src/app
COPY . .

RUN GIT_TERMINAL_PROMPT=1 go get -d -v
RUN CGO_ENABLED=0 go build -o /go/bin/app

FROM golang:1.13-alpine

COPY --from=builder /go/bin/app /go/bin/app
# Import the user and group files from the builder.
COPY --from=builder /etc/passwd /etc/passwd
COPY --from=builder /etc/group /etc/group

# Use an unprivileged user.
USER appuser:appuser

EXPOSE 8080
EXPOSE 8090

CMD ["/go/bin/app"]
```



This was all done locally now let's get a pipeline running all this! 


