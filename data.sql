-- login
Create proc shopgame_login
@UserName nvarchar(255),
@HashedPassword nvarchar(255)
as
begin
	select * from Account
	where UserName = @UserName and HashedPassword = @HashedPassword
end

-- create login
go
Alter proc shopgame_create_login
@Id int,
@UserName nvarchar(255),
@HashedPassword nvarchar(255)
as
begin
	if @Id = 0
		begin
			if not exists (select * from Account where UserName = @UserName)
				begin
					insert into Account values (@UserName,@HashedPassword)
					select 1
				end
			else
				begin
					select 0
				end
		end
	else
		begin
			if not exists (select * from Account where UserName = @UserName and @Id = Id)
				begin
					update  Account
					set UserName = @UserName,
						HashedPassword = @HashedPassword
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
Create proc shopgame_get_account
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
	select @Totals = count(Id) from Account
	set @PageCount = iif(@Totals % @PageSize=0,@Totals / @PageSize,@Totals / @PageSize+1)
	if ISNULL(@Search,'') != ''
		begin
			set @whereSql += N'and (UserName like N''%'+@Search+'%'')'
		end
	set @sql = N'
		
		select Id,UserName,HashedPassword from Account
		' + @whereSql + '
		order by Id
		offset (@PageSize*(@PageNumber-1)) rows fetch next @PageSize rows only'
	print @Sql
	declare @Param nvarchar(max) = N'@Search nvarchar(max),@PageSize int,@PageNumber int,@Totals int,@PageCount int'
	EXEC sp_executesql @Sql,@Param,@Search,@PageSize,@PageNumber,@Totals,@PageCount
end

go
declare @BaseParam BaseParamType 
insert into @BaseParam values (N'',10,1)
exec shopgame_get_account @BaseParam,1,1

go
Create proc shopgame_delete_login
@Id int
as
begin
	delete Account
	where Id = @Id
	select iif(@@ROWCOUNT>0,1,0) 
end


go
create proc shopgame_get_login_byId
@Id int
as
begin
	select * from Account
	where Id = @Id
end


-- product category
go
alter proc shopgame_create_productcategory
@Id int,
@Name nvarchar(500),
@Image nvarchar(500),
@Description nvarchar(500)
as
begin
 if @Id = 0
	begin
		insert into ProductCategory(Name,Image,Description) values (@Name,@Image,@Description)
		select iif(@@ROWCOUNT>0,1,0)
	end

 else
	begin
	    update ProductCategory
		set Name = @Name,
			Image = @Image,
			Description = @Description
			where Id = @Id
		select iif(@@ROWCOUNT>0,1,0)
	end
end

go
create proc shopgame_delete_productcategory
@Id int
as
begin
	delete ProductCategory
	where Id = @Id
	select iif(@@ROWCOUNT>0,1,0)
end


go
create proc shopgame_getbyid_productcategory
@Id int
as
begin
	select * from ProductCategory
	where Id = @Id
end

go
Alter proc shopgame_get_productcategory
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
	select @Totals = count(Id) from Account
	set @PageCount = iif(@Totals % @PageSize=0,@Totals / @PageSize,@Totals / @PageSize+1)
	if ISNULL(@Search,'') != ''
		begin
			set @whereSql += N'and (Name like N''%'+@Search+'%'')'
		end
	set @sql = N'
		
		select Id,Name,Image,Description from ProductCategory
		' + @whereSql + '
		order by Id
		offset (@PageSize*(@PageNumber-1)) rows fetch next @PageSize rows only'
	print @Sql
	declare @Param nvarchar(max) = N'@Search nvarchar(max),@PageSize int,@PageNumber int,@Totals int,@PageCount int'
	EXEC sp_executesql @Sql,@Param,@Search,@PageSize,@PageNumber,@Totals,@PageCount
end

go

declare @BaseParam BaseParamType 
insert into @BaseParam values (N'',10,1)
exec shopgame_get_product @BaseParam,1,1

-- product

Create type ProductImages as table(
	Id int,
	ProductId int,
	Image nvarchar(max)
)

