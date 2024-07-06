-- Configuración de replicación en el servidor primario
CREATE USER 'replica_user'@'%' IDENTIFIED BY 'replica_password';
GRANT REPLICATION SLAVE ON *.* TO 'replica_user'@'%';
FLUSH PRIVILEGES;

-- Obtén el estado del log binario actual
SHOW MASTER STATUS;
