IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[Products].[GetById]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [Products].[GetById]
GO
CREATE PROCEDURE [Products].[GetById]
	@Id				INT
WITH  ENCRYPTION  
AS 
BEGIN	
	SELECT Id as 'Id',
		Name as 'Name',
		Description as 'Description',
		Price as 'Price',
		Current_Stock as 'Current_Stock',
		Max_Stock as 'Max_Stock',
		Min_Stock as 'Min_Stock',
		Image_Path as 'Image_path'
	FROM Products
	WHERE Id = @Id
END
GO
EXEC sp_recompile N'[Products].[GetById]';
GO
-- Cart_Items
IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[Cart_Items].[GetById]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [Cart_Items].[GetById]
GO
CREATE PROCEDURE [Cart_Items].[GetById]
	@Id			INT
WITH  ENCRYPTION  
AS 
BEGIN	
	SELECT Id as 'Id', 
		Cart_Id as 'Cart_Id',
		Product_Id as 'Product_Id',
		Quantity as 'Quantity',
		Price as 'Price',
		Created_At as 'Created_At',
		Updated_At as 'Updated_At',
	FROM Cart_Items
	WHERE Id = @Id
END
GO
EXEC sp_recompile N'[Cart_Items].[GetById]';
GO
-- Carts
IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[Carts].[GetById]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [Carts].[GetById]
GO
CREATE PROCEDURE [Carts].[GetById]
	@Id			INT
WITH  ENCRYPTION  
AS 
BEGIN	
	SELECT [Id]			as 'Id',
		[Created_At]	as 'Created_At',
		[Updated_At]	as 'Updated_At'
END
GO
EXEC sp_recompile N'[Carts].[GetById]';
GO
-- Order_Items
IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[Order_Items].[GetById]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [Order_Items].[GetById]
GO
CREATE PROCEDURE [Order_Items].[GetById]
	@Id		  INT,
	@Quantity INT
WITH  ENCRYPTION  
AS 
BEGIN	
	GetById Products
	SET Name = @Name,
		Description = @Description,
		Price = @Price,
		Current_Stock = @Current_Stock,
		Max_Stock = @Max_Stock,
		Min_Stock = @Min_Stock,
		Image_Path = @Image_path
	WHERE Id = @Id
END
GO
EXEC sp_recompile N'[Order_Items].[GetById]';
GO
-- Orders
IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[Orders].[GetById]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [Orders].[GetById]
GO
CREATE PROCEDURE [Orders].[GetById]
	@Id		  INT,
	@Total_Price	DECIMAL(20, 2),
	@Status			VARCHAR(50),
WITH  ENCRYPTION  
AS 
BEGIN	
	GetById Products
	SET Name = @Name,
		Description = @Description,
		Price = @Price,
		Current_Stock = @Current_Stock,
		Max_Stock = @Max_Stock,
		Min_Stock = @Min_Stock,
		Image_Path = @Image_path
	WHERE Id = @Id
END
GO
EXEC sp_recompile N'[Orders].[GetById]';
GO
-- Product_Configurations
IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[Product_Configurations].[GetById]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [Product_Configurations].[GetById]
GO
CREATE PROCEDURE [Product_Configurations].[GetById]
	@Id			   		    INT,
	@Configuration_Name		VARCHAR(255),
	@Value					VARCHAR(255),
WITH  ENCRYPTION  
AS 
BEGIN	
	GetById Products
	SET Name = @Name,
		Description = @Description,
		Price = @Price,
		Current_Stock = @Current_Stock,
		Max_Stock = @Max_Stock,
		Min_Stock = @Min_Stock,
		Image_Path = @Image_path
	WHERE Id = @Id
END
GO
EXEC sp_recompile N'[Product_Configurations].[GetById]';
GO
-- Stock_Status
IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[Stock_Status].[GetById]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [Stock_Status].[GetById]
GO
CREATE PROCEDURE [Stock_Status].[GetById]
	@Id			    INT,
	@Status_Name	VARCHAR(50),
	@Key			VARCHAR(50),
WITH  ENCRYPTION  
AS 
BEGIN	
	GetById Products
	SET Satus_Name = @Status_Name,
		Key = @Key
	WHERE Id = @Id
END
GO
EXEC sp_recompile N'[Stock_Status].[GetById]';
GO