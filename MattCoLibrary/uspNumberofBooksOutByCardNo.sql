--Looks to see who has how many books out by card number
CREATE PROC uspNumberofBooksOutByCardNo @CardNo int = NULL
as

SELECT LM.CardNo, COUNT(BL.CardNo) AS NumberOfBooksOut
FROM BookLoans AS BL
RIGHT JOIN LibraryMember AS LM
ON BL.CardNo = LM.CardNo
WHERE LM.CardNo = ISNULL(@CardNo,LM.CardNo) 
GROUP BY LM.CardNo
GO