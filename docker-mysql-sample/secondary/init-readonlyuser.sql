-- Crear un usuario con permisos solo de lectura en el servidor secundario
CREATE USER 'read_only_user'@'%' IDENTIFIED BY 'read_only_password';
GRANT SELECT ON my_database.* TO 'read_only_user'@'%';
FLUSH PRIVILEGES;
