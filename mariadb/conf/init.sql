-- CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};
-- CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
-- CREATE USER IF NOT EXISTS '${WP_SUPERUSER}'@'%' IDENTIFIED BY '${WP_SUPERUSER_PASSWORD}';

-- GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';
-- GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${WP_SUPERUSER}'@'%';

-- ALTER USER '${WP_SUPERUSER}'@'%' IDENTIFIED BY '${WP_SUPERUSER_PASSWORD}';
-- ALTER USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';

-- FLUSH PRIVILEGES;


CREATE DATABASE IF NOT EXISTS MYSQL_DATABASE;

CREATE USER IF NOT EXISTS 'MYSQL_USER'@'%' IDENTIFIED BY 'MYSQL_PASSWORD';
GRANT ALL PRIVILEGES ON MYSQL_DATABASE.* TO 'MYSQL_USER'@'%';

ALTER USER 'root'@'localhost' IDENTIFIED BY 'MYSQL_ROOT_PASSWORD';
FLUSH PRIVILEGES;
