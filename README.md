 Online Books Store Database (SQL Project)

 📌 Project Overview

The Online Book Store Database is a SQL-based project designed to manage and analyze data related to books, customers, and orders in an online bookstore system.
This project demonstrates core and advanced SQL concepts such as database design, table relationships, data loading, joins, aggregations, and analytical queries.

 📁 Project Structure

```
SQL project/
│
├── Data/
│   ├── Books.csv        # Book details (title, author, price, stock, etc.)
│   ├── Customers.csv    # Customer information
│   └── Orders.csv       # Order and purchase records
│
├── SQL/
│   └── OnlineBooksStoreDB.sql  # SQL script to create tables and relationships
│
└── README.md
```

---

🛠️ Technologies Used

* **SQL** (relational database)
* **CSV** files for sample data
* Compatible with common SQL tools such as:

  * MySQL Workbench
  * pgAdmin
  * SQL Server Management Studio
  * DBeaver

---

  Database Description

The database represents an online bookstore system with the following tables:

* **Books** – stores information about available books
* **Customers** – stores customer details
* **Orders** – stores order transactions linking customers and books

The project demonstrates:

* Primary keys
* Foreign key relationships
* Basic relational database design

---

 🚀 How to Run the Project

 1. Create the Database

1. Open your preferred SQL client
2. Open and run the SQL file:

```sql
SQL/OnlineBooksStoreDB.sql
```

This script will create the database and all required tables.

---

 2. Load Sample Data

Import the CSV files from the `Data/` folder into their corresponding tables:

* `Books.csv` → `Books`
* `Customers.csv` → `Customers`
* `Orders.csv` → `Orders`

Most database tools provide an **Import CSV** or **Data Import Wizard** option.

---

📊 Example SQL Queries

```sql
-- View all books
SELECT * FROM Books;

-- View all customers
SELECT * FROM Customers;

-- View order details with customer and book information
SELECT c.customer_name, b.book_title, o.order_date
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
JOIN Books b ON o.book_id = b.book_id;
```

---

🎯 Use Cases

This project is suitable for:

* SQL learning and practice
* College or university database assignments
* Mini-projects and portfolio demonstrations
* Understanding relational database concepts

---

 📌 Possible Enhancements

* Add payment and shipping tables
* Create views and stored procedures
* Add indexes for better performance
* Connect the database to a backend application

---

📄 License

This project is open for educational and learning purposes.

