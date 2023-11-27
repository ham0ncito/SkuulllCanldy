CREATE TABLE purchase (
    id_purchase VARCHAR(450) NOT NULL PRIMARY KEY,
    purchase_date DATE,
    total DECIMAL(12, 2),
    details VARCHAR(450)
);

CREATE TABLE purchaseDetail (
    id_purchase VARCHAR(450) NOT NULL,
    id_item_reference VARCHAR(450) NOT NULL,
    quantity INT,
    unitary_price DECIMAL(10, 2),
    FOREIGN KEY (id_purchase) REFERENCES purchase(id_purchase),
    PRIMARY KEY (id_purchase, id_item_reference)
);
