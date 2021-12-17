use gameshop
go
--A@123456789
create proc shopgame_get_banner
as
begin
	select * from slide
	order by id
end

exec shopgame_get_blog

select * from slide where 1=1
go

alter proc shopgame_get_banner
@BaseParam BaseParamType readonly,
@Totals int  out,
@PageCount int out
as
begin
	declare @Search nvarchar(max),
			@PageSize int,
			@PageNumber int

	declare @whereSql nvarchar(max) = 'where status = 1 and 1=1',
			@sql nvarchar(max) = ''
	
	select top 1 @Search = Search,@PageSize = PageSize,@PageNumber = PageNumber from @BaseParam
	select @Totals = count(Id) from slide
	set @PageCount = iif(@Totals % @PageSize=0,@Totals / @PageSize,@Totals / @PageSize+1)
	if ISNULL(@Search,'') != ''
		begin
			set @whereSql += N'and (Name like N''%'+@Search+'%'')'
		end
	set @sql = N'
		
		select 
		* from slide
		' + @whereSql + '
		order by [DisplayOrder]
		offset (@PageSize*(@PageNumber-1)) rows fetch next @PageSize rows only'
	print @Sql
	declare @Param nvarchar(max) = N'@Search nvarchar(max),@PageSize int,@PageNumber int,@Totals int,@PageCount int'
	EXEC sp_executesql @Sql,@Param,@Search,@PageSize,@PageNumber,@Totals,@PageCount
end

go

declare @BaseParam BaseParamType 
insert into @BaseParam values (N'',10,1)
exec shopgame_get_blog @BaseParam,1,1


create type BaseParamType as table(
	Search nvarchar(max),
	PageSize int,
	PageNumber int
)


EXEC [dbo].[shopgame_create_cardadmin] @id=0, @CardNumber = 0866721300,
@CardType =2 ,
@CardHolder =243,
@CardBranch =453,
@BankName = 46

go

alter proc [dbo].[shopgame_get_list_product_byProductId]
@CategoryId int
as
begin
	select p.*,pc.Name as CategoryName, pr.Price as Price from Product p
	join ProductCategory pc on p.CategoryId = pc.Id
	join ProductPrice pr on  pr.ProductId = (select top 1 ProductId from ProductPrice pri where pri.ProductId = p.Id  order by Id desc)
	where p.CategoryId = @CategoryId
end

select * from product p
	join productcategory pc on p.CategoryId = pc.id
	join ProductPrice pr on pr.productid =1
	go

alter proc [dbo].[shopgame_get_list_product_byProductCategoryId]
@BaseParam BaseParamType readonly,
@Totals int  out,
@PageCount int out,
@ProductCategoryId int out
as
begin
	declare @Search nvarchar(max),
			@PageSize int,
			@PageNumber int

	declare @whereSql nvarchar(max) = 'where status =1 and 1=1',
			@sql nvarchar(max) = ''
	
	select top 1 @Search = Search,@PageSize = PageSize,@PageNumber = PageNumber from @BaseParam
	select @Totals = count(Id) from Product
	set @PageCount = iif(@Totals % @PageSize=0,@Totals / @PageSize,@Totals / @PageSize+1)
	if ISNULL(@Search,'') != ''
		begin
			set @whereSql += N'and (p.Name like N''%'+@Search+'%'' or p.Code like N''%'+@Search+'%'' or p.Rank like N''%'+@Search+'%'' 
								or p.SoTuong like N''%'+@Search+'%'' or p.SoTrangPhuc like N''%'+@Search+'%'' 
								or p.Id like N''%'+@Search+'%'' or pr.price like N''%'+@Search+'%'' 
								or p.LoaiTaiKhoan like N''%'+@Search+'%'' or p.DangKy like N''%'+@Search+'%''
								or p.VIP like N''%'+@Search+'%'' or p.AccUserName like N''%'+@Search+'%'')'
		end
	if @ProductCategoryId > 0
		begin
			set @whereSql += N'and p.CategoryId ='+ CONVERT(varchar, @ProductCategoryId)+''
		end
		print @WhereSql
	set @sql = N'
		select p.*,pc.Name as CategoryName,pr.Price,pr.CreatedDate from Product p
			join ProductCategory pc on p.CategoryId = pc.Id
			outer apply(
			select top 1 * from ProductPrice pri
			where pri.ProductId = p.Id
			order by pri.CreatedDate desc
			) as pr
		' + @whereSql + '
		order by p.Id
		offset (@PageSize*(@PageNumber-1)) rows fetch next @PageSize rows only'
	print @Sql
	declare @Param nvarchar(max) = N'@Search nvarchar(max),@PageSize int,@PageNumber int,@Totals int,@PageCount int, @ProductCategoryId int'
	EXEC sp_executesql @Sql,@Param,@Search,@PageSize,@PageNumber,@Totals,@PageCount, @ProductCategoryId
end
go

