create TABLE product (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    type VARCHAR(255),
    price INTEGER,
    count INTEGER,
    img VARCHAR,
    aboutProduct VARCHAR
);

create TABLE catalog(
    id SERIAL PRIMARY KEY,
    product_id INTEGER,
    FOREIGN KEY (product_id) REFERENCES product (id)
);

create TABLE catalog_product (
    catalog_id INTEGER,
    product_id INTEGER,
    FOREIGN KEY (catalog_id) REFERENCES catalog (id),
    FOREIGN KEY (product_id) REFERENCES catalog (id)
);

create TABLE p_user (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    surname VARCHAR(255),
    login VARCHAR(255),
    password VARCHAR(255)
);

create TABLE cart(
    id SERIAL PRIMARY KEY,
    user_id INTEGER,
    FOREIGN KEY (user_id) REFERENCES p_user (id)
);

create TABLE favorites(
    id SERIAL PRIMARY KEY,
    user_id INTEGER,
    FOREIGN KEY (user_id) REFERENCES p_user (id)
);

create TABLE cart_product (
    cart_id INTEGER,
    product_id INTEGER,
    FOREIGN KEY (cart_id) REFERENCES cart (id),
    FOREIGN KEY (product_id) REFERENCES product (id)
);

create TABLE favorites_product (
    favorites_id INTEGER,
    product_id INTEGER,
    FOREIGN KEY (favorites_id) REFERENCES favorites (id),
    FOREIGN KEY (product_id) REFERENCES product (id)
);

create TABLE type (
    id SERIAL PRIMARY KEY,
    type VARCHAR(30)
);

ALTER TABLE product {
    ADD type INTEGER;
}

create TABLE role (
    id SERIAL PRIMARY KEY,
    value VARCHAR DEFAULT 'user'
);

FOREIGN KEY (type) REFERENCES type(id);