IF NOT EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[Carts]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	/* Create Tables */
	-- Tabla para los carros
	CREATE TABLE [dbo].[Carts]
	(
		[Id] INT NOT NULL PRIMARY KEY IDENTITY(1,1), -- Identificador de la tabla
		[Created_At] datetime not null default getdate(),
		[Updated_At] datetime not null default getdate(),
	)
END


/* Create Table Comments */
IF EXISTS (SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Carts', NULL, NULL))
BEGIN
  EXEC sys.sp_updateextendedproperty 'MS_Description', 'Tabla para los carros', 'SCHEMA', 'dbo', 'table', 'Carts'
END 
ELSE
BEGIN
  EXEC sys.sp_addextendedproperty 'MS_Description', 'Tabla para los carros', 'SCHEMA', 'dbo', 'table', 'Carts'
END
GO


/*  Comentarios para las columnas */
-- Descripción para la columna 'Id'
IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Carts', 'column', 'Id'))
    EXEC sp_addextendedproperty 'MS_Description', 'Identificador de la tabla', 'Schema', [dbo], 'table', [Carts], 'column', [Id];

-- Descripción para la columna 'Created_At'
IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Carts', 'column', 'Created_At'))
    EXEC sp_addextendedproperty 'MS_Description', 'Fecha de creación', 'Schema', [dbo], 'table', [Carts], 'column', [Created_At];

-- Descripción para la columna 'Updated_At'
IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Carts', 'column', 'Updated_At'))
    EXEC sp_addextendedproperty 'MS_Description', 'Fecha de actualización', 'Schema', [dbo], 'table', [Carts], 'column', [Updated_At];
