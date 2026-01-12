
CREATE DATABASE IF NOT EXISTS Library_management;
USE Library_management;
CREATE TABLE Branches (
    Branch_id INT PRIMARY KEY AUTO_INCREMENT,
    Branch_name VARCHAR(100) NOT NULL,
    Location VARCHAR(100) NOT NULL
);
CREATE TABLE Employees (
    Emp_id INT PRIMARY KEY AUTO_INCREMENT,
    Emp_name VARCHAR(100) NOT NULL,
    Position VARCHAR(50),
    Branch_id INT,
    FOREIGN KEY (Branch_id) REFERENCES Branches(Branch_id)
);
CREATE TABLE Members (
    Member_id INT PRIMARY KEY AUTO_INCREMENT,
    Member_name VARCHAR(100) NOT NULL,
    Member_address VARCHAR(255),
    Join_date DATE
);
CREATE TABLE Books (
    Book_id INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(100) NOT NULL,
    Author VARCHAR(100),
    Publisher VARCHAR(50),
    Category VARCHAR(50),
    Rental_price DECIMAL(10,2),
    Total_copies INT,
    Available_copies INT
);
CREATE TABLE Issued_status (
    Issue_id INT PRIMARY KEY AUTO_INCREMENT,
    Member_id INT,
    Book_id INT,
    Emp_id INT,
    Issue_date DATE,
    Due_date DATE,
    FOREIGN KEY (Member_id) REFERENCES Members(Member_id),
    FOREIGN KEY (Book_id) REFERENCES Books(Book_id),
    FOREIGN KEY (Emp_id) REFERENCES Employees(Emp_id)
);
CREATE TABLE Return_status (
    Return_id INT PRIMARY KEY AUTO_INCREMENT,
    Issue_id INT,
    Return_date DATE,
    Fine_amount DECIMAL(5,2),
    FOREIGN KEY (Issue_id) REFERENCES Issued_status(Issue_id)
);
INSERT INTO Branches (Branch_name, Location) VALUES
('Central Library', 'MG Road, Bengaluru'),
('Northside Community Library', 'Sector 17, Chandigarh'),
('West End Branch', 'Andheri West, Mumbai'),
('Eastwood Library', 'Salt Lake, Kolkata'),
('Riverside Branch', 'Marina Beach Road, Chennai');
INSERT INTO Employees (Emp_name, Position, Branch_id) VALUES
('Amit Sharma', 'Librarian', 1),
('Priya Verma', 'Assistant Librarian', 1),
('Ravi Kumar', 'Library Manager', 2),
('Neha Singh', 'Clerk', 2),
('Suresh Reddy', 'Librarian', 3),
('Anita Desai', 'Library Assistant', 3),
('Karan Mehta', 'Assistant Librarian', 4),
('Simran Kaur', 'Librarian', 4),
('Rahul Joshi', 'Library Manager', 5),
('Pooja Nair', 'Library Assistant', 5);
INSERT INTO Members (Member_name, Member_address, Join_date) VALUES
('Rahul Mehta', 'JP Nagar, Bengaluru', '2020-01-15'),
('Sneha Iyer', 'Sector 17, Chandigarh', '2020-02-10'),
('Vikram Patel', 'Andheri West, Mumbai', '2020-03-05'),
('Anjali Nair', 'Salt Lake, Kolkata', '2020-04-20'),
('Rohit Das', 'Marina Beach Road, Chennai', '2020-05-12'),
('Tanya Sharma', 'Indiranagar, Bengaluru', '2024-06-01'),
('Aakash Gupta', 'Chandigarh City Center', '2023-06-03'),
('Meera Joshi', 'Andheri East, Mumbai', '2024-06-05'),
('Varun Reddy', 'Kolkata Sector 5', '2023-06-07'),
('Simran Singh', 'Chennai Besant Nagar', '2024-06-10'),
('Nisha Patel', 'MG Road, Bengaluru', '2024-06-12'),
('Aditya Kumar', 'Sector 18, Chandigarh', '2024-06-15'),
('Rhea Mehta', 'Andheri West, Mumbai', '2022-06-18'),
('Kartik Sharma', 'Salt Lake, Kolkata', '2022-06-20'),
('Isha Nair', 'Marina Beach Road, Chennai', '2022-06-22'),
('Devansh Verma', 'Whitefield, Bengaluru', '2022-06-25'),
('Priya Reddy', 'Chandigarh Sector 17', '2022-06-27'),
('Nikhil Joshi', 'Andheri West, Mumbai', '2024-06-30'),
('Sanya Gupta', 'Kolkata Salt Lake', '2024-07-02'),
('Arjun Das', 'Chennai Adyar', '2024-07-05'),
('Rohini Sharma', 'JP Nagar, Bengaluru', '2022-07-08'),
('Tanmay Iyer', 'Chandigarh City Center', '2022-07-10'),
('Diya Mehta', 'Andheri West, Mumbai', '2024-07-12'),
('Kabir Singh', 'Salt Lake, Kolkata', '2025-07-15'),
('Maya Nair', 'Marina Beach Road, Chennai', '2025-07-18'),
('Ankit Patel', 'Indiranagar, Bengaluru', '2025-07-20'),
('Sakshi Reddy', 'Sector 18, Chandigarh', '2025-07-22'),
('Riya Sharma', 'Andheri East, Mumbai', '2024-07-25'),
('Aditya Nair', 'Kolkata Salt Lake', '2023-07-28'),
('Tara Das', 'Chennai Besant Nagar', '2023-07-30'),
('Manav Mehta', 'MG Road, Bengaluru', '2023-08-02'),
('Aarav Kumar', 'Sector 17, Chandigarh', '2024-08-05'),
('Esha Joshi', 'Andheri West, Mumbai', '2024-08-07'),
('Vivaan Reddy', 'Salt Lake, Kolkata', '2024-08-10'),
('Ira Nair', 'Marina Beach Road, Chennai', '2024-08-12'),
('Krishna Sharma', 'Whitefield, Bengaluru', '2024-08-15'),
('Shreya Gupta', 'Chandigarh Sector 17', '2023-08-17'),
('Neil Patel', 'Andheri West, Mumbai', '2023-08-20'),
('Alisha Singh', 'Kolkata Salt Lake', '2023-08-22'),
('Raghav Das', 'Chennai Adyar', '2023-08-25'),
('Tanya Mehta', 'JP Nagar, Bengaluru', '2023-08-27');
INSERT INTO Books (Title, Author, Publisher, Category, Rental_price, Total_copies, Available_copies) VALUES
('The White Tiger', 'Aravind Adiga', 'HarperCollins', 'Fiction', 50, 10, 10),
('Wings of Fire', 'A.P.J. Abdul Kalam', 'Universities Press', 'Autobiography', 40, 7, 7),
('The Guide', 'R.K. Narayan', 'Indian Thought Publications', 'Fiction', 35, 5, 5),
('God of Small Things', 'Arundhati Roy', 'IndiaInk', 'Fiction', 45, 6, 6),
('Indian Polity', 'M. Laxmikanth', 'McGraw Hill', 'Education', 60, 12, 12),
('Rich Dad Poor Dad', 'Robert Kiyosaki', 'Plata Publishing', 'Finance', 55, 8, 8),
('To Kill a Mockingbird', 'Harper Lee', 'J.B. Lippincott', 'Classic', 60, 9, 9),
('1984', 'George Orwell', 'Secker & Warburg', 'Fiction', 45, 5, 5),
('Atomic Habits', 'James Clear', 'Avery', 'Self-help', 50, 6, 6),
('Thinking Fast and Slow', 'Daniel Kahneman', 'Farrar', 'Psychology', 55, 5, 5),
('The Monk Who Sold His Ferrari', 'Robin Sharma', 'HarperCollins', 'Self-help', 40, 7, 7),
('The Alchemist', 'Paulo Coelho', 'HarperOne', 'Fiction', 50, 8, 8),
('Sapiens', 'Yuval Noah Harari', 'Harper', 'History', 60, 6, 6),
('Homo Deus', 'Yuval Noah Harari', 'Harper', 'History', 55, 5, 5),
('The Subtle Art of Not Giving a F*ck', 'Mark Manson', 'HarperOne', 'Self-help', 45, 7, 7),
('The Psychology of Money', 'Morgan Housel', 'Harriman', 'Finance', 50, 8, 8),
('Clean Code', 'Robert C. Martin', 'Prentice Hall', 'Programming', 65, 5, 5),
('The Pragmatic Programmer', 'Andrew Hunt', 'Addison-Wesley', 'Programming', 60, 6, 6),
('Introduction to Algorithms', 'Cormen et al.', 'MIT Press', 'Education', 75, 5, 5),
('Cracking the Coding Interview', 'Gayle Laakmann', 'CareerCup', 'Programming', 55, 7, 7),
('The Lean Startup', 'Eric Ries', 'Crown', 'Business', 50, 6, 6),
('Zero to One', 'Peter Thiel', 'Crown', 'Business', 55, 5, 5),
('The 7 Habits of Highly Effective People', 'Stephen Covey', 'Free Press', 'Self-help', 50, 6, 6),
('Deep Work', 'Cal Newport', 'Grand Central', 'Self-help', 55, 5, 5),
('Thinking in Bets', 'Annie Duke', 'Portfolio', 'Psychology', 50, 5, 5),
('Guns, Germs, and Steel', 'Jared Diamond', 'W.W. Norton', 'History', 60, 6, 6),
('The Power of Habit', 'Charles Duhigg', 'Random House', 'Self-help', 50, 6, 6),
('Educated', 'Tara Westover', 'Random House', 'Biography', 55, 5, 5),
('Becoming', 'Michelle Obama', 'Crown', 'Biography', 60, 6, 6),
('Steve Jobs', 'Walter Isaacson', 'Simon & Schuster', 'Biography', 60, 5, 5),
('Thinking Like a Lawyer', 'Frederick Schauer', 'Harvard Press', 'Education', 45, 6, 6),
('How to Win Friends and Influence People', 'Dale Carnegie', 'Simon & Schuster', 'Self-help', 50, 6, 6),
('Man’s Search for Meaning', 'Viktor Frankl', 'Beacon', 'Psychology', 50, 5, 5),
('The Richest Man in Babylon', 'George Clason', 'Plata', 'Finance', 50, 6, 6),
('Principles', 'Ray Dalio', 'Simon & Schuster', 'Finance', 55, 5, 5),
('The Art of War', 'Sun Tzu', 'Unknown', 'History', 45, 5, 5),
('Meditations', 'Marcus Aurelius', 'Penguin', 'Philosophy', 50, 5, 5),
('Bhagavad Gita', 'Vyasa', 'Bhaktivedanta', 'Religion', 40, 6, 6),
('The Quran', 'Various', 'Unknown', 'Religion', 50, 5, 5),
('Bible', 'Various', 'Unknown', 'Religion', 55, 5, 5),
('Harry Potter and the Philosopher\'s Stone', 'J.K. Rowling', 'Bloomsbury', 'Fiction', 60, 7, 7),
('Harry Potter and the Chamber of Secrets', 'J.K. Rowling', 'Bloomsbury', 'Fiction', 60, 7, 7),
('Harry Potter and the Prisoner of Azkaban', 'J.K. Rowling', 'Bloomsbury', 'Fiction', 60, 7, 7),
('The Hunger Games', 'Suzanne Collins', 'Scholastic', 'Fiction', 50, 6, 6),
('Catching Fire', 'Suzanne Collins', 'Scholastic', 'Fiction', 50, 6, 6),
('Mockingjay', 'Suzanne Collins', 'Scholastic', 'Fiction', 50, 6, 6),
('Dune', 'Frank Herbert', 'Chilton Books', 'Fiction', 55, 5, 5),
('Foundation', 'Isaac Asimov', 'Gnome Press', 'Fiction', 50, 5, 5);
INSERT INTO Books (Title, Author, Publisher, Category, Rental_price, Total_copies, Available_copies)
VALUES 
('The Palace of Illusions', 'Chitra Banerjee Divakaruni', 'Picador', 'Fiction', 55, 5, 5),
('The Kite Runner', 'Khaled Hosseini', 'Riverhead Books', 'Fiction', 50, 5, 5);

