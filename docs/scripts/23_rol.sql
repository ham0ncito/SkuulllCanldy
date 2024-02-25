AL
--Testeo de roles

TER TABLE `usuario` CHANGE `usertipo` `usertipo` CHAR(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Tipo de Usuario, Normal, Consultor o Cliente';



/**/
USE skull2canldydb;
UPDATE `usuario` SET `usertipo` = 'ADMIN' WHERE `usuario`.`usercod` = 'f0fef9d5e79c8d40a320ec4eb39936c3eaa035aaf0c46b7d118dead4294fb764';

/*No pago subscripcion*/
UPDATE `usuario` SET `usertipo` = 'CLN' WHERE `usuario`.`usercod` = 'f0fef9d5e79c8d40a320ec4eb39936c3eaa035aaf0c46b7d118dead4294fb764';

UPDATE `usuario` SET `usertipo` = 'CLS' WHERE `usuario`.`usercod` = 'f0fef9d5e79c8d40a320ec4eb39936c3eaa035aaf0c46b7d118dead4294fb764';