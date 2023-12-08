FROM mysql/mysql-server:8.0.26

ENV MYSQL_ROOT_PASSWORD cp23ssi3

EXPOSE 3306

CMD ["mysqld", "--character-set-server=utf8mb4"]

