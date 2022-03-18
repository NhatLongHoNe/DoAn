
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
SELECT p.*,tpp.ExportPrice,tpi.image FROM product p 
LEFT JOIN dbo.ProductCategory pc ON p.ProductCategoryID = pc.ID  
OUTER APPLY(
	SELECT TOP(1)* FROM dbo.ProductImage i WHERE i.productId = p.ID
	
) AS [tpi]
OUTER APPLY(
	SELECT TOP(1)pp.* FROM dbo.ProductPrice pp 
	JOIN dbo.ProductDetail pd ON pp.ProductDetailID = pd.ID
	WHERE pd.ProductID =p.ID
	ORDER BY pp.CreatedDate DESC
) AS [tpp]
WHERE pc.ParentID = 1

SELECT * FROM dbo.Product
SELECT * FROM dbo.ProductImage
SELECT * FROM dbo.ProductPrice
SELECT * FROM dbo.ProductDetail
SELECT * FROM productcolor
go
-- product detail
 ALTER proc [dbo].[NidasShoes_get_Client_Product_Detail]
@Id int	 ,
@sizeID int,
@colorID int
as
begin
	 declare @whereSql nvarchar(max) = N'',
			@sql nvarchar(max) = N''
	 if ISNULL(@sizeID,'') != ''
		begin
			set @whereSql += N'and  c.id ='+@sizeID+''
		end
	  if ISNULL(@colorID,'') != ''
		begin
			set @whereSql += N'and s.id ='+@colorID+''
		end

	SELECT TOP(1) p.*
	,pc.name [NameProductCategory]
	,pc.Description [DescriptionProductCategory] 
	,c.name [NameColor]
	,c.code [CodeColor]
	,s.name [NameSize]
	,pd.Quantity
	,tpp.ImportPrice
	,tpp.ExportPrice
	,tpp.CreatedDate [LastUpdatedDate]
	,pd.ID	productDetailID
	FROM product p 
	LEFT JOIN dbo.ProductCategory pc ON p.ProductCategoryID = pc.ID  
	LEFT JOIN dbo.ProductDetail	 pd ON p.id =pd.ProductID
	LEFT JOIN ProductColor c ON pd.ColorID	= c.id
	LEFT JOIN ProductSize s ON pd.SizeID= s.id
	OUTER APPLY(
		SELECT TOP(1) * FROM dbo.ProductPrice pp WHERE pd.id = pp.ProductDetailID
		ORDER BY pp.CreatedDate DESC
	) AS tpp
	WHERE p.ID = @Id + @whereSql
end
GO

[NidasShoes_get_Client_Product_Detail] 4 ,0,0


     CREATE proc [dbo].[forgot_password]
@email nvarchar(255),
@newPass nvarchar(255)
as
begin
	if exists (select top 1 * from [User] where Email = @email)
	begin
		update [User]
		set HashedPassword = @newPass
		where Email = @email
	end
	select @@ROWCOUNT
end

	--OUTER APPLY(
	--	SELECT TOP(1)* FROM dbo.ProductImage i WHERE i.productId = p.ID
	
	--) AS [tpi]
	--OUTER APPLY(
	--	SELECT TOP(1)pp.* FROM dbo.ProductPrice pp 
	--	JOIN dbo.ProductDetail pd ON pp.ProductDetailID = pd.ID
	--	WHERE pd.ProductID =p.ID
	--	ORDER BY pp.CreatedDate DESC
	--) AS [tpp]