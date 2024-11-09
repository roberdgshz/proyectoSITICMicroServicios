if exists (select 1 from sys.objects where object_id = object_id(N'[Products].[Delete]') and type in (N''))
	drop procedure [Products].[Delete]
go
create procedure [products].[Delete]
	@Id int
with encryption
as
begin
	delete Products
	where Id = @Id
end
go
exec sp_recompile N'[Products].[Delete]';
go
-- Cart_Items
IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[Cart_Items].[Delete]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [Cart_Items].[Delete]
GO
CREATE PROCEDURE [Cart_Items].[Delete]
		@Id	INT
WITH  ENCRYPTION  
AS 
BEGIN	
	Delete Cart_Items
	WHERE Id = @Id
END
GO
EXEC sp_recompile N'[Cart_Items].[Delete]';
GO
-- Carts
IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[Carts].[Delete]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [Carts].[Delete]
GO
CREATE PROCEDURE [Carts].[Delete]
		@Id	INT
WITH  ENCRYPTION  
AS 
BEGIN	
	Delete Carts
	WHERE Id = @Id
END
GO
EXEC sp_recompile N'[Carts].[Delete]';
GO
-- Order_Items
IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[Order_Items].[Delete]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [Order_Items].[Delete]
GO
CREATE PROCEDURE [Order_Items].[Delete]
		@Id	INT
WITH  ENCRYPTION  
AS 
BEGIN	
	Delete Order_Items
	WHERE Id = @Id
END
GO
EXEC sp_recompile N'[Order_Items].[Delete]';
GO
-- Orders
IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[Orders].[Delete]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [Orders].[Delete]
GO
CREATE PROCEDURE [Orders].[Delete]
		@Id	INT
WITH  ENCRYPTION  
AS 
BEGIN	
	Delete Orders
	WHERE Id = @Id
END
GO
EXEC sp_recompile N'[Orders].[Delete]';
GO
-- Product_Configurations
IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[Product_Configurations].[Delete]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [Product_Configurations].[Delete]
GO
CREATE PROCEDURE [Product_Configurations].[Delete]
		@Id	INT
WITH  ENCRYPTION  
AS 
BEGIN	
	Delete Product_Configurations 
	WHERE Id = @Id
END
GO
EXEC sp_recompile N'[Product_Configurations].[Delete]';
GO
-- Stock_Status
IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[Stock_Status].[Delete]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [Stock_Status].[Delete]
GO
CREATE PROCEDURE [Stock_Status].[Delete]
		@Id	INT
WITH  ENCRYPTION  
AS 
BEGIN	
	Delete Stock_Status 
	WHERE Id = @Id
END
GO
EXEC sp_recompile N'[Stock_Status].[Delete]';
GO