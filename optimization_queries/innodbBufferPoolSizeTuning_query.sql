# use arena100k_optimized 
select distinct * from (
 (select * from profit where income > 1500) as clubsWithMoreThan1500
 left join
 club_owner on club_owner.id = clubsWithMoreThan1500.clubId
 inner join 
 (select * from event where prize > 1000) as clubsWithEventsPrizeGreaterThan1000 on clubsWithEventsPrizeGreaterThan1000.clubId = club_owner.id
 )
where name like 'a%' or name like '%a';