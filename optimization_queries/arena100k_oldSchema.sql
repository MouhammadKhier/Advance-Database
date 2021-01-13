# use arena100k;
select SQL_NO_CACHE *
from club_owner,club
where 
(club_owner.firstName like 'a%' or club_owner.firstName like '%a')
and club.club_owner = club_owner.id
and club.id IN
(SELECT clubId from event where event.prize > 1000 );