INSERT INTO Issued_status (Member_id, Book_id, Emp_id, Issue_date, Due_date) VALUES
(1,1,1,'2024-12-01','2024-12-15'),
(2,2,2,'2024-12-02','2024-12-16'),
(3,3,3,'2024-12-03','2024-12-17'),
(4,4,4,'2024-12-05','2024-12-19'),
(5,5,5,'2024-12-06','2024-12-20'),
(6,6,6,'2024-12-07','2024-12-21'),
(7,7,7,'2024-12-08','2024-12-22'),
(8,8,8,'2024-12-09','2024-12-23'),
(9,9,9,'2024-12-10','2024-12-24'),
(10,10,10,'2024-12-11','2024-12-25'),
(11,11,1,'2024-12-12','2024-12-26'),
(12,12,2,'2024-12-13','2024-12-27'),
(13,13,3,'2024-12-14','2024-12-28'),
(14,14,4,'2024-12-15','2024-12-29'),
(15,15,5,'2024-12-16','2024-12-30'),
(16,16,6,'2024-12-17','2024-12-31'),
(17,17,7,'2024-12-18','2025-01-01'),
(18,18,8,'2024-12-19','2025-01-02'),
(19,19,9,'2024-12-20','2025-01-03'),
(20,20,10,'2024-12-21','2025-01-04'),
(21,21,1,'2024-12-22','2025-01-05'),
(22,22,2,'2024-12-23','2025-01-06'),
(23,23,3,'2024-12-24','2025-01-07'),
(24,24,4,'2024-12-25','2025-01-08'),
(25,25,5,'2024-12-26','2025-01-09'),
(26,26,6,'2024-12-27','2025-01-10'),
(27,27,7,'2024-12-28','2025-01-11'),
(28,28,8,'2024-12-29','2025-01-12'),
(29,29,9,'2024-12-30','2025-01-13'),
(30,30,10,'2024-12-31','2025-01-14'),
(31,31,1,'2025-01-01','2025-01-15'),
(32,32,2,'2025-01-02','2025-01-16'),
(33,33,3,'2025-01-03','2025-01-17'),
(34,34,4,'2025-01-04','2025-01-18'),
(35,35,5,'2025-01-05','2025-01-19'),
(36,36,6,'2025-01-06','2025-01-20'),
(37,37,7,'2025-01-07','2025-01-21'),
(38,38,8,'2025-01-08','2025-01-22'),
(39,39,9,'2025-01-09','2025-01-23'),
(40,40,10,'2025-01-10','2025-01-24'),
(1,41,1,'2025-01-11','2025-01-25'),
(2,42,2,'2025-01-12','2025-01-26'),
(3,43,3,'2025-01-13','2025-01-27'),
(4,44,4,'2025-01-14','2025-01-28'),
(5,45,5,'2025-01-15','2025-01-29'),
(6,46,6,'2025-01-16','2025-01-30'),
(7,47,7,'2025-01-17','2025-01-31'),
(8,48,8,'2025-01-18','2025-02-01'),
(9,49,9,'2025-01-19','2025-02-02'),
(10,50,10,'2025-01-20','2025-02-03'),
(11,1,1,'2025-01-21','2025-02-04'),
(12,2,2,'2025-01-22','2025-02-05'),
(13,3,3,'2025-01-23','2025-02-06'),
(14,4,4,'2025-01-24','2025-02-07'),
(15,5,5,'2025-01-25','2025-02-08'),
(16,6,6,'2025-01-26','2025-02-09'),
(17,7,7,'2025-01-27','2025-02-10'),
(18,8,8,'2025-01-28','2025-02-11'),
(19,9,9,'2025-01-29','2025-02-12'),
(20,10,10,'2025-01-30','2025-02-13'),
(21,11,1,'2025-01-31','2025-02-14'),
(22,12,2,'2025-02-01','2025-02-15'),
(23,13,3,'2025-02-02','2025-02-16'),
(24,14,4,'2025-02-03','2025-02-17'),
(25,15,5,'2025-02-04','2025-02-18'),
(26,16,6,'2025-02-05','2025-02-19'),
(27,17,7,'2025-02-06','2025-02-20'),
(28,18,8,'2025-02-07','2025-02-21'),
(29,19,9,'2025-02-08','2025-02-22'),
(30,20,10,'2025-02-09','2025-02-23');
INSERT INTO Return_status (Issue_id, Return_date, Fine_amount) VALUES
(71,'2024-12-16',10.00),
(72,'2024-12-17',0.00),
(73,'2024-12-18',5.00),
(74,'2024-12-20',0.00),
(75,'2024-12-21',10.00),
(76,'2024-12-22',0.00),
(77,'2024-12-23',5.00),
(78,'2024-12-24',0.00),
(79,'2024-12-25',10.00),
(80,'2024-12-26',0.00),
(81,'2024-12-27',0.00),
(82,'2024-12-28',5.00),
(83,'2024-12-29',0.00),
(84,'2024-12-30',0.00),
(85,'2024-12-31',10.00),
(86,'2025-01-01',0.00),
(87,'2025-01-02',5.00),
(88,'2025-01-03',0.00),
(89,'2025-01-04',0.00),
(90,'2025-01-05',10.00),
(91,'2025-01-06',0.00),
(92,'2025-01-07',5.00),
(93,'2025-01-08',0.00),
(94,'2025-01-09',0.00),
(95,'2025-01-10',10.00),
(96,'2025-01-11',0.00),
(97,'2025-01-12',5.00),
(98,'2025-01-13',0.00),
(99,'2025-01-14',0.00),
(100,'2025-01-15',10.00),
(101,'2025-01-16',0.00),
(102,'2025-01-17',5.00),
(103,'2025-01-18',0.00),
(104,'2025-01-19',0.00),
(105,'2025-01-20',10.00),
(106,'2025-01-21',0.00),
(107,'2025-01-22',5.00),
(108,'2025-01-23',0.00),
(109,'2025-01-24',0.00),
(110,'2025-01-25',10.00),
(111,'2025-01-26',0.00),
(112,'2025-01-27',5.00),
(113,'2025-01-28',0.00),
(114,'2025-01-29',0.00),
(115,'2025-01-30',10.00),
(116,'2025-01-31',0.00),
(117,'2025-02-01',5.00),
(118,'2025-02-02',0.00),
(119,'2025-02-03',0.00),
(120,'2025-02-04',10.00),
(121,'2025-02-04',5.00),
(122,'2025-02-05',0.00),
(123,'2025-02-06',10.00),
(124,'2025-02-07',0.00),
(125,'2025-02-08',5.00),
(126,'2025-02-09',0.00),
(127,'2025-02-10',10.00),
(128,'2025-02-11',0.00),
(129,'2025-02-12',5.00),
(130,'2025-02-13',0.00),
(131,'2025-02-14',10.00),
(132,'2025-02-15',0.00),
(133,'2025-02-16',5.00),
(134,'2025-02-17',0.00),
(135,'2025-02-18',10.00),
(136,'2025-02-19',0.00),
(137,'2025-02-20',5.00),
(138,'2025-02-21',0.00),
(139,'2025-02-22',10.00),
(140,'2025-02-23',0.00);

