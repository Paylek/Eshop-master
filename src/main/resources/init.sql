--------------------------------------------------------
--  DDL for schema ESHOP
--------------------------------------------------------

DROP SCHEMA IF EXISTS ESHOP;
CREATE SCHEMA IF NOT EXISTS ESHOP;

--------------------------------------------------------
--  DDL for Table CATEGORY
--------------------------------------------------------
DROP TABLE IF EXISTS ESHOP.CATEGORIES;
CREATE TABLE IF NOT EXISTS ESHOP.CATEGORIES (
    ID INT NOT NULL AUTO_INCREMENT,
    NAME VARCHAR(45) NOT NULL,
    RATING INT NOT NULL,
    IMAGE_PATH VARCHAR(200) NOT NULL,
    PRIMARY KEY (ID),
    UNIQUE INDEX IDX_CATEGORY_ID_UNIQUE (ID ASC),
    UNIQUE INDEX IDX_NAME_UNIQUE (NAME ASC));

--------------------------------------------------------
--  DDL for Table USERS
--------------------------------------------------------
DROP TABLE IF EXISTS ESHOP.USERS;
CREATE TABLE IF NOT EXISTS ESHOP.USERS (
    ID INT NOT NULL AUTO_INCREMENT,
    NAME VARCHAR(45) NOT NULL,
    SURNAME VARCHAR(45) NOT NULL,
    EMAIL VARCHAR(200) NOT NULL,
    PASSWORD VARCHAR(50) NOT NULL,
    DATE_OF_BIRTHDAY VARCHAR(50) NOT NULL,
    BALANCE INT NOT NULL,
    PRIMARY KEY (ID),
    UNIQUE INDEX IDX_USER_ID_UNIQUE (ID ASC),
    UNIQUE INDEX IDX_EMAIL_UNIQUE (EMAIL ASC),
    UNIQUE INDEX IDX_PASSWORD_UNIQUE (PASSWORD ASC));

--------------------------------------------------------
--  DDL for Table ORDERS
--------------------------------------------------------
DROP TABLE IF EXISTS ESHOP.ORDERS;
CREATE TABLE IF NOT EXISTS ESHOP.ORDERS (
    ID INT NOT NULL AUTO_INCREMENT,
    DATE DATE NOT NULL,
    PRICE INT NOT NULL,
    USER_ID INT NOT NULL,
    PRIMARY KEY (ID),
    UNIQUE INDEX IDX_ID_UNIQUE (ID ASC),
    CONSTRAINT FK_ORDERS_USER_ID_USERS_ID
    FOREIGN KEY (USER_ID)
    REFERENCES ESHOP.USERS (ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

--------------------------------------------------------
--  DDL for Table PRODUCTS
--------------------------------------------------------
DROP TABLE IF EXISTS ESHOP.PRODUCTS;
CREATE TABLE IF NOT EXISTS ESHOP.PRODUCTS (
    ID INT NOT NULL AUTO_INCREMENT,
    NAME VARCHAR(200) NOT NULL,
    DESCRIPTION VARCHAR(300) NULL,
    IMAGE_PATH VARCHAR(200) NOT NULL,
    PRICE INT NOT NULL,
    CATEGORY_ID INT NOT NULL,
    PRIMARY KEY (ID),
    UNIQUE INDEX IDX_ID_UNIQUE (ID ASC),
    CONSTRAINT FK_PRODUCTS_CATEGORY_ID_CATEGORIES_ID
    FOREIGN KEY (CATEGORY_ID)
    REFERENCES ESHOP.CATEGORIES (ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

--------------------------------------------------------
--  DDL for Table ORDERS_PRODUCTS
--------------------------------------------------------
DROP TABLE IF EXISTS ESHOP.ORDERS_PRODUCTS;
CREATE TABLE IF NOT EXISTS ESHOP.ORDERS_PRODUCTS (
    ORDER_ID INT NOT NULL,
    PRODUCT_ID INT NOT NULL,
    PRIMARY KEY (ORDER_ID, PRODUCT_ID),
    CONSTRAINT FK_ORDERS_PRODUCTS_ORDER_ID_ORDERS_ID
    FOREIGN KEY (ORDER_ID)
    REFERENCES ORDERS(ID),
    CONSTRAINT FK_ORDERS_PRODUCTS_PRODUCT_ID_PRODUCTS_ID
    FOREIGN KEY (PRODUCT_ID)
    REFERENCES PRODUCTS(ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE);



INSERT INTO eshop.categories (name, rating, image_path)
VALUES ("Mobile phones", 0, "phone1.jpg");
INSERT INTO eshop.categories (name, rating, image_path)
VALUES ("Laptops", 0, "laptops.jpg");
INSERT INTO eshop.categories(name, rating, image_path)
VALUES ("Fridges", 0, "fridge1.jpg");
INSERT INTO eshop.categories (name, rating, image_path)
VALUES ("Cameras", 0, "cameras1.jpg");
INSERT INTO eshop.categories (name, rating, image_path)
VALUES ("GPS Navigators", 0, "navigators.jpg");
INSERT INTO eshop.categories(name, rating, image_path)
VALUES ("Cars", 0, "cars1.jpg");

INSERT INTO eshop.products (name, description, image_path, price, category_id)
VALUES ("Navitel", "Отличный навигатор", "navitel1.jpeg", 2000, 5);
INSERT INTO eshop.products (name, description, image_path, price, category_id)
VALUES ("Garmin", "Хороший навигатор", "garmin1.jpeg", 2000, 5);
INSERT INTO eshop.products (name, description, image_path, price, category_id)
VALUES ("Roadmax", "Такой себе навигатор", "roadmax1.jpeg", 2000, 5);

INSERT INTO eshop.users (NAME, SURNAME, EMAIL, PASSWORD, DATE_OF_BIRTHDAY, BALANCE)
VALUES ("Admin", "A", "Admin", "Admin", "2021-07-03", 0);