go
Create proc shopgame_create_product
@Id int,
@Code nvarchar(255),
@Name nvarchar(255),
@Description nvarchar(max),
@Image nvarchar(500),
@CategoryId int,
@Detail nvarchar(max),
@OrderNo int,
@Rank nvarchar(255),
@SoTuong nvarchar(255),
@SoTrangPhuc nvarchar(255),
@LoaiTaiKhoan nvarchar(255),
@NoiBat nvarchar(255),
@DangKy nvarchar(255),
@VIP nvarchar(255),
@Top int,
@AccUserName nvarchar(255),
@AccPassword nvarchar(255),
@MetaTitle nvarchar(255),
@MetaDescription nvarchar(255),
@Status bit,
@ProductImage ProductImages readonly
as
begin
	if @Id = 0
		begin
			insert into Product (Code,Name,Description,[Image],CategoryId,Detail,OrderNo,Rank,SoTuong,SoTrangPhuc,LoaiTaiKhoan,NoiBat,DangKy,VIP,[Top],AccUserName,AccPassword,Metatitle,MetaDescription,Status)
			values (@Code,@Name,@Description,@Image,@CategoryId,@Detail,@OrderNo,@Rank,@SoTuong,@SoTrangPhuc,@LoaiTaiKhoan,@NoiBat,@DangKy,@VIP,@Top,@AccUserName,@AccPassword,@MetaTitle,@MetaDescription,@Status)

			declare @IdNew int
			select top 1 @IdNew = Id from Product order by Id desc

			insert into ProductImage(ProductId,Image) 
			select @IdNew,Image from @ProductImage

		end
	else
		begin
			Update Product
			set Code = @Code,
				Name = @Name,
				Description = @Description,
				Image = @Image,
				CategoryId = @CategoryId,
				Detail = @Detail,
				OrderNo = @OrderNo,
				[Rank] = @Rank,
				SoTuong = @SoTuong,
				SoTrangPhuc = @SoTrangPhuc,
				LoaiTaiKhoan = @LoaiTaiKhoan,
				NoiBat = @NoiBat,
				DangKy = @DangKy,
				VIP = @VIP,
				[Top] = @Top,
				AccUserName = @AccUserName,
				AccPassword = @AccPassword,
				Metatitle = @MetaTitle,
				MetaDescription = @MetaDescription,
				[Status] = @Status
			where Id = @Id

			delete ProductIMage where ProductId = @Id
			insert into ProductImage(ProductId,Image) 
			select @Id,Image from @ProductImage
		end

		select IIF(@@ROWCOUNT>0,1,0)
end

go
Create proc shopgame_getbyId_product
@Id int
as
begin
	select p.*,pc.Name as CategoryName from Product p
	join ProductCategory pc on p.CategoryId = pc.Id
	where p.Id = @Id
end


go
Create proc shopgame_get_product
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
	select @Totals = count(Id) from Account
	set @PageCount = iif(@Totals % @PageSize=0,@Totals / @PageSize,@Totals / @PageSize+1)
	if ISNULL(@Search,'') != ''
		begin
			set @whereSql += N'and (p.Name like N''%'+@Search+'%'' or p.Code like N''%'+@Search+'%'' or p.Rank like N''%'+@Search+'%'' 
								or p.SoTuong like N''%'+@Search+'%'' or p.SoTrangPhuc like N''%'+@Search+'%'' 
								or p.LoaiTaiKhoan like N''%'+@Search+'%'' or p.DangKy like N''%'+@Search+'%''
								or p.VIP like N''%'+@Search+'%'' or p.AccUserName like N''%'+@Search+'%'')'
		end
	set @sql = N'
		
		select p.*,pc.Name as CategoryName from Product p
		join ProductCategory pc on p.CategoryId = pc.Id
		' + @whereSql + '
		order by p.Id
		offset (@PageSize*(@PageNumber-1)) rows fetch next @PageSize rows only'
	print @Sql
	declare @Param nvarchar(max) = N'@Search nvarchar(max),@PageSize int,@PageNumber int,@Totals int,@PageCount int'
	EXEC sp_executesql @Sql,@Param,@Search,@PageSize,@PageNumber,@Totals,@PageCount
end
go
Alter proc shopgame_delete_product
@Id int
as 
begin
	delete Product
	where Id = @Id
	select iif(@@ROWCOUNT>0,1,0)
end

go
create proc shopgame_check_delete_productcategory
@Id int
as
begin
  declare @Check int
  select @Check = COUNT(Id) from Product
  where CategoryId = @Id
  select @Check = 0
end


select * from Product
select * from ProductImage


go
create proc shopgame_get_productImage
@Id int
as begin
	select * from ProductImage
	where ProductId = @Id
end


select * from product


-- blog type
go
create proc shopgame_create_blogtype
@Id int,
@Name nvarchar(500)
as
begin
 if @Id = 0
	begin
		insert into BlogType(Name) values (@Name)
		select iif(@@ROWCOUNT>0,1,0)
	end

 else
	begin
	    update BlogType
		set Name = @Name
		where BlogTypeId = @Id
		select iif(@@ROWCOUNT>0,1,0)
	end
end


