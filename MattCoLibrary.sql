--Script for creating MattCoLibrary database

USE master
GO

IF EXISTS (SELECT * FROM sys.sysdatabases
WHERE [name] = 'MattCoLibrary')
DROP DATABASE MattCoLibrary
GO

CREATE DATABASE MattCoLibrary
GO

USE MattCoLibrary
GO

CREATE TABLE LibraryBranch
(BranchID int primary key, BranchName varchar(30) NOT NULL, [Address] varchar(50) NOT NULL)
GO

INSERT INTO LibraryBranch
VALUES (1, 'Main', '111 N Main St'),
(2, 'Central', '543 E Reading Ave'),
(3, 'Sharpstown', '34 NW SmartyPants Ln'),
(4, 'Roseland', '681 SW Petal Dr')

CREATE TABLE Books
(BookID int primary key, Title varchar(50) NOT NULL, AuthorID int, PublisherName varchar(50) NOT NULL)
GO

INSERT INTO Books
VALUES
(1, 'Odessa Sea', 1, 'Putnam'),
(2, 'The Girl Who Drank the Moon', 2, 'Algonquin Young Readers'),
(3, 'The Lost Tribe', 6, 'Finders Publishing'),
(4, 'Carrie', 5, 'Doubleday'),
(5, 'The Chase', 1, 'Putnam'),
(6, 'Artic Drift', 1, 'Putnam'),
(7, 'Trojan Odyssey', 1, 'Putnam'),
(8, 'The Wrecker', 1, 'Putnam'),
(9, 'Pirate', 1, 'Putnam'),
(10, 'Without Remorse', 3, 'Putnam'),
(11, 'Command Authority', 3, 'Putnam'),
(12, 'The Fellowship of the Ring', 4, 'Houghton Mifflin Company'),
(13, 'Inferno', 7, 'Doubleday'),
(14, 'Darth Plagueis', 8, 'Del Rey'),
(15, 'Harry Potter and the Sorcerer''s Stone', 9, 'Scholastic'),
(16, 'The Hunger Games', 10, 'Scholastic'),
(17, 'Catching Fire', 10, 'Scholastic'),
(18, 'Dead or Alive', 3, 'Putnam'),
(19, 'The Lost Symbol', 7, 'Doubleday'),
(20, 'The Return of the King', 4, 'Houghton Mifflin Company'),
(21, 'The Two Towers', 4, 'Houghton Mifflin Company'),
(22, 'The Hobbit', 4, 'Houghton Mifflin Company')


CREATE TABLE BookCopies
(BookID int foreign key references Books(BookID), BranchID int, NumberOfCopies int NULL)
GO

INSERT INTO BookCopies
Values
(1,1,3), (1,2,2), (1,3,2), (1,4,2),
(2,1,2), (2,2,2), (2,3,2),
(3,1,2), (3,3,2),(3,4,2),
(4,1,3), (4,2,2), (4,4,4),
(5,1,4), (5,2,3), (5,3,2),
(6,1,3), (6,2,2), (6,3,4),
(7,1,3), (7,2,2), (7,4,2),
(8,1,2), (8,3,2), (8,4,2),
(9,1,3), (9,2,2), (9,3,3), (9,4,3),
(10,1,4), (10,4,2),
(11,1,3), (11,2,2), (11,3,4),
(12,1,5), (12,3,2), (12,4,3),
(13,1,2), (13,2,4), (13,4,2),
(14,1,3), (14,2,2), (14,3,2), (14,4,2),
(15,1,2), (15,3,2), (15,4,2),
(16,1,5),
(17,1,3), (17,2,2), (17,4,2),
(18,1,3), (18,4,4),
(19,1,5), (19,3,3), (19,4,2),
(20,2,3), (20,3,2), (20,4,2),
(21,1,2), (21,2,2), (21,3,2), (21,4,2),
(22,1,3), (22,2,2), (22,3,2), (22,4,3)

CREATE TABLE BookAuthors
( AuthorID int Primary key, AuthorName varchar(50) NOT NULL)
GO

INSERT INTO BookAuthors
VALUES
(1, 'Clive Cussler'),
(2, 'Kelly Barnhill'),
(3, 'Tom Clancy'),
(4, 'JRR Tolkien'),
(5, 'Stephen King'),
(6, 'Albert Finders'),
(7, 'Dan Brown'),
(8, 'James Luceno'),
(9, 'JK Rowling'),
(10, 'Suzanne Collins')

CREATE TABLE Publisher
(PublisherName varchar(50) Primary Key, [Address] varchar(50) NULL, Phone int NULL)
GO

