use arena100k_optimized;
select SQL_NO_CACHE *
from club_owner,participate
where participate.eventId IN
(SELECT eventId from event where event.prize > 1000 )
and (club_owner.firstName like 'a%' or club_owner.firstName like 'b%')
and (participate.clubid = club_owner.id);