go
alter proc shopgame_get_blogtype
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
	select @Totals = count(Id) from Account
	set @PageCount = iif(@Totals % @PageSize=0,@Totals / @PageSize,@Totals / @PageSize+1)
	if ISNULL(@Search,'') != ''
		begin
			set @whereSql += N'and (Name like N''%'+@Search+'%'')'
		end
	set @sql = N'
		select BlogTypeId Id,Name from BlogType
		' + @whereSql + '
		order by BlogTypeId
		offset (@PageSize*(@PageNumber-1)) rows fetch next @PageSize rows only'
	print @Sql
	declare @Param nvarchar(max) = N'@Search nvarchar(max),@PageSize int,@PageNumber int,@Totals int,@PageCount int'
	EXEC sp_executesql @Sql,@Param,@Search,@PageSize,@PageNumber,@Totals,@PageCount
end

go
declare @BaseParam BaseParamType 
insert into @BaseParam values (N'',10,1)
exec shopgame_get_blogtype @BaseParam,1,1

go
Create proc shopgame_delete_blogtype
@Id int
as
begin
	delete BlogType
	where BlogTypeId = @Id
	select iif(@@ROWCOUNT>0,1,0) 
end


go
Alter proc shopgame_get_blogtype_byId
@Id int
as
begin
	select BlogTypeId Id,Name from BlogType
	where BlogTypeId = @Id
end



--blog
alter proc shopgame_create_blog
@Id int,
@Name nvarchar(500),
@Image nvarchar(500),
@MetaTitle nvarchar(500),
@Description nvarchar(500),
@BlogTypeId int
as
begin
 if @Id = 0
	begin
		insert into Blog(Name,MetaTitle,Description,BlogTypeId,CreatedDate,Image) values (@Name,@MetaTitle,@Description,@BlogTypeId,GETDATE(),@Image)
		select iif(@@ROWCOUNT>0,1,0)
	end

 else
	begin
	    update Blog
		set Name = @Name,
		MetaTitle =@MetaTitle,
		Description = @Description,
		BlogTypeId = @BlogTypeId,
		Image = @Image
		where Id = @Id
		select iif(@@ROWCOUNT>0,1,0)
	end
end




go
alter proc shopgame_get_blog
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
	select @Totals = count(Id) from Account
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

go
declare @BaseParam BaseParamType 
insert into @BaseParam values (N'',10,1)
exec shopgame_get_blog @BaseParam,1,1

go
Create proc shopgame_delete_blog
@Id int
as
begin
	delete Blog
	where Id = @Id
	select iif(@@ROWCOUNT>0,1,0) 
end


go
create proc shopgame_get_blog_byId
@Id int
as
begin
	select b.*,bt.Name from Blog b
	join BlogType bt on b.BlogTypeId = bt.BlogTypeId
	where b.Id = @Id
end



-- card admin

go
create proc shopgame_create_cardadmin
@Id int,
@CardNumber int,
@CardType nvarchar(500),
@CardHolder nvarchar(500),
@CardBranch int
as
begin
 if @Id = 0
	begin
		insert into CardAdmin(CardNumber,CardType,CardHolder,CardBranch) values (@CardNumber,@CardType,@CardHolder,@CardBranch)
		select iif(@@ROWCOUNT>0,1,0)
	end

 else
	begin
	    update CardAdmin
		set CardNumber = @CardNumber,
			CardType = @CardType,
			CardHolder = CardHolder,
			CardBranch = CardBranch
		where Id = @Id
		select iif(@@ROWCOUNT>0,1,0)
	end
end


go
create proc shopgame_get_cardadmin
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
	select @Totals = count(Id) from Account
	set @PageCount = iif(@Totals % @PageSize=0,@Totals / @PageSize,@Totals / @PageSize+1)
	if ISNULL(@Search,'') != ''
		begin
			set @whereSql += N'and (CardNumber like N''%'+@Search+'%'' 
								or CardType like N''%'+@Search+'%''
								or CardHolder like N''%'+@Search+'%''
								or CardBranch like N''%'+@Search+'%'')'
		end
	set @sql = N'
		select * from CardAdmin
		' + @whereSql + '
		order by Id
		offset (@PageSize*(@PageNumber-1)) rows fetch next @PageSize rows only'
	print @Sql
	declare @Param nvarchar(max) = N'@Search nvarchar(max),@PageSize int,@PageNumber int,@Totals int,@PageCount int'
	EXEC sp_executesql @Sql,@Param,@Search,@PageSize,@PageNumber,@Totals,@PageCount
end

go
declare @BaseParam BaseParamType 
insert into @BaseParam values (N'',10,1)
exec shopgame_get_cardadmin @BaseParam,1,1

