-- explain
-- select p.firstName, co.clubName from player as p,club_owner as co 
-- 		where co.id in
-- 			(SELECT clubid from schedule as s1 
-- 				where 
-- 					now() < STR_TO_DATE(CONCAT(CAST(s1.dd as char(10)), "," ,CAST(s1.mm as char(10)), ",", CAST(s1.yyyy as char(10))),'%d,%m,%Y') 
-- 					and s1.playerId = p.id
-- 					and clubId in 
-- 						(SELECT clubId from schedule as s2 where clubId > 70000)
-- 		);

--  explain 
-- select p.firstName, co.clubName from player as p,club_owner as co where co.id in
-- 	(SELECT clubId from schedule as s 
-- 		where 
-- 			now() < STR_TO_DATE(CONCAT(CAST(s.dd as char(10)), "," ,CAST(s.mm as char(10)), ",", CAST(s.yyyy as char(10))),'%d,%m,%Y')
-- 			and clubId > 70000 
-- 			and p.id = s.playerId
-- 	) 

select co.clubName from club_owner as co 
		where co.id in
			(SELECT clubid from schedule as s1 
				where 
					now() < STR_TO_DATE(CONCAT(CAST(s1.dd as char(10)), "," ,CAST(s1.mm as char(10)), ",", CAST(s1.yyyy as char(10))),'%d,%m,%Y') 
					and clubId in 
						(SELECT clubId from schedule as s2 where clubId > 70000)
		);