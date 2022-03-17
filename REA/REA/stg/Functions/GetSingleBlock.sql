



create function stg.GetSingleBlock
(
	@LatA decimal(18,6),
	@LonA decimal(18,6),
	@LatB decimal(18,6),
	@LonB decimal(18,6)
)
Returns geography
as
begin

Return
(
select
geography::STGeomFromText(
'LINESTRING('
+       Convert(varchar(20), @LonA)+' '+ Convert(varchar(20), @LatA)
+ ', '+ Convert(varchar(20), @LonA)+' '+ Convert(varchar(20), @LatB)
+ ', '+ Convert(varchar(20), @LonB)+' '+ Convert(varchar(20), @LatB)
+ ', '+ Convert(varchar(20), @LonB)+' '+ Convert(varchar(20), @LatA)
+ ', '+ Convert(varchar(20), @LonA)+' '+ Convert(varchar(20), @LatA)
+ ' )'
, 4326)
)

End