
CREATE proc [stg].[GenerateLocationParents]
as
truncate table stg.LocationParents
insert stg.LocationParents
(LocationId, LocationParentId)
select l.id, lp.id
from stg.Locations l (NOLOCK)
join stg.Locations lp (NOLOCK) on l.lev=lp.lev-1 
	and l.latA>=lp.LatA and l.latA<=lp.LatB
	and l.lonA>=lp.LonA and l.lonA<=lp.LonB 
	and l.latB<=lp.LatB and l.latB>=lp.latA
	and l.lonB<=lp.LonB and l.lonB>=lp.lonA

insert stg.LocationParents
(LocationId, LocationParentId)
select l.id, null
from stg.Locations l (NOLOCK)
where l.id not in (
select LocationId from stg.LocationParents lp (NOLOCK)
)