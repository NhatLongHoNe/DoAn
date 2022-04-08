USE NIDAS_SHOES
GO
			 --HomeScript.js
EXEC dbo.NidasShoes_transaction_export

SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
GO
ALTER PROC NidasShoes_transaction_export
AS
BEGIN
	SELECT SUM(TotalCost) AS total ,MONTH(CreatedDate) AS [Month],YEAR(CreatedDate) AS [year]  
	FROM dbo.[Order]
	WHERE OrderStatusID <> 0 AND OrderStatusID <> 6
	GROUP BY MONTH(CreatedDate),YEAR(CreatedDate)
END
GO

SELECT * FROM dbo.[Order]
