-- select distinct id from profit, club_owner
-- where income != 10 and club_owner.id=profit.clubId
-- and club_owner.id in (select clubId from schedule where yyyy < 2005); 

-- select distinct id from profit, club_owner
-- where (income < 10 or income > 10) and club_owner.id=profit.clubId
-- and club_owner.id in (select clubId from schedule where yyyy < 2005); 

select distinct id from profit, club_owner, schedule s
where income != 10 and club_owner.id=profit.clubId and
s.clubId = club_owner.id and s.yyyy < 2005;

select distinct id from profit, club_owner, schedule s
where (income < 10 or income > 10) and club_owner.id=profit.clubId and
s.clubId = club_owner.id and s.yyyy < 2005; 