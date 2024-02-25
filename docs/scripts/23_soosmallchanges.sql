
--Creacion del dashboard de admin

INSERT INTO funciones (fncod, fndsc, fnest, fntyp) VALUES ('Controllers\\Admin\\Dashboard\\', 'Dashboard para Administradores', 'ACT', 'CTR');



INSERT INTO funciones_roles (rolescod, fncod, fnrolest, fnexp) VALUES ('ADMIN', 'Controllers\\Admin\\Dashboard\\', 'ACT', DATE_ADD(NOW(), INTERVAL 1 YEAR));

INSERT INTO `roles_usuarios`(`usercod`, `rolescod`, `roleuserest`, `roleuserfch`, `roleuserexp`) VALUES ('f0fef9d5e79c8d40a320ec4eb39936c3eaa035aaf0c46b7d118dead4294fb764','ADMIN','ACT',NOW(), DATE_ADD(NOW(), INTERVAL 1 YEAR));