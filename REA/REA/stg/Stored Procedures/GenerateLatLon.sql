
create   proc stg.GenerateLatLon


@latStart decimal(9,6),
@latEnd decimal(9,6),
@lonStart decimal(9,6),
@lonEnd decimal(9,6),
@size decimal(9,6)

as


--Exec  stg.GenerateLatLon 32, -126, 42.2, -113, 0.5
----Create above Stored Procedure, populate to table stg.Locations with all location values


truncate table stg.Locations

--Declare @latStart decimal(9,6) = 32
--Declare @latEnd decimal(9,6) = 42.2
--Declare @lonStart decimal(9,6) = -126
--Declare @lonEnd decimal(9,6) = -113
--Declare @size decimal(9,6) = 0.5

Declare @RowId int = 1
Declare @ColId int = 1
Declare @LatA decimal(9,6) = @latStart
Declare @LonA decimal(9,6) = @lonStart
Declare @LatB decimal(9,6)
Declare @LonB decimal(9,6)

While @LonA < @lonEnd
BEGIN
	set @LonB = @LonA + @size
	set @LatA = @latStart
	set @ColId = 1
	While @LatA < @latEnd
	BEGIN
		set @LatB = @LatA + @size
	
		Print 'Range is: from (' + cast(@LatA as varchar(255)) + ', ' + cast(@LonA as varchar(255)) + ') to (' + cast(@LatA as varchar(255)) + ', ' + cast(@LonA as varchar(255)) + ')'
		Insert into stg.Locations (RowId, ColId, LatA, LonA, LatB, LonB) Values (@RowId, @ColId, @LatA, @LonA, @LatB, @LonB)
	
		set @LatA = @LatA + @size
		set @ColId = @ColId + 1
	END
	set @LonA = @LonA + @size
	set @RowId = @RowId + 1
	Print '----------------------------------------------------------'
END