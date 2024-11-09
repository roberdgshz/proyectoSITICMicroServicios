create database dbSiticCommerce;
use dbSiticCommerce;

IF NOT EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[Products]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	/* Create Tables */
	CREATE TABLE [dbo].[Products]
	(
		[Id]			INT NOT NULL PRIMARY KEY IDENTITY(1,1), -- Identificador principal de la tabla Products
		[Name]				varchar(255) not null, -- Nombre del producto
		[Description]		text not null, -- Descripción del producto (Detallada)
		[Price]				decimal(18,2) not null, -- Precio del producto
		[Current_Stock]		int not null, -- Existencia del producto
		[Max_Stock]			int not null, -- Existencia máxima del producto
		[Min_Stock]			int not null, -- Existencia mínima del porducto
		[Stock_Status_Id]	int not null, -- Relación con la tabla Stock_Statud
		[Image_Path]		varchar(255), -- Ruta de la imagen
		[Created_At]		datetime default GETDATE(), -- Fecha de creación del producto
		[Update_At]			datetime default GETDATE(), -- Fecha de última actualización del producto
		
	)
END


/* Create Table Comments */
IF EXISTS (SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Products', NULL, NULL))
BEGIN
  EXEC sys.sp_updateextendedproperty 'MS_Description', 'Almacena la información básica de los productos así como la existencia actual y su control', 
  'SCHEMA', 'dbo', 'table', 'Products'
END 
ELSE
BEGIN
  EXEC sys.sp_addextendedproperty 'MS_Description', 'Almacena la información básica de los productos así como la existencia actual y su control', 
  'SCHEMA', 'dbo', 'table', 'Products'
END
GO

/*  Comentarios para las columnas */
IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Products', 'column', 'Id'))
	EXEC sp_addextendedproperty 'MS_Description', 'Identificador principal de la tabla Products', 'Schema', [dbo], 'table', [Products], 'column', [Id]

IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Products', 'column', 'Id'))
	EXEC sp_addextendedproperty 'MS_Description', 'Nombre del producto', 'Schema', [dbo], 'table', [Products], 'column', [Name]

IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Products', 'column', 'Id'))
	EXEC sp_addextendedproperty 'MS_Description', 'Descripción del producto (Detallada)', 'Schema', [dbo], 'table', [Products], 'column', [Description]

IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Products', 'column', 'Id'))
	EXEC sp_addextendedproperty 'MS_Description', 'Precio del producto', 'Schema', [dbo], 'table', [Products], 'column', [Price]

IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Products', 'column', 'Id'))
	EXEC sp_addextendedproperty 'MS_Description', 'Existencia del producto', 'Schema', [dbo], 'table', [Products], 'column', [Current_Stock]

IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Products', 'column', 'Id'))
	EXEC sp_addextendedproperty 'MS_Description', 'Existencia máxima del producto', 'Schema', [dbo], 'table', [Products], 'column', [Max_Stock]

IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Products', 'column', 'Id'))
	EXEC sp_addextendedproperty 'MS_Description', 'Existencia mínima del porducto', 'Schema', [dbo], 'table', [Products], 'column', [Min_Stock]

IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Products', 'column', 'Id'))
	EXEC sp_addextendedproperty 'MS_Description', 'Relación con la tabla Stock_Status', 'Schema', [dbo], 'table', [Products], 'column', [Stock_Status_Id]

IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Products', 'column', 'Id'))
	EXEC sp_addextendedproperty 'MS_Description', 'Ruta de la imagen', 'Schema', [dbo], 'table', [Products], 'column', [Image_Path]

IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Products', 'column', 'Id'))
	EXEC sp_addextendedproperty 'MS_Description', 'Fecha de creación del producto', 'Schema', [dbo], 'table', [Products], 'column', [Created_At]

IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Products', 'column', 'Id'))
	EXEC sp_addextendedproperty 'MS_Description', 'Fecha de última actualización del producto', 'Schema', [dbo], 'table', [Products], 'column', [Update_At]