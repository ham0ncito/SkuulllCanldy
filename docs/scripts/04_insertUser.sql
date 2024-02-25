-- Inserta filas en la tabla 'usuario' con los siguientes datos:
INSERT INTO usuario (usercod, useremail, username, userpswd, userfching, userpswdest, userpswdexp, userest, useractcod, userpswdchg, usertipo)
VALUES
('johndoe', 'john@example.com', 'John Doe', 'P@ssw0rd1', '2023-11-01', 'ACT', '2024-11-01', 'ACT', 'activation_123', 'password_changed_1', 'NRM'),
('janedoe', 'jane@example.com', 'Jane Doe', 'P@ssw0rd2', '2023-11-02', 'ACT', '2024-11-02', 'ACT', 'activation_456', 'password_changed_2', 'NRM'),
('aliceinwonderland', 'alice@example.com', 'Alice Wonderland', 'P@ssw0rd3', '2023-11-03', 'ACT', '2024-11-03', 'ACT', 'activation_789', 'password_changed_3', 'NRM'),
('bobthebuilder', 'bob@example.com', 'Bob Builder', 'P@ssw0rd4', '2023-11-04', 'ACT', '2024-11-04', 'ACT', 'activation_abc', 'password_changed_4', 'NRM'),
('sarahconnor', 'sarah@example.com', 'Sarah Connor', 'P@ssw0rd5', '2023-11-05', 'ACT', '2024-11-05', 'ACT', 'activation_def', 'password_changed_5', 'NRM');

-- Inserta filas en la tabla 'roles' con los siguientes datos:
INSERT INTO roles (rolescod, rolesdsc, rolesest) VALUES ('ADMIN', 'Administrador', 'ACT');
INSERT INTO roles (rolescod, rolesdsc, rolesest) VALUES ('AUDIT', 'Auditor', 'ACT');
INSERT INTO roles (rolescod, rolesdsc, rolesest) VALUES ('OPADQ', 'Operador de Adquisiciones', 'ACT');
INSERT INTO roles (rolescod, rolesdsc, rolesest) VALUES ('CLS', 'Cliente Suscrito', 'ACT');
INSERT INTO roles (rolescod, rolesdsc, rolesest) VALUES ('CLN', 'Cliente No Suscrito', 'ACT');
INSERT INTO roles (rolescod, rolesdsc, rolesest) VALUES ('VIS', 'Visita', 'ACT');
INSERT INTO roles (rolescod, rolesdsc, rolesest) VALUES ('ART', 'Artista', 'ACT');
INSERT INTO roles (rolescod, rolesdsc, rolesest) VALUES ('DEV', 'Developer', 'ACT');
INSERT INTO roles (rolescod, rolesdsc, rolesest) VALUES ('VEN', 'Vendor', 'ACT');
INSERT INTO roles (rolescod, rolesdsc, rolesest) VALUES ('INV', 'INVESTOR', 'ACT');
INSERT INTO roles (rolescod, rolesdsc, rolesest) VALUES ('SOP', 'Soporte', 'ACT');
