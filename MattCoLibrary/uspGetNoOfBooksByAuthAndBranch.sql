--Gets number of books at a particular branch by author and displays the title, branch name and number of copies

CREATE PROC uspGetNoOfBooksByAuthAndBranch @Author varchar(50), @Branch varchar(30) = NULL
AS

SELECT B.Title, LB.BranchName, BC.NumberOfCopies
FROM BookAuthors AS BA
INNER JOIN Books AS B
ON BA.AuthorID = B.AuthorID
INNER JOIN BookCopies AS BC
ON B.BookID = BC.BookID
INNER JOIN LibraryBranch AS LB
ON BC.BranchID = LB.BranchID
WHERE BA.AuthorName = @Author
AND LB.BranchName = ISNULL(@Branch, LB.Branchname)