go
Create proc shopgame_delete_cardadmin
@Id int
as
begin
	delete CardAdmin
	where Id = @Id
	select iif(@@ROWCOUNT>0,1,0) 
end


go
create proc shopgame_get_cardadmin_byId
@Id int
as
begin
	select * from CardAdmin
	where Id = @Id
end


-- notification
go
create proc shopgame_create_notification
@Id int,
@Content nvarchar(500),
@Image nvarchar(500),
@Status bit
as
begin
 if @Id = 0
	begin
		insert into Notification(Content,Image,Status) values (@Content,@Image,@Status)
		select iif(@@ROWCOUNT>0,1,0)
	end

 else
	begin
	    update Notification
		set Content = @Content,
			Image = @Image,
			Status = @Status
		where Id = @Id
		select iif(@@ROWCOUNT>0,1,0)
	end
end


go
create proc shopgame_get_notification
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
	select @Totals = count(Id) from Account
	set @PageCount = iif(@Totals % @PageSize=0,@Totals / @PageSize,@Totals / @PageSize+1)
	if ISNULL(@Search,'') != ''
		begin
			set @whereSql += N'and (Content like N''%'+@Search+'%'' )'
		end
	set @sql = N'
		select * from Notification
		' + @whereSql + '
		order by Id
		offset (@PageSize*(@PageNumber-1)) rows fetch next @PageSize rows only'
	print @Sql
	declare @Param nvarchar(max) = N'@Search nvarchar(max),@PageSize int,@PageNumber int,@Totals int,@PageCount int'
	EXEC sp_executesql @Sql,@Param,@Search,@PageSize,@PageNumber,@Totals,@PageCount
end

go
declare @BaseParam BaseParamType 
insert into @BaseParam values (N'',10,1)
exec shopgame_get_cardadmin @BaseParam,1,1

go
Create proc shopgame_delete_notification
@Id int
as
begin
	delete Notification
	where Id = @Id
	select iif(@@ROWCOUNT>0,1,0) 
end


go
create proc shopgame_get_notification_byId
@Id int
as
begin
	select * from Notification
	where Id = @Id
end


-- skin category

go

-- skin category
create proc shopgame_create_skincategory
@Id int,
@Name nvarchar(500)
as
begin
 if @Id = 0
	begin
		insert into SkinCategory(Name) values (@Name)
		select iif(@@ROWCOUNT>0,1,0)
	end

 else
	begin
	    update SkinCategory
		set Name = @Name
		where Id = @Id
		select iif(@@ROWCOUNT>0,1,0)
	end
end


go
create proc shopgame_get_skincategory
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
	select @Totals = count(Id) from Account
	set @PageCount = iif(@Totals % @PageSize=0,@Totals / @PageSize,@Totals / @PageSize+1)
	if ISNULL(@Search,'') != ''
		begin
			set @whereSql += N'and (Name like N''%'+@Search+'%'')'
		end
	set @sql = N'
		select Id,Name from SkinCategory
		' + @whereSql + '
		order by Id
		offset (@PageSize*(@PageNumber-1)) rows fetch next @PageSize rows only'
	print @Sql
	declare @Param nvarchar(max) = N'@Search nvarchar(max),@PageSize int,@PageNumber int,@Totals int,@PageCount int'
	EXEC sp_executesql @Sql,@Param,@Search,@PageSize,@PageNumber,@Totals,@PageCount
end


go
Create proc shopgame_delete_skincategory
@Id int
as
begin
	delete SkinCategory
	where Id = @Id
	select iif(@@ROWCOUNT>0,1,0) 
end


go
Create proc shopgame_get_skincategory_byId
@Id int
as
begin
	select Id,Name from SkinCategory
	where Id = @Id
end


--skin


-- skin
go
create proc shopgame_create_skin
@Id int,
@Name nvarchar(500),
@Image nvarchar(500),
@SkinCategoryId int,
@Piece decimal(18,0)
as
begin
 if @Id = 0
	begin
		insert into Skin(Name,Image,SkinCategoryId,Piece) values (@Name,@Image,@SkinCategoryId,@Piece)
		select iif(@@ROWCOUNT>0,1,0)
	end

 else
	begin
	    update Skin
		set Name = @Name,
		Image = @Image,
		SkinCategoryId = @SkinCategoryId,
		Piece = @Piece
		where Id = @Id
		select iif(@@ROWCOUNT>0,1,0)
	end
end


