use dbSiticCommerce;
IF NOT EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[Stock_Status]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
    CREATE TABLE [dbo].[Stock_Status]
    (
        [Id] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
        [Status_Name] varchar(50) not null,
        [Key] varchar(50) not null
    )
END
GO

IF EXISTS (SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Stock_Status', NULL, NULL))
BEGIN
    EXEC sys.sp_updateextendedproperty 'MS_Description', 'Almacena diferentes estados de la tabla', 'SCHEMA', 'dbo', 'table', 'Stock_Status';
END
ELSE
BEGIN
    EXEC sys.sp_addextendedproperty 'MS_Description', 'Almacena diferentes estados de la tabla', 'SCHEMA', 'dbo', 'table', 'Stock_Status';
END
GO

IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Stock_Status', 'column', 'Id'))
    EXEC sp_addextendedproperty 'MS_Description', 'Identificador de la tabla', 'Schema', 'dbo', 'table', 'Stock_Status', 'column', 'Id';
GO

IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Stock_Status', 'column', 'Status_Name'))
    EXEC sp_addextendedproperty 'MS_Description', 'Nombre del estado de existencia', 'Schema', 'dbo', 'table', 'Stock_Status', 'column', 'Status_Name';
GO

IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Stock_Status', 'column', 'Key'))
    EXEC sp_addextendedproperty 'MS_Description', 'Clave del estado de existencia', 'Schema', 'dbo', 'table', 'Stock_Status', 'column', 'Key';
GO


select * from Stock_Status;