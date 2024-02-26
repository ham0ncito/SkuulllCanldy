-- Active: 1698162320673@@127.0.0.1@3306@skull2canldydb
--Estas vistas son para ocultar los datos de los usuarios y brindar una capa de seguridad mas fuerte
CREATE VIEW usuario_vista AS
SELECT 
    usercod,
    CONCAT('*****', SUBSTRING(useremail, 6)) AS useremail,
    CONCAT('*****', SUBSTRING(username, 6)) AS username,
    CONCAT('*****') AS userpswd,
    userfching,
    userest,
    usertipo
FROM usuario;

CREATE VIEW roles_vista AS
SELECT 
    rolescod,
    CONCAT('*****', SUBSTRING(rolesdsc, 6)) AS rolesdsc
FROM roles;

CREATE VIEW roles_usuarios_vista AS
SELECT 
    usercod,
    rolescod,
    CONCAT('*****') AS roleuserfch
FROM roles_usuarios;

CREATE VIEW funciones_vista AS
SELECT 
    fncod,
    CONCAT('*****', SUBSTRING(fndsc, 6)) AS fndsc,
    CONCAT('*****', SUBSTRING(fntyp, 6)) AS fntyp
FROM funciones;

CREATE VIEW funciones_roles_vista AS
SELECT 
    rolescod,
    fncod,
    CONCAT('*****') AS fnexp
FROM funciones_roles;

CREATE VIEW bitacora_vista AS
SELECT 
    bitacoracod,
    bitacorafch,
    CONCAT('*****', SUBSTRING(bitprograma, 6)) AS bitprograma,
    CONCAT('*****', SUBSTRING(bitdescripcion, 6)) AS bitdescripcion,
    CONCAT('*****', SUBSTRING(bitTipo, 6)) AS bitTipo
FROM bitacora;


CREATE VIEW products_vista AS
SELECT 
    productId,
    productName,
    CONCAT('*****', SUBSTRING(productDescription, 6)) AS productDescription,
    productPrice,
    CONCAT('*****', SUBSTRING(productImgUrl, 6)) AS productImgUrl,
    productStock,
    productStatus
FROM products;

CREATE VIEW carretilla_vista AS
SELECT 
    usercod,
    productId,
    crrctd,
    crrprc,
    crrfching
FROM carretilla;

CREATE VIEW carretillaanon_vista AS
SELECT 
    anoncod,
    productId,
    crrctd,
    crrprc,
    crrfching
FROM carretillaanon;

CREATE VIEW favorites_vista AS
SELECT 
    CONCAT('*****', SUBSTRING(id_favorite, 6)) AS id_favorite,
    CONCAT('*****', SUBSTRING(usercod, 6)) AS usercod,
    CONCAT('*****', SUBSTRING(id_reference, 6)) AS id_reference,
    type_favorite
FROM favorites;

CREATE VIEW offerSubscription_vista AS
SELECT 
    CONCAT('*****', SUBSTRING(id_offer, 6)) AS id_offer,
    CONCAT('*****', SUBSTRING(id_subscription, 6)) AS id_subscription,
    price_offer
FROM offerSubscription;
CREATE VIEW subscriptionUser_vista AS
SELECT 
    CONCAT('*****', SUBSTRING(usercod, 6)) AS usercod,
    CONCAT('*****', SUBSTRING(id_subscription, 6)) AS id_subscription,
    purchase_date_subscription,
    purchase_date_end,
    status_subscription
FROM subscriptionUser;

   CREATE VIEW funcioness_vista AS
SELECT 
    fncod,
    CONCAT('*****', SUBSTRING(fndsc, 6)) AS fndsc,
    CONCAT('*****') AS fnest,
    CONCAT('*****') AS fntyp
FROM funciones;

CREATE VIEW funciones_roles_vista AS
SELECT 
    rolescod,
    fncod,
    fnexp
FROM funciones_roles;

CREATE VIEW logNonUser_vista AS
SELECT 
    CONCAT('*****', SUBSTRING(id_logNonUser, 6)) AS id_logNonUser,
    log_date,
    CONCAT('*****', SUBSTRING(id_cookie, 6)) AS id_cookie,
    CONCAT('*****', SUBSTRING(log_cod, 6)) AS log_cod
FROM logNonUser;

CREATE VIEW logUser_vista AS
SELECT 
    user_cod,
    CONCAT('*****', SUBSTRING(log_cod, 6)) AS log_cod,
    date
FROM logUser;


CREATE VIEW purchaseDetail_vista AS
SELECT 
    CONCAT('*****', SUBSTRING(id_purchase, 6)) AS id_purchase,
    CONCAT('*****', SUBSTRING(id_item_reference, 6)) AS id_item_reference,
    quantity,
    unitary_price
FROM purchaseDetail;


CREATE VIEW purchase_vista AS
SELECT 
    CONCAT('*****', SUBSTRING(id_purchase, 6)) AS id_purchase,
    purchase_date,
    total,
    details
FROM purchase;
