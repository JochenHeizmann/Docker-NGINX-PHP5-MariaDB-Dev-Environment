FROM alpine:edge

RUN apk --update add \
  mariadb \
  mariadb-client

ADD scripts/init_db.sh /init_db.sh
ADD scripts/run.sh /run.sh
RUN chmod 775 *.sh

ADD config/my.cnf /etc/mysql/my.cnf

# # Add VOLUMEs to allow backup of config and databases
VOLUME  ["/etc/mysql", "/var/lib/mysql"]

EXPOSE 3306

CMD ["sh", "run.sh"]
