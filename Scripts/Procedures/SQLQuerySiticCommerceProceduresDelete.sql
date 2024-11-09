if exists (select 1 from sys.objects where object_id = object_id(N'[Products].[Delete]') and type in (N''))
	drop procedure [Products].[Delete]
go
create procedure [products].[Delete]
	@Id int
with encryption
as
begin
	delete Products
	where Id = @Id
end
go
exec sp_recompile N'[Products].[Delete]';
go
