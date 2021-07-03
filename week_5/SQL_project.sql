-- The relational model: logical representation of data
-- Data is stored in relations (tables)
-- A relation contains:
--           attributes (columns), tuples (rows)
-- Each attribute has a datatype and can have constraints
-- Datatypes - INTEGER, VARCHAR, BOOL
-- Constraints - Not Null, unique, primary key
-- SQL is not case sensitive

-- command to run sql script - U username -h host_address -d database_name -f script_to_execute
--  psql -U postgres -h 127.0.0.1 -d spiced_academy -f sql/first_query.sql

DROP TABLE IF EXISTS categories;
CREATE TABLE  categories (
    -- column_name datatype contraint
    categoryID INTEGER PRIMARY KEY,
    categoryName VARCHAR NOT NULL,
    description VARCHAR ,
    picture VARCHAR 
    );
\copy categories FROM '/home/marcel/Documents/SpicedProjects/northwind_data_clean/data/categories.csv' WITH NULL as 'NULL' DELIMITER ',' CSV HEADER;


DROP TABLE IF EXISTS customers;
CREATE TABLE  customers (
    -- column_name datatype contraint
    customerID VARCHAR PRIMARY KEY,
    companyName VARCHAR NOT NULL,
    contactName VARCHAR NOT NULL,
    contactTitle VARCHAR NOT Null,
    address VARCHAR ,
    city VARCHAR ,
    region VARCHAR ,
    postalCode VARCHAR ,
    country VARCHAR ,
    phone VARCHAR ,
    fax VARCHAR 
    );
\copy customers FROM '/home/marcel/Documents/SpicedProjects/northwind_data_clean/data/customers.csv' WITH NULL as 'NULL' DELIMITER ',' CSV HEADER;


DROP TABLE IF EXISTS employees;
CREATE TABLE  employees (
    -- column_name datatype contraint
    employeeID INTEGER PRIMARY KEY,
    lastName VARCHAR NOT NULL,
    firstName VARCHAR NOT NULL,
    title VARCHAR NOT Null,
    titleOfCourtesy VARCHAR ,
    birthDate TIMESTAMP ,
    hireDate TIMESTAMP ,
    address VARCHAR ,
    city VARCHAR ,
    region VARCHAR ,
    postalCode VARCHAR ,
    country VARCHAR ,
    homePhone VARCHAR ,
    extension INTEGER ,
    photo VARCHAR ,
    notes VARCHAR ,
    reportsTo VARCHAR ,
    photoPath VARCHAR 
    );
\copy employees FROM '/home/marcel/Documents/SpicedProjects/northwind_data_clean/data/employees.csv' WITH NULL as 'NULL' DELIMITER ',' CSV HEADER;


DROP TABLE IF EXISTS regions;
CREATE TABLE  regions (
    -- column_name datatype contraint
    regionID INTEGER PRIMARY KEY,
    regionDescription VARCHAR 
    );
\copy regions FROM '/home/marcel/Documents/SpicedProjects/northwind_data_clean/data/regions.csv' WITH NULL as 'NULL' DELIMITER ',' CSV HEADER;




DROP TABLE IF EXISTS territories;
CREATE TABLE  territories (
    -- column_name datatype contraint
    territoryID INTEGER PRIMARY KEY,
    territoryDescription VARCHAR ,
    regionID INTEGER REFERENCES regions ON DELETE CASCADE
    );
\copy territories FROM '/home/marcel/Documents/SpicedProjects/northwind_data_clean/data/territories.csv' WITH NULL as 'NULL' DELIMITER ',' CSV HEADER;



DROP TABLE IF EXISTS employee_territories;
CREATE TABLE  employee_territories (
    -- column_name datatype contraint
    employeeID INTEGER REFERENCES employees,
    territoryID INTEGER REFERENCES territories
    );
\copy employee_territories FROM '/home/marcel/Documents/SpicedProjects/northwind_data_clean/data/employee_territories.csv' WITH NULL as 'NULL' DELIMITER ',' CSV HEADER;




DROP TABLE IF EXISTS orders;
CREATE TABLE  orders (
    -- column_name datatype contraint
    orderID INTEGER PRIMARY KEY,
    customerID VARCHAR REFERENCES customers ON DELETE CASCADE,
    employeeID INTEGER REFERENCES employees ON DELETE CASCADE,
    orderDate TIMESTAMP ,
    requiredDate TIMESTAMP ,
    shippedDate TIMESTAMP ,
    shipVia INTEGER ,
    freight NUMERIC ,
    shipName VARCHAR ,
    shipAddress VARCHAR ,
    shipCity VARCHAR ,
    shipRegion VARCHAR ,
    shipPostalCode VARCHAR ,
    shipCountry VARCHAR 
    );
\copy orders FROM '/home/marcel/Documents/SpicedProjects/northwind_data_clean/data/orders.csv' WITH NULL as 'NULL' DELIMITER ',' CSV HEADER;


DROP TABLE IF EXISTS suppliers;
CREATE TABLE  suppliers (
    -- column_name datatype contraint
    supplierID INTEGER PRIMARY KEY,
    companyName VARCHAR NOT NULL,
    contactName VARCHAR NOT NULL,
    contactTitle VARCHAR NOT Null,
    address VARCHAR ,
    city VARCHAR ,
    region VARCHAR ,
    postalCode VARCHAR ,
    country VARCHAR ,
    phone VARCHAR ,
    fax VARCHAR ,
    homePage VARCHAR 
    );
\copy suppliers FROM '/home/marcel/Documents/SpicedProjects/northwind_data_clean/data/suppliers.csv' WITH NULL as 'NULL' DELIMITER ',' CSV HEADER;





DROP TABLE IF EXISTS products;
CREATE TABLE  products (
    -- column_name datatype contraint
    productID INTEGER PRIMARY KEY,
    productName VARCHAR NOT NULL,
    supplierID INTEGER REFERENCES suppliers ON DELETE CASCADE,
    categoryID INTEGER REFERENCES categories ON DELETE CASCADE,
    quantityPerUnit VARCHAR NOT NULL,
    unitPrice NUMERIC NOT Null,
    unitsInStock INTEGER NOT Null,
    unitsOnOrder INTEGER NOT Null,
    reorderLevel INTEGER ,
    discontinued INTEGER 
    );
\copy products FROM '/home/marcel/Documents/SpicedProjects/northwind_data_clean/data/products.csv' WITH NULL as 'NULL' DELIMITER ',' CSV HEADER;

DROP TABLE IF EXISTS order_details;
CREATE TABLE  order_details (
    -- column_name datatype contraint
    orderID INTEGER REFERENCES orders ON DELETE CASCADE,
    productID INTEGER REFERENCES products ON DELETE CASCADE,
    unitPrice NUMERIC NOT NULL,
    quantity INTEGER NOT NULL,
    discount NUMERIC 
    );
\copy order_details FROM '/home/marcel/Documents/SpicedProjects/northwind_data_clean/data/order_details.csv' WITH NULL as 'NULL' DELIMITER ',' CSV HEADER;



DROP TABLE IF EXISTS shippers;
CREATE TABLE  shippers (
    -- column_name datatype contraint
    shipperID INTEGER PRIMARY KEY,
    companyName VARCHAR ,
    phone VARCHAR 
    );
\copy shippers FROM '/home/marcel/Documents/SpicedProjects/northwind_data_clean/data/shippers.csv' WITH NULL as 'NULL' DELIMITER ',' CSV HEADER;





