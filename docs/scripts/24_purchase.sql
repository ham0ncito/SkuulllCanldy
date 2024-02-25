
---modificaciones para la tabla compras que agregan llaves foraneas
Alter table purchase add column usercod varchar(250); 
ALTER TABLE purchase ADD CONSTRAINT fk_purchase_usercod FOREIGN KEY (usercod) REFERENCES usuario(usercod);
ALTER TABLE purchasedetail ADD CONSTRAINT fk_purchase_idpurchase FOREIGN KEY (`id_purchase`) REFERENCES purchase(`id_purchase`);