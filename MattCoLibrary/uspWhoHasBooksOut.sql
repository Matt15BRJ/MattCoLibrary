--Looks to see who has more than 5 books out and displays the members name, address and number of books
CREATE PROC uspWhoHasBooksOut
AS

SELECT LM.FirstName, LM.LastName, LM.Street, LM.City, LM.[State], COUNT(BL.CardNo) AS BooksOut
FROM LibraryMember AS LM
INNER JOIN BookLoans AS BL
ON LM.CardNo = BL.CardNo
GROUP BY LM.LastName, LM.FirstName, LM.Street, LM.City, LM.[State]
HAVING COUNT(BL.Cardno) > 5
