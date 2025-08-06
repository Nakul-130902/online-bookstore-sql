-- Sql Project On Online Book Store!

Create Database Online_Bookstore;

Drop table if exists books;

Create table books(
book_id Serial primary key,
title varchar(100),
author varchar(100),
genre varchar(100),
published_year int,
price numeric(10,2),
stock int
);



Drop table if exists customers;
Create table customers(
customer_id serial primary key,
name varchar(100),
Email varchar(100),
phone varchar(15),
city varchar(50),
country varchar(150)
);




Drop table if exists orders;

Create table orders(
order_id Serial primary key,
customer_id int references customers(customer_id),
book_id int references books(book_id),
order_date Date,
quantity int,
Total_Amount numeric(10,2)
);
Select * from books;
Select * from customers;
Select * from orders;

--Basic Queries

--1. Retrieve  all books in fiction genre.

Select * from books
where genre='Fiction';


--2. Find books published after 1950 year.

Select * from books
where published_year>1950;

--3. List all customers from canada.
Select * from customers
where country='Canada';

--4. Show orders placed in Nov 2023!
Select * from orders
where order_date between '2023-11-01' and '2023-11-30' order by order_date;


--5.Retrive the total_stock of books avaliable.

Select * from books;

select sum(stock) as total_stock
from books;


--6. Find details of most expensive book.

Select * from books
order by price desc limit 1;

--7. Show all customers who ordered more than 3 quantity of book.

Select * from orders
where quantity>3;

--8. Retrieve all orders where total_amount exceeds $90.

Select * from orders
where total_amount>90;


--9. List all genres available in book Table-

Select distinct genre from books;


--10. Find books with lowest stock-

Select * from books
order by stock limit 3;

--11. Calculate total_revenue genrated from all order-

Select sum(total_amount) from orders;



--Advance Queries-

--1. Retrieve total no. of books sold for each genre-


Select * from orders;
Select b.genre, sum(o.quantity) as total_books_sold
from orders o
join books b
on o.book_id=b.book_id
group by b.genre;



--2. Find Average price of books in fantasy genre-

Select avg(price) from books
where genre='Fantasy';


--3. List customers who have placed at least 2 orders-
Select * from books;
Select * from customers;
Select * from orders;


Select o.customer_id ,c.name ,count(o.order_id) as order_count
from orders o
join customers c on o.customer_id=c.customer_id
group by o.customer_id, c.name
having count(order_id)>2;


--4. Find most frequently ordered book.

Select o.book_id, b.title,count(o.order_id) as order_count
from orders o
join books b
on o.book_id=b.book_id
group by o.book_id, b.title
order by order_count desc limit 1;

--5. Show 3 top most expensive books of fantasy genre-

Select * from books
where genre='Fantasy'
order by price desc limit 3;

--6. Retrieve total quantity of books sold by each author-
Select * from books;
Select * from customers;
Select * from orders;

Select b.author, sum(o.quantity) as Total_Books_Sold
from orders o
join books b
on o.book_id=b.book_id
group by b.author;


--7. List the cities whose customers who spent over $300 are located-

Select distinct c.city,total_amount
from orders o
join customers c
on o.customer_id=c.customer_id
where total_amount>300;

--8. Find customers who spent the most on orders-
Select * from books;
Select * from customers;
Select * from orders;

Select c.customer_id, c.name, sum(o.total_amount) as total_spent
from orders o
join customers c
on o.customer_id=c.customer_id
group by c.customer_id, c.name
order by total_spent desc limit 1;





































