# use arena100k_optimized;
explain
select sql_no_cache e.name, e.prize, e.pricePerTeam
 from event e
 inner join ( select sql_no_cache * from  
 (select sql_no_cache id from player p
 left join schedule s on s.playerId = p.id
 where s.yyyy < 1960 and s.yyyy < UNIX_TIMESTAMP( now() )) players
 left join participate p on p.playerId = players.id
 where p.clubId > '1000' and p.clubId < UNIX_TIMESTAMP( now() )) results
 on results.eventId = e.eventId
 where e.prize < UNIX_TIMESTAMP( now() );