--looks for number of books at each branch by title and branch name
CREATE PROC uspNumberOfCopiesByBranch @Title varchar(50), @Branch varchar(30)
AS

SELECT B.Title, BC.NumberOfCopies, LB.BranchName
FROM Books AS B
INNER JOIN BookCopies AS BC
ON B.BookID = BC.BookID
INNER JOIN LibraryBranch AS LB
ON BC.BranchID = LB.BranchID
WHERE B.Title = @Title
AND LB.BranchName = @Branch