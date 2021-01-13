# use arena100k_optimized;

select SQL_NO_CACHE *
from club_owner
where club_owner.id IN
(SELECT clubId from event where event.prize > 1000 )
and (club_owner.firstName like 'a%' or club_owner.firstName like '%a');