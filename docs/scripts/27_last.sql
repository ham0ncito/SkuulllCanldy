
--Creacion de triger que modifica el rol del usuario una vez compra una subscripcion
DELIMITER //

CREATE TRIGGER newSubUserUpdate
AFTER UPDATE ON subscriptionuser
FOR EACH ROW
BEGIN
    UPDATE roles_usuarios SET rolescod = 'CLS' where usercod = new.usercod;
END;
//

DELIMITER ;