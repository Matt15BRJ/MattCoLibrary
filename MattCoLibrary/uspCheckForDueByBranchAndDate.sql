--Checks to see who has books out that are due on a user specified date and branch
CREATE PROC upsCheckForDueByBranchAndDate @Branch varchar(30), @Date date
AS

SELECT B.Title, LM.FirstName, LM.LastName, LM.Street, LM.City, LM.[State]
FROM LibraryBranch AS LB 
INNER JOIN BookLoans AS BL
ON LB.BranchID = BL.BranchID
INNER JOIN LibraryMember AS LM
ON BL.CardNo = LM.CardNo
INNER JOIN Books AS B
ON BL.BookID = B.BookID
WHERE LB.BranchName = @Branch
AND BL.DueDate = @Date