INSERT INTO Issued_status (Member_id, Book_id, Emp_id, Issue_date, Due_date) VALUES
(17,7,7,'2025-01-27','2025-02-10'),
(18,8,8,'2025-01-28','2025-02-11'),
(19,9,9,'2025-01-29','2025-02-12'),
(20,10,10,'2025-01-30','2025-02-13'),
(21,11,1,'2025-01-31','2025-02-14'),
(22,12,2,'2025-02-01','2025-02-15'),
(23,13,3,'2025-02-02','2025-02-16'),
(24,14,4,'2025-02-03','2025-02-17'),
(25,15,5,'2025-02-04','2025-02-18'),
(26,16,6,'2025-02-05','2025-02-19');
DELETE FROM Return_status
WHERE Issue_id > 120;

DELETE FROM Issued_status
WHERE Issue_id > 120;

SELECT COUNT(*) AS Total_Issued
FROM Issued_status;

SELECT COUNT(*) AS Total_Returned
FROM Return_status;

SELECT i.Issue_id, i.Member_id, i.Book_id, i.Issue_date, i.Due_date
FROM Issued_status i
LEFT JOIN Return_status r
ON i.Issue_id = r.Issue_id
WHERE r.Issue_id IS NULL;

SELECT COUNT(*) FROM Return_status WHERE Fine_amount > 0;
-- importat query--
-- Pending books --
SELECT i.Issue_id,
       i.Member_id,
       i.Book_id,
       i.Issue_date,
       i.Due_date
