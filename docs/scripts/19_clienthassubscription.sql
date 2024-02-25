--Creacion del tigger para cambiar el rol del usuario una vez compra una subscription

DELIMITER //

CREATE TRIGGER newSubUser
AFTER INSERT ON subscriptionuser
FOR EACH ROW
BEGIN
    UPDATE roles_usuarios SET rolescod = 'CLS' where usercod = new.usercod;
END;
//

DELIMITER ;
