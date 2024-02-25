-- Selecciona la base de datos 'skull2canldydb'
USE skull2canldydb;

-- Elimina la tabla 'funciones_roles' si existe
DROP TABLE IF EXISTS `funciones_roles`;

-- Elimina la tabla 'funciones' si existe
DROP TABLE IF EXISTS `funciones`;

-- Crea la tabla 'funciones' con las siguientes columnas: fncod, fndsc, fnest, fntyp
CREATE TABLE `funciones` (
  `fncod` varchar(255) NOT NULL,  -- Código de la función (clave primaria)
  `fndsc` varchar(45) DEFAULT NULL, -- Descripción de la función
  `fnest` char(3) DEFAULT NULL, -- Estado de la función
  `fntyp` char(3) DEFAULT NULL, -- Tipo de función
  PRIMARY KEY (`fncod`) -- Establece la clave primaria en la columna 'fncod'
) ENGINE=InnoDB DEFAULT CHARSET=utf8; -- Motor de almacenamiento InnoDB, codificación utf8

-- Crea la tabla 'funciones_roles' con las siguientes columnas: rolescod, fncod, fnrolest, fnexp
CREATE TABLE `funciones_roles` (
  `rolescod` varchar(15) NOT NULL, -- Código del rol (parte de la clave primaria)
  `fncod` varchar(255) NOT NULL, -- Código de la función (parte de la clave primaria)
  `fnrolest` char(3) DEFAULT NULL, -- Estado de la función en relación al rol
  `fnexp` datetime DEFAULT NULL, -- Fecha de expiración de la función
  PRIMARY KEY (`rolescod`,`fncod`), -- Establece una clave primaria compuesta
  KEY `rol_funcion_key_idx` (`fncod`), -- Crea un índice en la columna 'fncod'
  CONSTRAINT `funcion_rol_key` FOREIGN KEY (`rolescod`) REFERENCES `roles` (`rolescod`) ON DELETE NO ACTION ON UPDATE NO ACTION, -- Establece una restricción de clave externa en la columna 'rolescod' que referencia la tabla 'roles'
  CONSTRAINT `rol_funcion_key` FOREIGN KEY (`fncod`) REFERENCES `funciones` (`fncod`) ON DELETE NO ACTION ON UPDATE NO ACTION -- Establece una restricción de clave externa en la columna 'fncod' que referencia la tabla 'funciones'
) ENGINE=InnoDB DEFAULT CHARSET=utf8; -- Motor de almacenamiento InnoDB, codificación utf8

-- Modifica la tabla 'bitacora', cambiando el tipo de la columna 'bitprograma' a VARCHAR(255)
ALTER TABLE `bitacora` CHANGE `bitprograma` `bitprograma` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL;


