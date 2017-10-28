DROP SCHEMA IF EXISTS datamart_schema;
CREATE SCHEMA datamart_schema;
USE datamart_schema;

CREATE TABLE dim_film (
film_id INT AUTO_INCREMENT NOT NULL,
title VARCHAR(255),
rental_rate DECIMAL (4,2) NOT NULL,
PRIMARY KEY (film_id)
);

CREATE TABLE dim_actor (
actor_id INT AUTO_INCREMENT NOT NULL,
first_name VARCHAR(255) NOT NULL,
last_name VARCHAR(255) NOT NULL,
PRIMARY KEY (actor_id)
);

CREATE TABLE dim_customer (
customer_id INT AUTO_INCREMENT NOT NULL,
first_name VARCHAR(255) NOT NULL,
last_name VARCHAR(255) NOT NULL,
email VARCHAR(255) NOT NULL,
PRIMARY KEY (customer_id)
);

CREATE TABLE dim_category (
category_id INT AUTO_INCREMENT NOT NULL,
name VARCHAR(20) NOT NULL,
PRIMARY KEY (category_id)
);

CREATE TABLE dim_store (
store_id INT NOT NULL AUTO_INCREMENT,
manager_staff_id INT NOT NULL,
address VARCHAR(50) NOT NULL,
address2 VARCHAR(50),
city VARCHAR(50) NOT NULL,
county VARCHAR(50),
eircode VARCHAR(50),
PRIMARY KEY (store_id)
);


CREATE TABLE fact_rental (
rental_id INT AUTO_INCREMENT NOT NULL,
rental_date DATETIME NOT NULL, /* Different computers use different date formats, try TIMESTAMP if DATETIME not working */
return_date DATETIME NOT NULL, /* Different computers use different date formats, try TIMESTAMP if DATETIME not working */
customer_id INT NOT NULL,
category_id INT NOT NULL,
actor_id INT NOT NULL,
film_id INT NOT NULL,
store_id INT NOT NULL,
PRIMARY KEY (rental_id),
FOREIGN KEY (customer_id) REFERENCES dim_customer(customer_id),
FOREIGN KEY (category_id) REFERENCES dim_category(category_id),
FOREIGN KEY (actor_id) REFERENCES dim_actor(actor_id),
FOREIGN KEY (film_id) REFERENCES dim_film(film_id),
FOREIGN KEY (store_id) REFERENCES dim_store(store_id)
);
  