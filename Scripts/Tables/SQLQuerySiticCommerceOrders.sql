IF NOT EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[Orders]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	/* Create Tables */
	-- Almacena informaci�n de los pedidos realizados
	CREATE TABLE [dbo].[Orders]
	(
		[Id] INT NOT NULL PRIMARY KEY IDENTITY(1,1), -- Identificador de tabla
		[total_Price] decimal(20,2) not null, -- Precio total del pedido
		[Status] varchar(50) not null, -- Estado del pedido
		[Created_At] datetime not null default getdate(), -- Fecha de creaci�n
		[Updated_At] datetime not null default getdate()-- Fecha de actualizaci�n
	)
END


/* Create Table Comments */
IF EXISTS (SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Orders', NULL, NULL))
BEGIN
  EXEC sys.sp_updateextendedproperty 'MS_Description', 'Almacena informaci�n de los pedidos realizados', 'SCHEMA', 'dbo', 'table', 'Orders'
END 
ELSE
BEGIN
  EXEC sys.sp_addextendedproperty 'MS_Description', 'Almacena informaci�n de los pedidos realizados', 'SCHEMA', 'dbo', 'table', 'Orders'
END
GO


/*  Comentarios para las columnas */
-- Descripci�n para la columna 'Id'
IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Orders', 'column', 'Id'))
    EXEC sp_addextendedproperty 'MS_Description', 'Identificador de tabla', 'Schema', [dbo], 'table', [Orders], 'column', [Id];

-- Descripci�n para la columna 'total_Price'
IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Orders', 'column', 'total_Price'))
    EXEC sp_addextendedproperty 'MS_Description', 'Precio total del pedido', 'Schema', [dbo], 'table', [Orders], 'column', [total_Price];

-- Descripci�n para la columna 'Status'
IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Orders', 'column', 'Status'))
    EXEC sp_addextendedproperty 'MS_Description', 'Estado del pedido', 'Schema', [dbo], 'table', [Orders], 'column', [Status];

-- Descripci�n para la columna 'Created_At'
IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Orders', 'column', 'Created_At'))
    EXEC sp_addextendedproperty 'MS_Description', 'Fecha de creaci�n', 'Schema', [dbo], 'table', [Orders], 'column', [Created_At];

-- Descripci�n para la columna 'Updated_At'
IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Orders', 'column', 'Updated_At'))
    EXEC sp_addextendedproperty 'MS_Description', 'Fecha de actualizaci�n', 'Schema', [dbo], 'table', [Orders], 'column', [Updated_At];