FROM Issued_status i
LEFT JOIN Return_status r
       ON i.Issue_id = r.Issue_id
WHERE r.Issue_id IS NULL;
-- Query 2 — Total books --
SELECT COUNT(*) AS Total_Books
FROM Books;
-- Query 3 — Total members --
SELECT COUNT(*) AS Total_Members
FROM Members;
--  Query 4 — Total issued books --
SELECT COUNT(*) AS Total_Issued
FROM Issued_status;
-- Query 5 — Total returned books --
SELECT COUNT(*) AS Total_Returned
FROM Return_status;
-- Query 6 — Member-wise issued book count --

SELECT m.Member_id,
       m.Member_name,
       COUNT(i.Issue_id) AS Total_Issued
FROM Members m
LEFT JOIN Issued_status i
       ON m.Member_id = i.Member_id
GROUP BY m.Member_id, m.Member_name
ORDER BY Total_Issued DESC;
-- Query 7 — Total fine paid per member
SELECT m.Member_id,
       m.Member_name,
       SUM(r.Fine_amount) AS Total_Fine
FROM Members m
JOIN Issued_status i
       ON m.Member_id = i.Member_id
JOIN Return_status r
       ON i.Issue_id = r.Issue_id
GROUP BY m.Member_id, m.Member_name
ORDER BY Total_Fine DESC;
-- Query 8 — Most issued books (popularity)
SELECT b.Book_id,
       b.Title,
       COUNT(i.Issue_id) AS Times_Issued
