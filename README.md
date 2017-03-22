# README #

## PHP5, MariaDB and nginx in a single docker instance ##

### What is this repository for? ###

* Easy Development environment for php/mariadb web applications.

### How do I get set up? ###

Check out using git clone and then run

```bash
git clone git@github.com:JochenHeizmann/Docker-NGINX-PHP5-MariaDB-Dev-Environment.git
cd Docker-NGINX-PHP5-MariaDB-Dev-Environment
./run.sh
```

This will build the docker image and run an instance without any need for you to set up volumes or expose ports.

## MariaDB ##

* database: db
* username: root
* password: 

The db is synced into `docker/mysql/db` of the host.

Port 3306 is exposed, so you can directly connect to the DB from your Host system.

## NGINX ##

The document root of nginx is the `www` subfolder.

Port 80 is exposed, so you can browse to 127.0.0.1 on your local machine.
