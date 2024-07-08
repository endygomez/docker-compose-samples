-- Stop the replication process if it is running
STOP SLAVE;

-- Reset the replication position to the beginning
RESET SLAVE;

-- Configure the replication with the primary server data
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

-- Start the replication process
START SLAVE;

-- Check if the replication is running
SHOW SLAVE STATUS\G;

