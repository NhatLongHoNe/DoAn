USE NIDAS_SHOES
GO

SELECT * FROM dbo.ProductDetail pd  
JOIN dbo.Product p ON pd.ProductID = p.ID 
JOIN dbo.ProductCategory pc ON p.ProductCategoryID = pc.ID
JOIN dbo.ProductColor c ON pd.ColorID = c.ID
JOIN dbo.ProductSize s ON pd.SizeID = s.ID
OUTER APPLY(
	SELECT TOP(1)* FROM dbo.ProductPrice pp 
	WHERE pp.ProductDetailID = pd.ID 
	order by pp.CreatedDate desc
) AS pr
WHERE p.ID = 4

SELECT * FROM dbo.ProductDetail

-- get product hiển thị ra ngoài
SELECT * FROM product p 
LEFT JOIN dbo.ProductCategory pc ON p.ProductCategoryID = pc.ID  
WHERE pc.ParentID = 1

SELECT * FROM dbo.Product

