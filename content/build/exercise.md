---
title: Secure Containers Exercise
weight: 32
---

Navigate to DevSecops repo 

```bash
cd ~/environment/devsecopspipeline
```


```bash
~/environment/devsecopspipeline (master) $ export DB_PASSWORD=temppassword
AWSReservedSSO_AdministratorAccess_9c06ffa3ce9d7954:~/environment/devsecopspipeline (master) $ make compose_up
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