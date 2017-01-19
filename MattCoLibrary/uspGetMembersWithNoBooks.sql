--looks for members who have no books checked out
CREATE PROC uspGetMembersWithNoBooks
AS

SELECT LM.FirstName, LM.LastName, BL.CardNo AS BooksOut
FROM BookLoans AS BL
RIGHT JOIN LibraryMember AS LM
ON BL.CardNo = LM.CardNo
WHERE BL.CardNo IS NULL
