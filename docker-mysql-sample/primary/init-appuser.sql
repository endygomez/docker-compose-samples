-- create an user with INSERT and UPDATE permissions on the primary server
CREATE USER 'app_user'@'%' IDENTIFIED BY 'app_password';
GRANT INSERT, UPDATE ON my_database.* TO 'app_user'@'%';
FLUSH PRIVILEGES;