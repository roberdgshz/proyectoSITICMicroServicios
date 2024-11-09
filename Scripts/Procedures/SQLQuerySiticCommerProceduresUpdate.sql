IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[Products].[Update]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [Products].[Update]
GO
CREATE PROCEDURE [Products].[Update]
	@Id				INT,
	@Name			VARCHAR(255),
	@Description	TEXT,
	@Price			DECIMAL(18,2), 
	@Current_Stock	INT,
	@Max_Stock		INT, 
	@Min_Stock		INT, 
	@Image_Path		VARCHAR(255)
WITH  ENCRYPTION  
AS 
BEGIN	
	UPDATE Products
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
EXEC sp_recompile N'[Products].[Update]';
GO
-- Cart_Items
IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[Cart_Items].[Update]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [Cart_Items].[Update]
GO
CREATE PROCEDURE [Cart_Items].[Update]
	@Id			INT,
	@Cart_Id	INT,
	@Product_Id INT,
	@Quantity	INT,
	@Price		DECIMAL(18,2)
WITH  ENCRYPTION  
AS 
BEGIN	
	UPDATE Products
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
EXEC sp_recompile N'[Cart_Items].[Update]';
GO
-- Carts
IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[Carts].[Update]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [Carts].[Update]
GO
CREATE PROCEDURE [Carts].[Update]

WITH  ENCRYPTION  
AS 
BEGIN	

END
GO
EXEC sp_recompile N'[Carts].[Update]';
GO
-- Order_Items
IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[Order_Items].[Update]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [Order_Items].[Update]
GO
CREATE PROCEDURE [Order_Items].[Update]
	@Id		  INT,
	@Quantity INT
WITH  ENCRYPTION  
AS 
BEGIN	
	UPDATE Products
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
EXEC sp_recompile N'[Order_Items].[Update]';
GO
-- Orders
IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[Orders].[Update]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [Orders].[Update]
GO
CREATE PROCEDURE [Orders].[Update]
	@Id		  INT,
	@Total_Price	DECIMAL(20, 2),
	@Status			VARCHAR(50),
WITH  ENCRYPTION  
AS 
BEGIN	
	UPDATE Products
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
EXEC sp_recompile N'[Orders].[Update]';
GO
-- Product_Configurations
IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[Product_Configurations].[Update]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [Product_Configurations].[Update]
GO
CREATE PROCEDURE [Product_Configurations].[Update]
	@Id			   		    INT,
	@Configuration_Name		VARCHAR(255),
	@Value					VARCHAR(255),
WITH  ENCRYPTION  
AS 
BEGIN	
	UPDATE Products
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
EXEC sp_recompile N'[Product_Configurations].[Update]';
GO
-- Stock_Status
IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[Stock_Status].[Update]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [Stock_Status].[Update]
GO
CREATE PROCEDURE [Stock_Status].[Update]
	@Id			    INT,
	@Status_Name	VARCHAR(50),
	@Key			VARCHAR(50),
WITH  ENCRYPTION  
AS 
BEGIN	
	UPDATE Products
	SET Satus_Name = @Status_Name,
		Key = @Key
	WHERE Id = @Id
END
GO
EXEC sp_recompile N'[Stock_Status].[Update]';
GO