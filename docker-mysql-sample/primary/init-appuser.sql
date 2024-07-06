-- Crear un usuario con permisos completos en el servidor primario
CREATE USER 'app_user'@'%' IDENTIFIED BY 'app_password';
GRANT INSERT, UPDATE ON my_database.* TO 'app_user'@'%';
FLUSH PRIVILEGES;