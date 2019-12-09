
CREATE DATABASE IF NOT EXISTS ypj DEFAULT CHARACTER SET = utf8mb4;

CREATE USER 'pt_user'@'%' IDENTIFIED BY 'RjwuGv12XSDaVsW7';

GRANT ALL ON ypj.* TO 'pt_user'@'%';

flush privileges;

