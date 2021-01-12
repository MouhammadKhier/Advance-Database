select * from event e
join (select * from club_owner as co join profit p on p.clubId = co.id where income > 15 and income < 3000) as pp
on pp.id = e.clubId
and Syyyy > 1920 and Syyyy < 2020;