# use arena100k_optimized;
select sql_no_cache e.name, e.prize, e.pricePerTeam
 from event e
 inner join ( select sql_no_cache eventId from  
 (select sql_no_cache id from player p
 inner join schedule s on s.playerId = p.id
 where s.yyyy < 1960 and s.yyyy < UNIX_TIMESTAMP( now() )) players
 inner join participate p on p.playerId = players.id
 where p.clubId > '1000' and p.clubId < UNIX_TIMESTAMP( now() )) results
 on results.eventId = e.eventId
 where e.prize < UNIX_TIMESTAMP( now() );