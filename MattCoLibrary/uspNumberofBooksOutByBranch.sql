--Gets how many books each branch has checked out right now
CREATE PROC uspNumberofBooksOutByBranch
as

SELECT LB.BranchName, COUNT(BL.BranchID) AS NumberOfBooksOut
FROM BookLoans AS BL
RIGHT JOIN LibraryBranch AS LB
ON BL.BranchID = LB.BranchID
GROUP BY LB.BranchName