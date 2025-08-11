CREATE DATABASE IF NOT EXISTS Library_management;
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
);
INSERT INTO Branches (Branch_id, Branch_name, Location) VALUES
(1, 'Central Library', 'MG Road, Bengaluru'),
(2, 'Northside Community Library', 'Sector 17, Chandigarh'),
(3, 'West End Branch', 'Andheri West, Mumbai'),
(4, 'Eastwood Library', 'Salt Lake, Kolkata'),
(5, 'Riverside Branch', 'Marina Beach Road, Chennai');
INSERT INTO Employees (Emp_id, Emp_name, Position, Branch_id) VALUES
(101, 'Amit Sharma', 'Librarian', 1),
(102, 'Priya Verma', 'Assistant Librarian', 1),
(103, 'Ravi Kumar', 'Library Manager', 2),
(104, 'Neha Singh', 'Clerk', 3),
(105, 'Suresh Reddy', 'Librarian', 4),
(106, 'Anita Desai', 'Library Assistant', 5);
INSERT INTO Members (Member_id, Member_name, Member_address, Join_date) VALUES
('M001', 'Rahul Mehta', 'JP Nagar, Bengaluru', '2024-01-15'),
('M002', 'Sneha Iyer', 'Sector 17, Chandigarh', '2024-02-10'),
('M003', 'Vikram Patel', 'Andheri West, Mumbai', '2024-03-05'),
('M004', 'Anjali Nair', 'Salt Lake, Kolkata', '2024-04-20'),
('M005', 'Rohit Das', 'Marina Beach Road, Chennai', '2024-05-12');
INSERT INTO Books (Book_id, Title, Author, Publisher, Category, Rental_price, Total_copies, Available_copies) VALUES
(201, 'The White Tiger', 'Aravind Adiga', 'HarperCollins', 'Fiction', 50.00, 10, 8),
(202, 'Wings of Fire', 'A.P.J. Abdul Kalam', 'Universities Press', 'Autobiography', 40.00, 7, 5),
(203, 'The Guide', 'R.K. Narayan', 'Indian Thought Publications', 'Fiction', 35.00, 5, 3),
(204, 'God of Small Things', 'Arundhati Roy', 'IndiaInk', 'Fiction', 45.00, 6, 4),
(205, 'Indian Polity', 'M. Laxmikanth', 'McGraw Hill', 'Education', 60.00, 12, 10),
(206, 'Rich Dad Poor Dad', 'Robert Kiyosaki', 'Plata Publishing', 'Finance', 55.00, 8, 6);
INSERT INTO Issued_status (Issue_id, Member_id, Book_id, Emp_id, Issue_date, Due_date) VALUES
(301, 'M001', 201, 101, '2024-06-01', '2024-06-15'),
(302, 'M002', 202, 102, '2024-06-05', '2024-06-19'),
(303, 'M003', 205, 103, '2024-06-07', '2024-06-21'),
(304, 'M004', 203, 105, '2024-06-10', '2024-06-24');
INSERT INTO Return_status (Return_id, Issue_id, Return_date, Fine_amount) VALUES
(401, 301, '2024-06-16', 0.00),
(402, 302, '2024-06-22', 5.00),
(403, 303, '2024-06-25', 0.00);

INSERT INTO Books (Book_id, Title, Author, Publisher, Category, Rental_price, Total_copies, Available_copies)
VALUES (207, 'To Kill a Mockingbird', 'Harper Lee', 'J.B. Lippincott & Co.', 'Classic', 60.00, 9, 9);

UPDATE Members
SET Member_address = ' Mumbai '
WHERE Member_id = 'M001';
 
DELETE FROM Issued_status
WHERE Issue_id = 304;

SELECT * 
FROM Issued_status
WHERE Emp_id = 101;

SELECT 
Member_id,
COUNT(Issue_id) AS Books_Issued
FROM Issued_status
GROUP BY Member_id
HAVING COUNT(Issue_id) > 1;

CREATE TABLE Book_Issue_Count AS
SELECT 
    b.Book_id,
    b.Title,
    COUNT(ist.Issue_id) AS Issue_Count
FROM Issued_status ist
JOIN Books b ON ist.Book_id = b.Book_id
GROUP BY b.Book_id, b.Title;

SELECT 
    Category,
    SUM(Rental_price) AS Total_Income
FROM Books
GROUP BY Category
ORDER BY Total_Income DESC;

SELECT 
    e1.Emp_id,
    e1.Emp_name,
    e1.Position,
    b.Branch_name,
    e2.Emp_name AS Manager
FROM Employees e1
JOIN Branches b ON e1.Branch_id = b.Branch_id
JOIN Employees e2 ON b.Branch_id = e2.Branch_id AND e2.Position = 'Library Manager';

SELECT ist.*
FROM Issued_status ist
LEFT JOIN Return_status rs ON ist.Issue_id = rs.Issue_id
WHERE rs.Return_id IS NULL;

SELECT 
    b.Category,
    COUNT(ist.Issue_id) AS Total_Issues
FROM Issued_status ist
JOIN Books b ON ist.Book_id = b.Book_id
GROUP BY b.Category
ORDER BY Total_Issues DESC
LIMIT 1;

SELECT m.Member_id, m.Member_name
FROM Members m
LEFT JOIN Issued_status ist ON m.Member_id = ist.Member_id
WHERE ist.Issue_id IS NULL;

SELECT Book_id, Title, Available_copies
FROM Books
WHERE Available_copies = 0;

-- Find all books in the 'Fiction' category with rental price less than 50
SELECT Title, Author, Rental_price
FROM Books
WHERE Category = 'Fiction' AND Rental_price < 50;

-- Count total number of books
SELECT COUNT(*) AS TotalBooks FROM Books;

-- Find average rental price of books
SELECT AVG(Rental_price) AS AvgRentalPrice FROM Books;

-- Find number of books in each category
SELECT Category, COUNT(*) AS BookCount
FROM Books
GROUP BY Category
HAVING COUNT(*) > 1
ORDER BY BookCount DESC;


-- Show which member borrowed which book (INNER JOIN)
SELECT m.Member_name, b.Title, i.Issue_date, i.Due_date
FROM Issued_status i
INNER JOIN Members m ON i.Member_id = m.Member_id
INNER JOIN Books b ON i.Book_id = b.Book_id;

-- Show all members and the books they borrowed (LEFT JOIN)
SELECT m.Member_name, b.Title
FROM Members m
LEFT JOIN Issued_status i ON m.Member_id = i.Member_id
LEFT JOIN Books b ON i.Book_id = b.Book_id;

-- Find members who have borrowed more than 1 book
SELECT Member_id, Member_name
FROM Members
WHERE Member_id IN (
    SELECT Member_id
    FROM Issued_status
    GROUP BY Member_id
    HAVING COUNT(*) > 1
);
-- Create a view for currently borrowed books
CREATE VIEW Current_Borrowed_Books AS
SELECT m.Member_name, b.Title, i.Issue_date, i.Due_date
FROM Issued_status i
JOIN Members m ON i.Member_id = m.Member_id
JOIN Books b ON i.Book_id = b.Book_id;

-- Use the view
SELECT * FROM Current_Borrowed_Books;
-- Create index for faster search by book title
CREATE INDEX idx_book_title ON Books (Title);

-- Create index for member name
CREATE INDEX idx_member_name ON Members (Member_name);
