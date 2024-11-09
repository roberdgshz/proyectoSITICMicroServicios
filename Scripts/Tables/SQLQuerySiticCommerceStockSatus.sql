use dbSiticCommerce;
IF NOT EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[Stock_Status]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	/* Create Tables */
	-- Almacena diferentes estados de la tabla
	CREATE TABLE [dbo].[Stock_Status]
	(
		[Id] INT NOT NULL PRIMARY KEY IDENTITY(1,1), -- Identificador de la tabla
		[Status_Name] varchar(50) not null, -- Nombre del estado de existencia
		[Key] varchar(50) not null, -- Clave del estado de existencia
		
	)
END


/* Create Table Comments */
IF EXISTS (SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Stock_Status', NULL, NULL))
BEGIN
  EXEC sys.sp_updateextendedproperty 'MS_Description', 'Almacena diferentes estados de la tabla', 'SCHEMA', 'dbo', 'table', 'Stock_Status'
END 
ELSE
BEGIN
  EXEC sys.sp_addextendedproperty 'MS_Description', 'Almacena diferentes estados de la tabla', 'SCHEMA', 'dbo', 'table', 'Stock_Status'
END
GO


/*  Comentarios para las columnas */
-- Descripción para la columna 'Id'
IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Stock_Status', 'column', 'Id'))
    EXEC sp_addextendedproperty 'MS_Description', 'Identificador de la tabla', 'Schema', [dbo], 'table', [Stock_Status], 'column', [Id];

-- Descripción para la columna 'Status_NAme'
IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Stock_Status', 'column', 'Status_NAme'))
    EXEC sp_addextendedproperty 'MS_Description', 'Nombre del estado de existencia', 'Schema', [dbo], 'table', [Stock_Status], 'column', [Status_NAme];

-- Descripción para la columna 'Key'
IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Stock_Status', 'column', 'Key'))
    EXEC sp_addextendedproperty 'MS_Description', 'Clave del estado de existencia', 'Schema', [dbo], 'table', [Stock_Status], 'column', [Key];
