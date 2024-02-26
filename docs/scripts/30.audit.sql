--Dashboard de auditores, insert del controlador

INSERT INTO `funciones` (`fncod`, `fndsc`, `fnest`, `fntyp`) VALUES ('Controllers\\\\Audit\\\\Audit', 'Controlador Auditores', 'ACT', 'CTR');
INSERT INTO `funciones` (`fncod`, `fndsc`, `fnest`, `fntyp`) VALUES ('Controllers\\\\Audit\\\\Audit', 'Controlador Auditores', 'ACT', 'CTR');


INSERT INTO `funciones_roles` (`rolescod`, `fncod`, `fnrolest`, `fnexp`) VALUES ('AUDIT', 'Controllers\\Audit\\Audit', 'ACT', '2025-02-29');