--looks to see how many copies of a book are at each branch by title
CREATE PROC uspNumberOfCopiesAllBranches @title varchar(40)
AS

SELECT B.Title, LB.BranchName, BC.NumberOfCopies
FROM LibraryBranch AS LB
INNER JOIN BookCopies AS BC
ON LB.BranchID = BC.BranchID
INNER JOIN Books AS B
ON BC.BookID = B.BookID
WHERE B.Title = @title
OR BC.NumberOfCopies IS NULL
GO