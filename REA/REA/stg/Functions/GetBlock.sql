
create   function stg.GetBlock
( @TopLocationId int )
returns table
as
return
(
with cte
as
(
Select *, Lev=1 from stg.LocationParents where LocationParentId = @TopLocationId
union all
select lp.*, Lev=Lev+1 from stg.LocationParents lp
	JOIN cte on lp.LocationParentId=cte.LocationId
)
select l.*, CteLevel=cte.Lev from cte join stg.Locations l on cte.LocationId=l.ID
)