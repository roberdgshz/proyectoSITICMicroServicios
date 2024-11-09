IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'Products')
BEGIN
    EXEC('CREATE SCHEMA Products');
END

IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'Product_Configurations')
BEGIN
    EXEC('CREATE SCHEMA Product_Configurations');
END

IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'Carts')
BEGIN
    EXEC('CREATE SCHEMA Carts');
END

IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'Carts_Items')
BEGIN
    EXEC('CREATE SCHEMA Carts_Items');
END

IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'Orders')
BEGIN
    EXEC('CREATE SCHEMA Orders');
END

IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'Orders_Items')
BEGIN
    EXEC('CREATE SCHEMA Items');
END

IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'Stock_Status')
BEGIN
    EXEC('CREATE SCHEMA Stock_Status');
END