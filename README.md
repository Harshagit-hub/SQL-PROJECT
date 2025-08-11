# SQL-PROJECT

**Library Management System SQL Project**

A database project demonstrating table creation, data insertion, CRUD operations, SQL queries, views, and indexing to efficiently manage library branches, employees, members, books.The goal is to showcase skills in database design, manipulation, and querying.

**Objectives**

1.**Set up the Library Management System Database**: Create and populate the database with tables for branches, employees, members, books, issued status, and return status.

2.**CRUD Operations**: Perform Create, Read, Update, and Delete operations on the data.

3.**CTAS (Create Table As Select)**: Utilize CTAS to create new tables based on query results.

4.**Indexes and Views**: Implement indexes for faster search and create SQL views for simplified data access.

**Project Structure**
Database Creation: Created a database named Library_management.

Table Creation: Created tables for branches, employees, members, books, issued status, and return status. Each table includes relevant columns and relationships.



<pre>  CREATE DATABASE IF NOT EXISTS Library_management;
USE Library_management;
CREATE TABLE Branches (
    Branch_id INT PRIMARY KEY,
    Branch_name VARCHAR(100) NOT NULL,
    Location VARCHAR(100) NOT NULL
);
CREATE TABLE Employees (
    Emp_id INT PRIMARY KEY ,
    Emp_name VARCHAR(100) NOT NULL,
    Position VARCHAR(50),
    Branch_id INT,
    FOREIGN KEY (Branch_id) REFERENCES Branches(Branch_id)
);
CREATE TABLE Members
(
            Member_id VARCHAR(10) PRIMARY KEY,
            Member_name VARCHAR(30),
            Member_address VARCHAR(30),
			Join_date DATE
);
CREATE TABLE Books (
    Book_id INT PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(100),
    Publisher VARCHAR(30),
	Category VARCHAR(30),
	Rental_price DECIMAL(10,2),
    Total_copies INT,
    Available_copies INT
);
CREATE TABLE Issued_status (
    Issue_id INT PRIMARY KEY,
    Member_id VARCHAR(10),          
    Book_id INT,            
    Emp_id INT,             
    Issue_date DATE,
    Due_date DATE,
    FOREIGN KEY (Member_id) REFERENCES Members(Member_id),
    FOREIGN KEY (Book_id) REFERENCES Books(Book_id),
    FOREIGN KEY (Emp_id) REFERENCES Employees(Emp_id)
);
CREATE TABLE Return_status (
    Return_id INT PRIMARY KEY,
    Issue_id INT,
    Return_date DATE,
    Fine_amount DECIMAL(5,2),
    FOREIGN KEY (Issue_id) REFERENCES Issued_status(Issue_id)
); </pre>
**Entity-Relationship Diagram**
![Library Management ER Diagram]("https://github.com/Harshagit-hub/SQL-PROJECT/blob/main/ER%20Diagram.png")

```sql



-- ============================================================

-- Update member address
UPDATE Members
SET Member_address = 'Mumbai'
WHERE Member_id = 'M001';

-- Delete a specific issued record
DELETE FROM Issued_status
WHERE Issue_id = 304;



-- Find all books issued by employee ID 101
SELECT *
FROM Issued_status
WHERE Emp_id = 101;

-- Members who issued more than one book
SELECT Member_id, COUNT(Issue_id) AS Books_Issued
FROM Issued_status
GROUP BY Member_id
HAVING COUNT(Issue_id) > 1;

-- Count total number of books
SELECT COUNT(*) AS TotalBooks
FROM Books;

-- Average rental price of books
SELECT AVG(Rental_price) AS AvgRentalPrice
FROM Books;

-- Number of books in each category
SELECT Category, COUNT(*) AS BookCount
FROM Books
GROUP BY Category
HAVING COUNT(*) > 1
ORDER BY BookCount DESC;

-- Fiction books with rental price less than 50
SELECT Title, Author, Rental_price
FROM Books
WHERE Category = 'Fiction' AND Rental_price < 50;


-- Create table for book issue count
CREATE TABLE Book_Issue_Count AS
SELECT b.Book_id, b.Title, COUNT(ist.Issue_id) AS Issue_Count
FROM Issued_status ist
JOIN Books b ON ist.Book_id = b.Book_id
GROUP BY b.Book_id, b.Title;

-- Total income by category
SELECT Category, SUM(Rental_price) AS Total_Income
FROM Books
GROUP BY Category
ORDER BY Total_Income DESC;

-- Employees and their manager
SELECT e1.Emp_id, e1.Emp_name, e1.Position, b.Branch_name, e2.Emp_name AS Manager
FROM Employees e1
JOIN Branches b ON e1.Branch_id = b.Branch_id
JOIN Employees e2 ON b.Branch_id = e2.Branch_id AND e2.Position = 'Library Manager';

-- Books currently borrowed (not yet returned)
SELECT ist.*
FROM Issued_status ist
LEFT JOIN Return_status rs ON ist.Issue_id = rs.Issue_id
WHERE rs.Return_id IS NULL;

-- Category with highest total issues
SELECT b.Category, COUNT(ist.Issue_id) AS Total_Issues
FROM Issued_status ist
JOIN Books b ON ist.Book_id = b.Book_id
GROUP BY b.Category
ORDER BY Total_Issues DESC
LIMIT 1;

-- Members who haven't borrowed any books
SELECT m.Member_id, m.Member_name
FROM Members m
LEFT JOIN Issued_status ist ON m.Member_id = ist.Member_id
WHERE ist.Issue_id IS NULL;

-- Out of stock books
SELECT Book_id, Title, Available_copies
FROM Books
WHERE Available_copies = 0;

-- Which member borrowed which book (INNER JOIN)
SELECT m.Member_name, b.Title, i.Issue_date, i.Due_date
FROM Issued_status i
INNER JOIN Members m ON i.Member_id = m.Member_id
INNER JOIN Books b ON i.Book_id = b.Book_id;

-- All members and the books they borrowed (LEFT JOIN)
SELECT m.Member_name, b.Title
FROM Members m
LEFT JOIN Issued_status i ON m.Member_id = i.Member_id
LEFT JOIN Books b ON i.Book_id = b.Book_id;

-- Members with more than one borrowed book
SELECT Member_id, Member_name
FROM Members
WHERE Member_id IN (
    SELECT Member_id
    FROM Issued_status
    GROUP BY Member_id
    HAVING COUNT(*) > 1
);

-- ============================================================

-- Create a view for currently borrowed books
CREATE VIEW Current_Borrowed_Books AS
SELECT m.Member_name, b.Title, i.Issue_date, i.Due_date
FROM Issued_status i
JOIN Members m ON i.Member_id = m.Member_id
JOIN Books b ON i.Book_id = b.Book_id;
-- ============================================================
-- Use the view
SELECT * FROM Current_Borrowed_Books;

-- Create index for faster search by book title
CREATE INDEX idx_book_title ON Books (Title);

-- Create index for faster search by member name
CREATE INDEX idx_member_name ON Members (Member_name);
```
Reports
Database Schema: Detailed table structures and relationships.
