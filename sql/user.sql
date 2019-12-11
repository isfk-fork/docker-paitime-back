
CREATE DATABASE IF NOT EXISTS paitime DEFAULT CHARACTER SET = utf8mb4;

CREATE USER 'pt_user'@'%' IDENTIFIED BY 'RjwuGv12XSDaVsW7';
CREATE USER 'master'@'%' IDENTIFIED BY 'RjwuGv12XSDaVsW7';

GRANT ALL ON paitime.* TO 'pt_user'@'%';
GRANT ALL ON *.* TO 'master'@'%';

flush privileges;

