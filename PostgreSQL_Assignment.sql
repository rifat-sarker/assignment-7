-- Active: 1742810087227@@127.0.0.1@5432@bookstore_db
CREATE TABLE books (
    id SERIAL PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    author VARCHAR(50) NOT NULL,
    price NUMERIC CHECK (price > 0) ,
    stock INT DEFAULT 0 CHECK (stock >= 0),
    published_year INT NOT NULL
)

select * from books;