go
create proc shopgame_get_skin
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
	select @Totals = count(Id) from Account
	set @PageCount = iif(@Totals % @PageSize=0,@Totals / @PageSize,@Totals / @PageSize+1)
	if ISNULL(@Search,'') != ''
		begin
			set @whereSql += N'and (s.Name like N''%'+@Search+'%'' or sc.Name like N''%'+@Search+'%'')'
		end
	set @sql = N'
		select s.*,sc.Name as SkinCategoryName from Skin s
		join SkinCategory sc on s.SkinCategoryId = sc.Id
		' + @whereSql + '
		order by Id
		offset (@PageSize*(@PageNumber-1)) rows fetch next @PageSize rows only'
	print @Sql
	declare @Param nvarchar(max) = N'@Search nvarchar(max),@PageSize int,@PageNumber int,@Totals int,@PageCount int'
	EXEC sp_executesql @Sql,@Param,@Search,@PageSize,@PageNumber,@Totals,@PageCount
end


go
Create proc shopgame_delete_skin
@Id int
as
begin
	delete Skin
	where Id = @Id
	select iif(@@ROWCOUNT>0,1,0) 
end


go
Create proc shopgame_get_skin_byId
@Id int
as
begin
	select s.*,sc.Name as SkinCategoryName from Skin s
		join SkinCategory sc on s.SkinCategoryId = sc.Id
		where s.Id = @Id
end

-- slide

go
create proc shopgame_create_slide
@Id int,
@Image nvarchar(500),
@DisplayOrder int,
@Link nvarchar(255),
@Description nvarchar(255),
@Status bit
as
begin
 if @Id = 0
	begin
		insert into Slide(Image,DisplayOrder,Link,Description,Status) values (@Image,@DisplayOrder,@Link,@Description,@Status)
		select iif(@@ROWCOUNT>0,1,0)
	end

 else
	begin
	    update Slide
		set Image = @Image,
			DisplayOrder = @DisplayOrder,
			Link = @Link,
			Description = @Description,
			Status = @Status
		where Id = @Id
		select iif(@@ROWCOUNT>0,1,0)
	end
end


go
create proc shopgame_get_slide
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
	select @Totals = count(Id) from Account
	set @PageCount = iif(@Totals % @PageSize=0,@Totals / @PageSize,@Totals / @PageSize+1)
	if ISNULL(@Search,'') != ''
		begin
			set @whereSql += N'and (Link like N''%'+@Search+'%'')'
		end
	set @sql = N'
		select * from Slide
		' + @whereSql + '
		order by Id
		offset (@PageSize*(@PageNumber-1)) rows fetch next @PageSize rows only'
	print @Sql
	declare @Param nvarchar(max) = N'@Search nvarchar(max),@PageSize int,@PageNumber int,@Totals int,@PageCount int'
	EXEC sp_executesql @Sql,@Param,@Search,@PageSize,@PageNumber,@Totals,@PageCount
end


go
Create proc shopgame_delete_slide
@Id int
as
begin
	delete Slide
	where Id = @Id
	select iif(@@ROWCOUNT>0,1,0) 
end


go
Create proc shopgame_get_slide_byId
@Id int
as
begin
	select * from Slide
	where Id = @Id
end



-- transaction category
go
create proc shopgame_create_transactiontype
@Id int,
@Name nvarchar(500)
as
begin
 if @Id = 0
	begin
		insert into TransactionCategoryType(Name) values (@Name)
		select iif(@@ROWCOUNT>0,1,0)
	end

 else
	begin
	    update TransactionCategoryType
		set Name = @Name
		where Id = @Id
		select iif(@@ROWCOUNT>0,1,0)
	end
end


go
create proc shopgame_get_transactiontype
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
	select @Totals = count(Id) from Account
	set @PageCount = iif(@Totals % @PageSize=0,@Totals / @PageSize,@Totals / @PageSize+1)
	if ISNULL(@Search,'') != ''
		begin
			set @whereSql += N'and (Name like N''%'+@Search+'%'')'
		end
	set @sql = N'
		select Id,Name from TransactionCategoryType
		' + @whereSql + '
		order by Id
		offset (@PageSize*(@PageNumber-1)) rows fetch next @PageSize rows only'
	print @Sql
	declare @Param nvarchar(max) = N'@Search nvarchar(max),@PageSize int,@PageNumber int,@Totals int,@PageCount int'
	EXEC sp_executesql @Sql,@Param,@Search,@PageSize,@PageNumber,@Totals,@PageCount
end


go
Create proc shopgame_delete_transactiontype
@Id int
as
begin
	delete TransactionCategoryType
	where Id = @Id
	select iif(@@ROWCOUNT>0,1,0) 
end


go
Create proc shopgame_get_transactiontype_byId
@Id int
as
begin
	select Id,Name from TransactionCategoryType
	where Id = @Id
end



go