FROM Books b
JOIN Issued_status i
       ON b.Book_id = i.Book_id
GROUP BY b.Book_id, b.Title
ORDER BY Times_Issued DESC;
-- Query 9 — Category-wise book count
SELECT Category,
       COUNT(*) AS Total_Books
FROM Books
GROUP BY Category;
-- Query 10 — Available vs issued copies per book
SELECT b.Book_id,
       b.Title,
       b.Total_copies,
       b.Available_copies,
       (b.Total_copies - b.Available_copies) AS Issued_Copies
FROM Books b;
-- Query 11 — Overdue books (not returned + past due date)
SELECT i.Issue_id,
       i.Member_id,
       i.Book_id,
       i.Due_date
FROM Issued_status i
LEFT JOIN Return_status r
       ON i.Issue_id = r.Issue_id
WHERE r.Issue_id IS NULL
  AND i.Due_date < CURDATE();
 -- Query 12 — Employee-wise issued handling
SELECT e.Emp_id,
       e.Emp_name,
       COUNT(i.Issue_id) AS Issues_Handled
FROM Employees e
LEFT JOIN Issued_status i
       ON e.Emp_id = i.Emp_id
GROUP BY e.Emp_id, e.Emp_name
ORDER BY Issues_Handled DESC;
-- views-- 
CREATE VIEW Pending_Books AS
SELECT i.Issue_id,
       i.Member_id,
       i.Book_id,
       i.Due_date
