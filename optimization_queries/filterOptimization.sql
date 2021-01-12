select clubName, type  from
	(SELECT clubId, pitch_num from schedule as s1 where 
		now() < STR_TO_DATE(CONCAT(CAST(s1.dd as char(10)), "," ,CAST(s1.mm as char(10)), ",", CAST(s1.yyyy as char(10))),'%d,%m,%Y') 
		and clubId in (SELECT clubId from schedule as s2 where clubId > 70000)
	) as results
	inner join pitch as p on p.clubId = results.clubId and p.pitch_num = results.pitch_num
    inner join club_owner on club_owner.id = results.clubId;
            
SELECT clubName, type from schedule as s1, club_owner co, pitch p
	where 
		now() < STR_TO_DATE(CONCAT(CAST(s1.dd as char(10)), "," ,CAST(s1.mm as char(10)), ",", CAST(s1.yyyy as char(10))),'%d,%m,%Y') 
		and s1.clubId > 70000
        and p.clubId = s1.clubId and p.pitch_num = s1.pitch_num
        and co.id = s1.clubId;