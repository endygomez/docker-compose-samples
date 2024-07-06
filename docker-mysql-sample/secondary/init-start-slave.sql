-- Detenemos el proceso de replicación si está en ejecución
STOP SLAVE;

-- Restablecemos la configuración de replicación
RESET SLAVE;

-- Configuramos la replicación con el servidor primario
CHANGE MASTER TO
  MASTER_HOST='mysql-primary',
  MASTER_USER='replica_user',
  MASTER_PASSWORD='replica_password',
  MASTER_LOG_FILE='mysql-bin.000001',
  MASTER_LOG_POS=4,
  MASTER_SSL=1,
  MASTER_SSL_CA='/etc/mysql/ssl/ca-cert.pem',
  MASTER_SSL_CERT='/etc/mysql/ssl/server-cert.pem',
  MASTER_SSL_KEY='/etc/mysql/ssl/server-key.pem';

-- Iniciamos el proceso de replicación
START SLAVE;

-- Verificamos el estado de la replicación
SHOW SLAVE STATUS\G;

