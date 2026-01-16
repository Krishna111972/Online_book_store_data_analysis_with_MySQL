-- Create Database
CREATE DATABASE OnlineBookStore;
USE onlineBookStore;

-- Create Tables
drop table if exists Books;
CREATE TABLE Books(
Book_ID serial primary key,
Title varchar(100),
Author varchar(100),
Genre varchar(50),
Published_Year int,
Price numeric(10,2),
Stock int 
);

drop table if exists Customers;
CREATE TABLE Customers (
Customer_ID serial primary key,
Name varchar(100),
Email varchar(100),
Phone varchar(15),
City varchar(30),
Country varchar(100)
);

 drop table if exists Orders;
CREATE TABLE Orders (
Order_ID serial primary key,
Customer_ID	int references Customers(Customer_ID),
Book_ID	int references Books(Book_ID),
Order_Date date,
Quantity int,
Total_Amount numeric(10,2)
);


LOAD DATA LOCAL INFILE 'E:/SQL project/Data/Books.csv'
INTO TABLE Books
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(Book_ID, Title, Author, Genre, Published_Year, Price, Stock)
SET Book_ID = NULL;

LOAD DATA LOCAL INFILE 'E:/SQL project/Data/Customers.csv'
INTO TABLE Customers
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(Customer_ID,Name,Email,Phone,City,Country)
SET Customer_ID = NULL;

LOAD DATA LOCAL INFILE 'E:/SQL project/Data/Orders.csv'
INTO TABLE Orders
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(Order_ID,Customer_ID,Book_ID,Order_Date,Quantity,Total_Amount)
SET Order_ID = NULL;

show warnings;

select * from Books;
select * from Customers;
select * from Orders;

-- 1) retrive all the books in fiction genre.
select * from books
where genre = "fiction" ;

-- 2) find books published after year 1950.
select * from books
where Published_year > "1950";

-- 3) List all the customers from canada.
select * from customers
where country='Canada';

-- 4) show orders placed in november 2023.
select * from orders
where Order_Date between '2023-11-01' and '2023-11-30';

-- 5) retrive the total stocks of books available.
select sum(stock) as total_stock
from books;

-- 6) find the details of most expensive books.
select * from books order by price desc;

-- 7) show all customers who ordered more than one quantifty of books.
select * from orders 
where quantity > 1;

-- 8) Retrive all the orders where the total amount exxeeds more than 20 $.
select * from orders
where Total_Amount > 20; 

-- 9) List all generes available in the books table.
select distinct genre from books;

-- 10) find the book with the lowest stock.
select * from books order by stock limit 1;

-- 11) Calculate the total revenue generated from all orders
select sum(Total_amount) as revenue from orders;

-- ADVANCE QUESTIONS
-- 1) retrive the total number of books sold for each genre
select b.genre , sum(o.quantity) as total_books_sold
from orders o
join books b on o.book_id = b.book_id
group by b.genre;

-- 2) find the average price of books in the fantasy genre.
select avg(price) as average_price
from books where genre = 'Fantasy';

-- 3) list customers who have placed atleast two orders.
select o.customer_id , c.name , COUNT(o.order_id) as order_count
from orders o
join customers c on o.customer_id = c.customer_id
group by o.customer_id ,c.name
having count(order_id)>=2;

-- 4) find the most frequently order book.
select o.book_id , b.title, count(o.order_id) as ORDER_COUNT
from orders o
join books b on o.book_id=b.book_id
group by b.book_id 
order by ORDER_COUNT DESC LIMIT 1;

-- 5) show the top 3 most expensive books by 'fantacy' genre.
select * from books
where genre = 'fantasy'
order by price desc limit 3;

-- 6) retrive the total quantity of books sold by each auther.
select b.author , sum(o.quantity) as Total_books_sold
from orders o
join books b on b.book_id = o.book_id
group by b.Author;

 -- 7) List the cities where customers who spent over 30$ are located.
 select distinct c.City, o.Total_Amount 
 from orders o 
 join Customers c on o.Customer_ID = c.Customer_ID
 where o.Total_Amount>=30;

 -- 8) Find the customers who spent most on orders.
  select  c.Customer_ID, c.Name, sum(o.Total_Amount) as total_spent
 from orders o 
 join Customers c on o.Customer_ID = c.Customer_ID
 group by c.Customer_ID , c.Name
 order by total_spent DESC;
 
 -- 9) Calculate the stock remaining after fullfilling all orders.
 select b.Book_ID , b.title, b.stock,coalesce(sum(o.Quantity),0) as order_quantity,
 b.stock-coalesce(sum(o.Quantity),0) as remaining_quantity
 from books b
 left join orders o on b.Book_ID=o.order_ID
 group by b.book_ID
 order by b.book_ID;