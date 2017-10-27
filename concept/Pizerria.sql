#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: customers
#------------------------------------------------------------

CREATE TABLE customers(
        customer_id int (11) Auto_increment  NOT NULL ,
        first_name  Varchar (55) ,
        last_name   Varchar (55) ,
        phone       Varchar (10) ,
        PRIMARY KEY (customer_id )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: orders
#------------------------------------------------------------

CREATE TABLE orders(
        order_id    int (11) Auto_increment  NOT NULL ,
        delivery_at Date ,
        status      Bool ,
        total_price Float ,
        customer_id Int ,
        PRIMARY KEY (order_id )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: pizzas
#------------------------------------------------------------

CREATE TABLE pizzas(
        pizza_id     int (11) Auto_increment  NOT NULL ,
        name         Varchar (55) ,
        price_little Int ,
        price_big    Int ,
        status       Bool ,
        PRIMARY KEY (pizza_id )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: products
#------------------------------------------------------------

CREATE TABLE products(
        product_id    int (11) Auto_increment  NOT NULL ,
        name          Varchar (55) ,
        product_price Float ,
        PRIMARY KEY (product_id )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: pizza_order
#------------------------------------------------------------

CREATE TABLE pizza_order(
        size     Bool ,
        pizza_id Int NOT NULL ,
        order_id Int NOT NULL ,
        PRIMARY KEY (pizza_id ,order_id )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: product_pizza
#------------------------------------------------------------

CREATE TABLE product_pizza(
        product_id Int NOT NULL ,
        pizza_id   Int NOT NULL ,
        PRIMARY KEY (product_id ,pizza_id )
)ENGINE=InnoDB;

ALTER TABLE orders ADD CONSTRAINT FK_orders_customer_id FOREIGN KEY (customer_id) REFERENCES customers(customer_id);
ALTER TABLE pizza_order ADD CONSTRAINT FK_pizza_order_pizza_id FOREIGN KEY (pizza_id) REFERENCES pizzas(pizza_id);
ALTER TABLE pizza_order ADD CONSTRAINT FK_pizza_order_order_id FOREIGN KEY (order_id) REFERENCES orders(order_id);
ALTER TABLE product_pizza ADD CONSTRAINT FK_product_pizza_product_id FOREIGN KEY (product_id) REFERENCES products(product_id);
ALTER TABLE product_pizza ADD CONSTRAINT FK_product_pizza_pizza_id FOREIGN KEY (pizza_id) REFERENCES pizzas(pizza_id);