FROM Issued_status i
LEFT JOIN Return_status r
       ON i.Issue_id = r.Issue_id
WHERE r.Issue_id IS NULL;


 SELECT * FROM Pending_Books;
-- View 2 — Member-wise fine summary
CREATE VIEW Member_Fine_Summary AS
SELECT m.Member_id,
       m.Member_name,
       SUM(r.Fine_amount) AS Total_Fine
FROM Members m
JOIN Issued_status i
       ON m.Member_id = i.Member_id
JOIN Return_status r
       ON i.Issue_id = r.Issue_id
GROUP BY m.Member_id, m.Member_name;
SELECT * FROM Member_Fine_Summary;

-- View 3 — Book popularity
CREATE VIEW Book_Popularity AS
SELECT b.Book_id,
       b.Title,
       COUNT(i.Issue_id) AS Times_Issued
FROM Books b
JOIN Issued_status i
       ON b.Book_id = i.Book_id
GROUP BY b.Book_id, b.Title;
SELECT * FROM Book_Popularity;
-- Issue a book only if available
-- (Reject if already issued)

DELIMITER $$

CREATE PROCEDURE IssueBook(
    IN p_member_id INT,
    IN p_book_id INT
)
BEGIN
    -- check if already issued and not returned
    IF EXISTS (
        SELECT 1 
        FROM Issued_status i
        LEFT JOIN Return_status r 
            ON i.Issue_id = r.Issue_id
        WHERE i.Book_id = p_book_id
          AND r.Issue_id IS NULL
    ) THEN
        SELECT 'Book already issued — cannot issue again' AS message;

    ELSE
        INSERT INTO Issued_status(Member_id, Book_id, Issue_date, Due_date)
        VALUES(p_member_id, p_book_id, CURDATE(), DATE_ADD(CURDATE(), INTERVAL 7 DAY));

        SELECT 'Book issued successfully' AS message;
    END IF;

