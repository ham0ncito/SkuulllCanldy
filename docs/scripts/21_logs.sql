INSERT INTO `log`(`log_cod`, `log_description`) VALUES ('INI','INICIO DE SESION');
INSERT INTO `log`(`log_cod`, `log_description`) VALUES ('FAL','FALLO DE SESION');
INSERT INTO `log`(`log_cod`, `log_description`) VALUES ('CON','CONTRASEÑA INCORRECTA');
INSERT INTO `log`(`log_cod`, `log_description`) VALUES ('CNA','Correo no tiene el formato adecuado');
INSERT INTO `log`(`log_cod`, `log_description`) VALUES ('NPA','¡Debe ingresar una contraseña!');
INSERT INTO `log`(`log_cod`, `log_description`) VALUES ('CI','CREDENCIAS INCORRECTAS');

INSERT INTO `log`(`log_cod`, `log_description`) VALUES ('DES','CUENTA NO ACTIVA');

INSERT INTO `log`(`log_cod`, `log_description`) VALUES ('COR','INTENTO INGRESAR CORREO');


INSERT INTO `log`(`log_cod`, `log_description`) VALUES ('LGO','CERRÓ SESION');
ALTER TABLE `loguser` DROP PRIMARY KEY, ADD PRIMARY KEY(`user_cod`, `date`);
ALTER TABLE `lognonuser` DROP PRIMARY KEY, ADD PRIMARY KEY(`id_logNonUser`, `log_date`);