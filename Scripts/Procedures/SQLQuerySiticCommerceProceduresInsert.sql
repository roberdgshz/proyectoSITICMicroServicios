IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[Products].[Insert]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [Products].[Insert]
GO
CREATE PROCEDURE [Products].[Insert]
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
	INSERT INTO Products (Name, Description, Price, Current_Stock,
	Max_Stock, Min_Stock, Image_Path)
	VALUES (@Name, @Description, @Price, @Current_Stock,
	@Max_Stock, @Min_Stock, @Image_Path)
END
GO
EXEC sp_recompile N'[Products].[Insert]';
GO
-- Cart_Items
IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[Cart_Items].[Insert]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [Cart_Items].[Insert]
GO
CREATE PROCEDURE [Cart_Items].[Insert]
		@Cart_Id	INT,
		@Product_Id INT,
		@Quantity	INT,
		@Price		DECIMAL(18,2)
WITH  ENCRYPTION  
AS 
BEGIN	
	INSERT INTO Cart_Items (Cart_Id, Product_Id, Quantity, Price)
	VALUES (@Cart_Id, @Producto_Id, @Quantity, @Price)
END
GO
EXEC sp_recompile N'[Cart_Items].[Insert]';
GO
-- Carts
IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[Carts].[Insert]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [Carts].[Insert]
GO
CREATE PROCEDURE [Carts].[Insert]

WITH  ENCRYPTION  
AS 
BEGIN	
	INSERT INTO Carts ()
	VALUES ()
END
GO
EXEC sp_recompile N'[Carts].[Insert]';
GO
-- Order_Items
IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[Order_Items].[Insert]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [Order_Items].[Insert]
GO
CREATE PROCEDURE [Order_Items].[Insert]
	@Quantity INT
WITH  ENCRYPTION  
AS 
BEGIN	
	INSERT INTO Order_Items (Quantity)
	VALUES (@Quantity)
END
GO
EXEC sp_recompile N'[Order_Items].[Insert]';
GO
-- Orders
IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[Orders].[Insert]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [Orders].[Insert]
GO
CREATE PROCEDURE [Orders].[Insert]
		@Total_Price	DECIMAL(20, 2),
		@Status			VARCHAR(50),
WITH  ENCRYPTION  
AS 
BEGIN	
	INSERT INTO Orders (Total_Price, Status)
	VALUES (@Total_Price, @Status)
END
GO
EXEC sp_recompile N'[Orders].[Insert]';
GO
-- Product_Configurations
IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[Product_Configurations].[Insert]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [Product_Configurations].[Insert]
GO
CREATE PROCEDURE [Product_Configurations].[Insert]
		@Configuration_Name		VARCHAR(255),
		@Value					VARCHAR(255),
WITH  ENCRYPTION  
AS 
BEGIN	
	INSERT INTO Product_Configurations (Configuration_Name, Value)
	VALUES (@Configuration_Name, @Value)
END
GO
EXEC sp_recompile N'[Product_Configurations].[Insert]';
GO
-- Stock_Status
IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[Stock_Status].[Insert]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [Stock_Status].[Insert]
GO
CREATE PROCEDURE [Stock_Status].[Insert]
		@Status_Name	VARCHAR(50),
		@Key			VARCHAR(50),
WITH  ENCRYPTION  
AS 
BEGIN	
	INSERT INTO Stock_Status (Status_Name, Key)
	VALUES (@Status_Name, @Key)
END
GO
EXEC sp_recompile N'[Stock_Status].[Insert]';
GO