# README #

## PHP5, MariaDB and nginx in a single docker instance ##

### What is this repository for? ###

* Easy Development environment for php/mariadb web applications.

### How do I get set up? ###

Check out using git clone and then run

```bash
./run.sh
```

This will build the docker image and runs an instance.

The db is synced into docker/mysql/db

The document root of nginx is the www subfolder.