INSERT INTO Publisher
VALUES
('Putnam', '375 Hudson St New York NY 10014', NULL),
('Algonquin Young Readers', 'PO Box 2225 Chapel Hill NC 27515', NULL),
('Finders Publishing', '4545 N Lost St Nowhere VA 23943', 2035556721),
('Doubleday', '1745 Broadway New York NY 10019', 2129407390),
('Houghton Mifflin Company', '215 Park Ave South New York NY 10003', NULL),
('Del Rey', '1745 Broadway New York NY 10019', 2127829000),
('Scholastic', '557 Broadway New York NY 10012', NULL)


CREATE TABLE LibraryMember
(CardNo int primary key, FirstName varchar(20) NOT NULL, LastName varchar(30) NOT NULL, Street varchar(30) NOT NULL, City varchar(30) NOT NULL, [State] varchar(20) NOT NULL, Phone varchar(20) NOT NULL)
GO

INSERT INTO LibraryMember
VALUES
(1, 'Matt', 'Smith', '123 N Market St', 'MattTown', 'OR', '5035551234'),
(2, 'Frank', 'Jones', '4859 SE 12th Ave', 'MattTown', 'OR', '5035558493'),
(3, 'Jackie', 'Jones', '4859 SE 12th Ave', 'MattTown', 'OR', '5035558493'),
(4, 'Jordan', 'Michaelson', '235 S Hoopshore Dr', 'MattTown', 'OR', '5415553928'),
(5, 'Bubba', 'Gump', '7832 Shrimp St', 'Roseland', 'OR', '5415557833'),
(6, 'Howie', 'Doin', '444 SW Happy Ave', 'MattTown', 'OR', '5035557684'),
(7, 'Sara', 'Franklin', '5843 E Cookie Ln', 'MattTown', 'OR', '5415559411'),
(8, 'Leslie', 'Simpson', '4333 NE Jackson St', 'Springfield', 'OR', '5415554545')

CREATE TABLE BookLoans
(BookID int foreign key references Books(BookID), BranchID int, CardNo int, DateOut Date NOT NULL, DueDate Date NOT NULL)
GO

INSERT INTO BookLoans
VALUES
(1,1,1,'20161111','20161212'),
(2,1,1,'20161111','20161212'),
(4,1,1,'20161111','20161212'),
(6,1,1,'20161111','20161212'),
(12,1,1,'20161111','20161212'),
(16,1,1,'20161112','20161213'),
(17,1,1,'20161112','20161213'),
(18,1,1,'20161112','20161213'),
(19,1,1,'20161112','20161213'),
(21,1,1,'20161112','20161213'),
(22,1,1,'20161112','20161213'),
(2,2,2,'20161113','20161214'),
(4,2,2,'20161113','20161214'),
(5,2,2,'20161113','20161214'),
(6,2,2,'20161113','20161214'),
(7,2,2,'20161113','20161214'),
(17,2,2,'20161113','20161214'),
(3,3,3,'20161010','20161111'),
(8,3,3,'20161010','20161111'),
(13,2,3,'20161011','20161112'),
(12,3,3,'20161010','20161111'),
(19,3,3,'20161010','20161111'),
(20,3,3,'20161010','20161111'),
(21,3,3,'20161010','20161111'),
(22,3,3,'20161010','20161111'),
(1,1,4,'20161212','20170113'),
(2,1,4,'20161212','20170113'),
(7,1,4,'20161212','20170113'),
(16,1,4,'20161001','20161102'),
(1,4,5,'20160913','20161014'),
(2,2,5,'20160927','20161028'),
(3,4,5,'20161001','20161102'),
(4,4,5,'20161120','20161221'),
(7,4,5,'20161118','20161219'),
(15,4,5,'20161130','20161231'),
(19,4,6,'20161112','20161213'),
(20,4,6,'20161112','20161213'),
(21,4,6,'20161112','20161213'),
(22,4,6,'20161112','20161213'),
(16,1,7,'20161223','20170124'),
(9,3,8,'20161222','20170123'),
(12,4,8,'20161228','20170129'),
(13,4,8,'20161228','20170129'),
(14,4,8,'20161228','20170129'),
(15,4,8,'20161228','20170129'),
(3,4,8,'20161229','20170130'),
(11,2,8,'20161201','20170102'),
(19,4,8,'20161228','20170129'),
(20,4,8,'20161228','20170129'),
(21,4,8,'20161228','20170129'),
(22,4,8,'20161228','20170129')