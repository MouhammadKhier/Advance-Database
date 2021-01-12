use arena100k;
select SQL_NO_CACHE *
from club_owner,club,participate
where 
(club_owner.firstName like 'a%' or club_owner.firstName like 'b%')
and club.club_owner = club_owner.id
and participate.eventId IN
(SELECT eventId from event where event.prize > 1000 )
and (participate.clubid = club.id);