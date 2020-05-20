CREATE TABLE store (
    id SERIAL PRIMARY KEY NOT NULL, 
    department_branch_id integer(10) NOT NULL UNIQUE, 
    name varchar(255) NOT NULL UNIQUE, 
    city varchar(255) NOT NULL, 
    street varchar(255) NOT NULL, 
    house_number integer(10) NOT NULL, 
    coordinate_x float(10) NOT NULL, 
    coordinate_y float(10) NOT NULL, 
    opening_date date NOT NULL, 
    closing_date date, 
    count_product integer(10) NOT NULL, 
    count_product_stockroom integer(10) NOT NULL, 
);
CREATE TABLE client (
    id SERIAL PRIMARY KEY NOT NULL, 
    email varchar(255) UNIQUE, 
    phone varchar(255) UNIQUE, 
    full_name varchar(255) NOT NULL, 
);
CREATE TABLE product (
    id SERIAL PRIMARY KEY NOT NULL, 
    name varchar(255) NOT NULL UNIQUE, 
    price numeric(19, 0) NOT NULL, 
);
CREATE TABLE department (
    id SERIAL PRIMARY KEY NOT NULL, 
    name varchar(255) NOT NULL UNIQUE, 
    opening_date date NOT NULL, 
);
CREATE TABLE department_branch (
    id SERIAL PRIMARY KEY NOT NULL, 
    department_id integer NOT NULL UNIQUE, 
    name varchar(255) NOT NULL UNIQUE, 
    specification varchar(255) NOT NULL, 
    opening_date date NOT NULL, 
);
CREATE TABLE employee (
    id SERIAL PRIMARY KEY NOT NULL, 
    phone varchar(255) NOT NULL UNIQUE, 
    email varchar(255) NOT NULL UNIQUE, 
    full_name varchar(255) NOT NULL, 
    registration varchar(255) NOT NULL, 
    birth_date date NOT NULL, 
);
CREATE TABLE supplier (
    id SERIAL PRIMARY KEY NOT NULL, 
    name varchar(255) NOT NULL UNIQUE, 
    phone varchar(255) NOT NULL UNIQUE, 
    email varchar(255) NOT NULL UNIQUE, 
    city varchar(255) NOT NULL, 
    street varchar(255) NOT NULL, 
    house_number integer NOT NULL, 
);
CREATE TABLE supply (
    id integer(10) NOT NULL UNIQUE, 
    product_id integer(10) NOT NULL UNIQUE, 
    supplier_id integer(10) NOT NULL UNIQUE, 
    employee_id integer(10) NOT NULL UNIQUE, 
    store_id(10) integer(10) NOT NULL UNIQUE, 
    count_product integer(10) NOT NULL, 
    date_delivery date NOT NULL, 
    price numeric(19, 0) NOT NULL, 
    PRIMARY KEY (id, product_id, supplier_id, employee_id, store_id));
CREATE TABLE employee_department_branch (
    employee_id integer(10) NOT NULL UNIQUE, 
    department_branch_id integer(10) NOT NULL UNIQUE, 
    date_start date NOT NULL, date_finish date, 
    PRIMARY KEY (employee_id, department_branch_id));
CREATE TABLE employee_store (
    employee_id integer(10) NOT NULL UNIQUE, 
    store_id integer(10) NOT NULL UNIQUE, 
    date_start date NOT NULL, 
    date_finish date, PRIMARY KEY (employee_id, store_id));
CREATE TABLE employee_department (
    employee_id integer(10) NOT NULL UNIQUE, 
    department_id integer(10) NOT NULL UNIQUE, 
    date_start date NOT NULL, 
    date_finish date, 
    PRIMARY KEY (employee_id, department_id));
CREATE TABLE schedule (
    id SERIAL PRIMARY KEY NOT NULL, 
    employee_id integer(10) NOT NULL UNIQUE, 
    time_start timestamp NOT NULL, 
    time_end timestamp NOT NULL, 
CREATE TABLE stock (
    id SERIAL PRIMARY KEY NOT NULL, 
    name varchar(255) NOT NULL UNIQUE, 
    stock_type varchar(255) NOT NULL, 
CREATE TABLE purchase (
    id SERIAL PRIMARY KEY NOT NULL UNIQUE, 
    client_id integer(10) NOT NULL UNIQUE, 
    stock_id integer(10) NOT NULL UNIQUE, 
    store_id integer(10) NOT NULL UNIQUE, 
    date_purchase date NOT NULL, 
    amount_spent integer(10) NOT NULL, 
    PRIMARY KEY (id, client_id, stock_id, store_id));
CREATE TABLE price_history (
    id SERIAL PRIMARY KEY NOT NULL, 
    product_id integer(10) NOT NULL UNIQUE, 
    date_change date NOT NULL, 
    new_price numeric(19, 0) NOT NULL, 
);
CREATE TABLE product_store (
    id PRIMARY KEY NOT NULL UNIQUE, 
    product_id integer(10) NOT NULL UNIQUE, 
    store_id integer(10) NOT NULL UNIQUE, 
    PRIMARY KEY (id, product_id, store_id));
CREATE TABLE product_propeties (
    id PRIMARY KEY SERIAL NOT NULL, 
    product_id integer(10) NOT NULL UNIQUE, 
    attribute varchar(255) NOT NULL, 
    value varchar(255) NOT NULL, 
);