create database book;
use book;
CREATE TABLE productlines (
    productLine VARCHAR(50) PRIMARY KEY,
    textDescription VARCHAR(4000),
    htmlDescription MEDIUMTEXT,
    image MEDIUMBLOB
);
CREATE TABLE products (
    productCode VARCHAR(15) PRIMARY KEY,
    productName VARCHAR(70) not null,
    productLine VARCHAR(50) not null,
    foreign key(productLine) references productlines(productLine),
    productScale VARCHAR(10) not null,
    productVendor VARCHAR(50) not null,
    productDescription TEXT not null,
    quantityInStock SMALLINT(6) not null,
    buyPrice DOUBLE not null,
    MSRP DOUBLE not null
);
create table customers (
	customerNumber int(11) primary key,
    customerName varchar(50) not null,
    contactLastName varchar(50) not null,
    contactFirstName varchar(50) not null,
    phone varchar(50) not null,
    addressLine1 varchar(50) not null,
    addressLine2 varchar(50),
    city varchar(50) not null,
    state varchar(50),
    postalCode varchar(15),
    country varchar(50) not null,
    salesRepEmployeeNumber int(11),
    creditLimit double
);
create table orders (
	orderNumber int(11) primary key,
    orderData datetime not null,
    requiredDate datetime not null,
    shippedDate datetime,
    status varchar(15) not null,
    comments text,
    customerNumber int(11) not null,
    foreign key(customerNumber) references customers(customerNumber)
);
CREATE TABLE orderdetails (
    orderNumber INT(11),
    productCode VARCHAR(15),
    PRIMARY KEY (orderNumber , productCode),
    quantityOrdered INT(11) NOT NULL,
    priceEach DOUBLE NOT NULL,
    orderLineNumber SMALLINT(6) NOT NULL,
    FOREIGN KEY (productCode)
        REFERENCES products (productCode),
    FOREIGN KEY (orderNumber)
        REFERENCES orders (orderNumber)
);
CREATE TABLE offices (
    officeCode VARCHAR(10) PRIMARY KEY,
    city VARCHAR(50) NOT NULL,
    phone VARCHAR(50) NOT NULL,
    addressLine1 VARCHAR(50) NOT NULL,
    addressLine2 VARCHAR(50),
    state VARCHAR(50),
    country VARCHAR(50) NOT NULL,
    postalCode VARCHAR(15) NOT NULL,
    territory VARCHAR(10) NOT NULL
);
create table employees(
	employeeNumber int(11) primary key,
    lastName varchar(50) not null,
    firstName varchar(50) not null,
    extension varchar(10) not null,
    email varchar(100) not null,
    officeCode varchar(10) not null,
    foreign key(officeCode) references offices(officeCode),
    reportsTo int(11),
    jobTitle varchar(50) not null
);
create table payments (
	customerNumber int(11),
    checkNumber varchar(50),
    primary key(customerNumber, checkNumber),
    foreign key(customerNumber) references customers(customerNumber),
    paymentDate datetime not null,
    amount double not null
)
