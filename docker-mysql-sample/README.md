# MYSQL Mirror server

This document describes the setup and verification of a MySQL secondary server that acts as a mirror of the primary server. The primary server allows insertion of data into the database, while the secondary server replicates the data from the primary server.

### Starting the MySQL containers

```
docker-compose up -d
```

### Access to mysql-primary container

```
docker exec -it mysql-primary mysql -uapp_user -p
# PASSWORD: app_password
```

```
USE my_database;
```

### app_user only can write to my_database

```
mysql> INSERT INTO test_table (data) VALUES ('Primary: Test data N');
```

### Access to mysql-secondary container

```
docker exec -it mysql-secondary mysql -uread_only_user -p
PASSWORD: read_only_password

mysql> SELECT \* FROM my_database.test_table;
+----+----------------------+
| id | data |
+----+----------------------+
| 1 | Primary: Test Data 1 |
| 2 | Primary: Test Data 2 |
| 3 | Primary: Test Data N |
+----+----------------------+
```

### Not is possible insert data from secondary container

```
mysql> INSERT INTO test_table (data) VALUES ('Secondary: Test data 1');
ERROR 1290 (HY000): The MySQL server is running with the --read-only option so it cannot execute this statement
```

## Resume to configure the MySQL Mirror Server

- Create a config files to primary and secondary mysql containers.
- Create a docker-compose.yaml to configure the mysql mirror server.
- Create a .env file to store the environment variables.
- Create ssl certificates for the mysql mirror server.
