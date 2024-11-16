IF OBJECT_ID('trg_UpdateStockStatus', 'TR') IS NOT NULL
BEGIN
	DROP TRIGGER trg_UpdateStockStatus
END
GO

CREATE TRIGGER trg_UpdateStockStatus
ON [dbo].[Products]
AFTER INSERT, UPDATE
AS
BEGIN
	IF UPDATE(Current_Stock) OR EXISTS (SELECT 1 FROM inserted)
	BEGIN
		DECLARE @StatusStockId INT
		IF CURSOR_STATUS('GLOBAL','cursor_products') >= -1
		BEGIN
			CLOSE cursor_products
			DEALLOCATE cursor_products
		END

		DECLARE @ProductID INT,
				@CurrentStock INT,
				@MinStock INT
		
		DECLARE cursor_products CURSOR FAST_FORWARD FOR
		SELECT Id, Current_Stock, Min_Stock
		FROM Products

		OPEN cursor_products
		FETCH NEXT FROM cursor_products INTO @ProductId, 
											 @CurrentStock, 
											 @MinStock;
		WHILE @@FETCH_STATUS = 0
		BEGIN
			IF (ISNULL(@CurrentStock, 0) = 0)
				SELECT @StatusStockId = Id
				FROM Stock_Status
				WHERE [Key] = 'OUT_OF_STOCK'
			ELSE IF (@CurrentStock <= @MinStock)
				SELECT @StatusStockId = Id
				FROM Stock_Status
				WHERE [Key] = 'LOW_STOCK'
			ELSE
				SELECT @StatusStockId = Id
				FROM Stock_Status
				WHERE [Key] = 'IN_STOCK'

			UPDATE Products
			SET Stock_Status_Id = @StatusStockId
			WHERE Id = @ProductID

			FETCH 
		END
	END
END