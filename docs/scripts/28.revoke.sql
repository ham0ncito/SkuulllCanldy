--revoke de privilegios para usuarios, dejando solo un adminsitrador

REVOKE ALL PRIVILEGES ON `skull2canldydb`.* FROM 'Mauve3553'@'localhost'; GRANT INSERT ON `skull2canldydb`.* TO 'Mauve3553'@'localhost';

REVOKE ALL PRIVILEGES ON `skull2canldydb`.* FROM 'Strongbox9114'@'localhost'; GRANT UPDATE ON `skull2canldydb`.* TO 'Strongbox9114'@'localhost';

REVOKE ALL PRIVILEGES ON `skull2canldydb`.* FROM 'Slogan9664'@'%'; GRANT INSERT, UPDATE ON `skull2canldydb`.* TO 'Slogan9664'@'%';