declare @BaseParam BaseParamType 
insert into @BaseParam values (N'',10,1)
exec [shopgame_get_list_product_byProductCategoryId] @BaseParam,1,1,1
go

--true
ALTER proc [dbo].[shopgame_get_skin_byId]
@Id int
as
begin
	select s.*,sc.Name as SkinCategoryName, pk.price  from Skin s
		join SkinCategory sc on s.SkinCategoryId = sc.Id
		outer apply( select top 1 * from SkinPrice pri where pri.SkinId = s.Id  order by Id desc)
		as pk
		where s.id = @Id
end
go



alter proc [dbo].[shopgame_get_list_skin_bySkinCategoryId]
@BaseParam BaseParamType readonly,
@Totals int  out,
@PageCount int out,
@SkinCategoryId int out
as
begin
	declare @Search nvarchar(max),
			@PageSize int,
			@PageNumber int

	declare @whereSql nvarchar(max) = 'where 1=1',
			@sql nvarchar(max) = ''
	
	select top 1 @Search = Search,@PageSize = PageSize,@PageNumber = PageNumber from @BaseParam
	select @Totals = count(Id) from Product
	set @PageCount = iif(@Totals % @PageSize=0,@Totals / @PageSize,@Totals / @PageSize+1)
	if ISNULL(@Search,'') != ''
		begin
			set @whereSql += N'and (s.Name like N''%'+@Search+'%'' 
							or pk.Price like N''%'+@Search+'%''
							)'
		end
	if @SkinCategoryId > 0
		begin
			set @whereSql += N'and s.SkinCategoryId ='+ CONVERT(varchar, @SkinCategoryId)+''
		end
		print @WhereSql
	set @sql = N'
		select s.*,sc.Name as SkinCategoryName, pk.price from Skin s
		join SkinCategory sc on s.SkinCategoryId = sc.Id
		outer apply( select top 1 * from SkinPrice pri where pri.SkinId = s.id  order by Id desc)
		as pk
		' + @whereSql + '
		order by s.Id
		offset (@PageSize*(@PageNumber-1)) rows fetch next @PageSize rows only'
	print @Sql
	declare @Param nvarchar(max) = N'@Search nvarchar(max),@PageSize int,@PageNumber int,@Totals int,@PageCount int, @SkinCategoryId int'
	EXEC sp_executesql @Sql,@Param,@Search,@PageSize,@PageNumber,@Totals,@PageCount, @SkinCategoryId
end
go

declare @BaseParam BaseParamType 
insert into @BaseParam values (N'',10,1)
exec [shopgame_get_list_skin_bySkinCategoryId] @BaseParam,1,1,2
go


alter proc [dbo].[shopgame_create_or_update_client_login]
@Id int,
@UserName nvarchar(255),
@HashedPassword nvarchar(255),
@Name nvarchar(255),
@Email nvarchar(255),
@Balance decimal(18,2),
@Phone nvarchar(255)
as
begin
	if @Id = 0
		begin
			if not exists (select * from [dbo].[User] where UserName = @UserName)
				begin
					insert into [dbo].[User] values (@UserName,
					@HashedPassword,
					@Name,
					@Email,
					@Balance,
					@Phone,
					GETDATE())
					select 1
				end
			else
				begin
					select 0
				end
		end
	else
		begin
			if not exists (select * from [dbo].[User] where UserName = @UserName and @Id = Id)
				begin
					update  [dbo].[User]
					set UserName = @UserName,
						HashedPassword = @HashedPassword,
						[Name] = @Name ,
						Email = @Email ,
						Balance = @Balance ,
						Phone = @Phone 
						where Id = @Id
						select 1
				end
			else
				begin
					select 0
				end
		end
end
go



create proc [dbo].[shopgame_delete_client_user_login]
@Id int
as
begin
	delete [dbo].[User]
	where Id = @Id
	select iif(@@ROWCOUNT>0,1,0) 
end

go

create proc [dbo].[shopgame_get_client_user_login_byId]
@Id int
as
begin
	select * from  [dbo].[User]
	where Id = @Id
end
go
create proc [dbo].[shopgame_client_user_login]
@UserName nvarchar(255),
@HashedPassword nvarchar(255)
as
begin
	select * from  [dbo].[User]
	where UserName = @UserName and HashedPassword = @HashedPassword
end


