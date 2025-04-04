-- Active: 1742917181621@@127.0.0.1@5432@bookstore_db@public

-- create relation/table with type
CREATE TABLE books (
    id SERIAL PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    author VARCHAR(50) NOT NULL,
    price DECIMAL(10, 2) CHECK (price > 0) ,
    stock INT DEFAULT 0 CHECK (stock >= 0),
    published_year INT NOT NULL
);
drop table books;
-- get / see all data from books table
select * from books;

-- insert/add multiple data in the table
INSERT INTO books ( title, author, price,stock, published_year) VALUES ('The Pragmatic Programmer','Andrew Hunt', 40.00, 10, 1999), ('Clean Code', 'Robert C. Martin', 35.00, 5, 2008), ('You Do not Know JS','Kyle Simpson', 30.00, 8, 2014), ('Refactoring', 'Martin Fowler', 50.00, 3, 1999), ('Database Design Principles', 'Jane Smith', 20.00, 0, 2018)

INSERT INTO books VALUES (6,'Web Developer', 'Rifat Sarker', 50.00, 5, 2025);



-- create customers relation/table
CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    joined_date DATE DEFAULT CURRENT_DATE 
)


--  get all from customers relation
select * from customers;


-- insert multiple customers data
INSERT INTO customers (name, email) VALUES ('Alice', 'alice@email.com'), ('Bob', 'bob@email.com'), ('Charlie', 'charlie@email.com') 

DROP TABLE customers;


-- create order table
CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    customer_id INTEGER REFERENCES customers(id),
    book_id INTEGER REFERENCES books(id),
    quantity INT CHECK (quantity > 0),
    order_date DATE DEFAULT CURRENT_DATE
)

SELECT * from orders;
DROP TABLE orders;

-- make order
INSERT INTO orders (customer_id,book_id,quantity) VALUES(2,2,1);



--1️⃣ Find books that are out of stock.
SELECT * from books WHERE stock = 0;


--2️⃣ Retrieve the most expensive book in the store.
SELECT * from books WHERE price IN (SELECT max(price) from books);



--3️⃣ Find the total number of orders placed by each customer.
SELECT name, COUNT(o.id) AS total_orders from customers AS c
    JOIN orders AS o on c.id = o.customer_id
    GROUP BY name;


-- 4️⃣ Calculate the total revenue generated from book sales.
select * from orders


-- 5️⃣ List all customers who have placed more than one order.

SELECT name, COUNT(o.id) AS orders_count from customers AS c
    JOIN orders AS o on c.id = o.customer_id
    GROUP BY name HAVING count(o.id) > 1;


-- 6️⃣ Find the average price of books in the store.
SELECT round(AVG(price),2) AS avg_book_price from books;

-- 7️⃣ Increase the price of all books published before 2000 by 10%.

-- 8️⃣ Delete customers who haven't placed any orders.




select * from books;