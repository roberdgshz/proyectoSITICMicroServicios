IF NOT EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[Orders]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	/* Create Tables */
	-- Almacena información de los pedidos realizados
	CREATE TABLE [dbo].[Orders]
	(
		[Id] INT NOT NULL PRIMARY KEY IDENTITY(1,1), -- Identificador de tabla
		[total_Price] decimal(20,2) not null, -- Precio total del pedido
		[Status] varchar(50) not null, -- Estado del pedido
		[Created_At] datetime not null default getdate(), -- Fecha de creación
		[Updated_At] datetime not null default getdate()-- Fecha de actualización
	)
END


/* Create Table Comments */
IF EXISTS (SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Orders', NULL, NULL))
BEGIN
  EXEC sys.sp_updateextendedproperty 'MS_Description', 'Almacena información de los pedidos realizados', 'SCHEMA', 'dbo', 'table', 'Orders'
END 
ELSE
BEGIN
  EXEC sys.sp_addextendedproperty 'MS_Description', 'Almacena información de los pedidos realizados', 'SCHEMA', 'dbo', 'table', 'Orders'
END
GO


/*  Comentarios para las columnas */
-- Descripción para la columna 'Id'
IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Orders', 'column', 'Id'))
    EXEC sp_addextendedproperty 'MS_Description', 'Identificador de tabla', 'Schema', [dbo], 'table', [Orders], 'column', [Id];

-- Descripción para la columna 'total_Price'
IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Orders', 'column', 'total_Price'))
    EXEC sp_addextendedproperty 'MS_Description', 'Precio total del pedido', 'Schema', [dbo], 'table', [Orders], 'column', [total_Price];

-- Descripción para la columna 'Status'
IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Orders', 'column', 'Status'))
    EXEC sp_addextendedproperty 'MS_Description', 'Estado del pedido', 'Schema', [dbo], 'table', [Orders], 'column', [Status];

-- Descripción para la columna 'Created_At'
IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Orders', 'column', 'Created_At'))
    EXEC sp_addextendedproperty 'MS_Description', 'Fecha de creación', 'Schema', [dbo], 'table', [Orders], 'column', [Created_At];

-- Descripción para la columna 'Updated_At'
IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Orders', 'column', 'Updated_At'))
    EXEC sp_addextendedproperty 'MS_Description', 'Fecha de actualización', 'Schema', [dbo], 'table', [Orders], 'column', [Updated_At];