alter proc [dbo].[shopgame_get_user]
@BaseParam BaseParamType readonly,
@Totals int  out,
@PageCount int out
as
begin
	declare @Search nvarchar(max),
			@PageSize int,
			@PageNumber int

	declare @whereSql nvarchar(max) = 'where 1=1',
			@sql nvarchar(max) = ''
	
	select top 1 @Search = Search,@PageSize = PageSize,@PageNumber = PageNumber from @BaseParam
	select @Totals = count(Id) from [dbo].[User]
	set @PageCount = iif(@Totals % @PageSize=0,@Totals / @PageSize,@Totals / @PageSize+1)
	if ISNULL(@Search,'') != ''
		begin
			set @whereSql += N'and (UserName like N''%'+@Search+'%'')'
		end
	set @sql = N'
		
		select Id,UserName,HashedPassword,Name,Email,Balance,Phone,CreatedDate from [dbo].[User]
		' + @whereSql + '
		order by Id
		offset (@PageSize*(@PageNumber-1)) rows fetch next @PageSize rows only'
	print @Sql
	declare @Param nvarchar(max) = N'@Search nvarchar(max),@PageSize int,@PageNumber int,@Totals int,@PageCount int'
	EXEC sp_executesql @Sql,@Param,@Search,@PageSize,@PageNumber,@Totals,@PageCount
end

declare @BaseParam BaseParamType 
insert into @BaseParam values (N'',10,1)
exec [shopgame_get_user] @BaseParam,1,1
go

--sai
create proc [dbo].[shopgame_update_user_password]
@Id int,
@UserName nvarchar(255),
@HashedPassword nvarchar(255),
@Name nvarchar(255),
@Email nvarchar(255),
@Balance decimal(18,2),
@Phone nvarchar(255)
as
begin
	if @Id = 0
		begin
			if not exists (select * from [dbo].[User] where UserName = @UserName)
				begin
					insert into [dbo].[User] values (@UserName,
					@HashedPassword,
					@Name,
					@Email,
					@Balance,
					@Phone,
					GETDATE())
					select 1
				end
			else
				begin
					select 0
				end
		end
	else
		begin
			if not exists (select * from [dbo].[User] where UserName = @UserName and @Id = Id)
				begin
					update  [dbo].[User]
					set UserName = @UserName,
						HashedPassword = @HashedPassword,
						[Name] = @Name ,
						Email = @Email ,
						Balance = @Balance ,
						Phone = @Phone 
						where Id = @Id
						select 1
				end
			else
				begin
					select 0
				end
		end
end
go


create proc [dbo].[shopgame_get_tran_log]
@BaseParam BaseParamType readonly,
@Totals int  out,
@PageCount int out
as
begin
	declare @Search nvarchar(max),
			@PageSize int,
			@PageNumber int

	declare @whereSql nvarchar(max) = 'where 1=1',
			@sql nvarchar(max) = ''
	
	select top 1 @Search = Search,@PageSize = PageSize,@PageNumber = PageNumber from @BaseParam
	select @Totals = count(Id) from Blog
	set @PageCount = iif(@Totals % @PageSize=0,@Totals / @PageSize,@Totals / @PageSize+1)
	if ISNULL(@Search,'') != ''
		begin
			set @whereSql += N'and (b.Name like N''%'+@Search+'%'' or bt.Name like N''%'+@Search+'%'')'
		end
	set @sql = N'
		select b.*,bt.Name BlogTypeName from Blog b
		join Blogtype bt on b.BlogTypeId = bt.BlogTypeId
		' + @whereSql + '
		order by b.Id
		offset (@PageSize*(@PageNumber-1)) rows fetch next @PageSize rows only'
	print @Sql
	declare @Param nvarchar(max) = N'@Search nvarchar(max),@PageSize int,@PageNumber int,@Totals int,@PageCount int'
	EXEC sp_executesql @Sql,@Param,@Search,@PageSize,@PageNumber,@Totals,@PageCount
end

select t.*,tc.Name as TransactionCategoryName from [dbo].[Transaction] t
join [dbo].[TransactionCategoryType] tc on tc.id = t.TransactionCategoryTypeId


create proc [dbo].[shopgame_get_ProductTransaction]
@BaseParam BaseParamType readonly,
@Totals int  out,
@PageCount int out
as
begin
	declare @Search nvarchar(max),
			@PageSize int,
			@PageNumber int

	declare @whereSql nvarchar(max) = 'where 1=1',
			@sql nvarchar(max) = ''
	
	select top 1 @Search = Search,@PageSize = PageSize,@PageNumber = PageNumber from @BaseParam
	select @Totals = count(Id) from [dbo].[User]
	set @PageCount = iif(@Totals % @PageSize=0,@Totals / @PageSize,@Totals / @PageSize+1)
	if ISNULL(@Search,'') != ''
		begin
			set @whereSql += N'and (UserName like N''%'+@Search+'%'')'
		end
	set @sql = N'
		
		select * from [dbo].ProductTransaction
		' + @whereSql + '
		order by Id
		offset (@PageSize*(@PageNumber-1)) rows fetch next @PageSize rows only'
	print @Sql
	declare @Param nvarchar(max) = N'@Search nvarchar(max),@PageSize int,@PageNumber int,@Totals int,@PageCount int'
	EXEC sp_executesql @Sql,@Param,@Search,@PageSize,@PageNumber,@Totals,@PageCount
end


select * from NaptheTransaction
 order by id desc


select * from MasterData
where id = 1085
