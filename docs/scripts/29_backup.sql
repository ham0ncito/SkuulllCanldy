--Creacion del evento de backupautomatico

DELIMITER //

CREATE EVENT backup_daily
ON SCHEDULE EVERY 1 DAY
DO
BEGIN
    SET @backup_file := CONCAT('/backups/', CURDATE(), '_backup.sql');
    SET @query := CONCAT('mysqldump -u Reckless0069	 h4cKaaLGdZLTgj6hSmMzfVc9pYAuktSYLgfdTsbVfmoNLMbBQavs7UrxqCquQ5WwdNUXQ skull2canldydb > ', @backup_file);
    PREPARE statement FROM @query;
    EXECUTE statement;
    DEALLOCATE PREPARE statement;
END//

DELIMITER ;


DELIMITER //
CREATE EVENT `Backup` ON SCHEDULE EVERY 1 DAY STARTS '2024-02-20 14:40:42.000000' ENDS '2030-03-31 14:40:42.000000' ON COMPLETION PRESERVE ENABLE DO 
BEGIN
    SET @backup_file := CONCAT('/backups/', CURDATE(), '_backup.sql');
    SET @query := CONCAT('mysqldump -u Reckless0069	 h4cKaaLGdZLTgj6hSmMzfVc9pYAuktSYLgfdTsbVfmoNLMbBQavs7UrxqCquQ5WwdNUXQ skull2canldydb > ', @backup_file);
    PREPARE statement FROM @query;
    EXECUTE statement;
    DEALLOCATE PREPARE statement;
END


DELIMITER;


mysqldump -u Reckless0069 -ph4cKaaLGdZLTgj6hSmMzfVc9pYAuktSYLgfdTsbVfmoNLMbBQavs7UrxqCquQ5WwdNUXQ skull2canldydb > /backups/$(date +'%Y-%m-%d')_backup.sql