END $$

DELIMITER ;
CALL IssueBook(17, 7);

CALL IssueBook(1,1);
-- return procedure --
DELIMITER $$
CREATE PROCEDURE ReturnBook(
    IN p_Issue_id INT,
    IN p_Return_date DATE
)
BEGIN
    DECLARE v_Due_date DATE;
    DECLARE v_Book_id INT;
    DECLARE v_Fine INT DEFAULT 0;

    -- Check if already returned
    IF EXISTS (SELECT 1 FROM Return_status WHERE Issue_id = p_Issue_id) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Book already returned';
    END IF;

    -- Get due date and book id
    SELECT Due_date, Book_id
    INTO v_Due_date, v_Book_id
    FROM Issued_status
    WHERE Issue_id = p_Issue_id;

    -- Calculate fine
    IF p_Return_date > v_Due_date THEN
        SET v_Fine = DATEDIFF(p_Return_date, v_Due_date) * 10;
    END IF;

    -- Insert return record
    INSERT INTO Return_status (Issue_id, Return_date, Fine_amount)
    VALUES (p_Issue_id, p_Return_date, v_Fine);

    -- Increase available copies
    UPDATE Books
    SET Available_copies = Available_copies + 1
    WHERE Book_id = v_Book_id;

    -- Show message
    SELECT CONCAT('Return successful. Fine: ₹', v_Fine) AS Message;

END $$
DELIMITER ;


CALL ReturnBook(141, '2025-02-20');
CALL ReturnBook(150, '2025-02-25');
CALL ReturnBook(149, '2025-02-25');

SELECT COUNT(*) FROM Issued_status;
SELECT COUNT(*) FROM Return_status;
