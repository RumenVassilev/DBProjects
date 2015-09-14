-- Task 1
Select Name from Characters
order by Name

-- Task 2
Select Name as 'Game', CONVERT(varchar(10), Start, 120) as Start
from Games
where Start > '01-Jan-2011' AND Start < '01-Jan-2013'
order by Start, Name
offset 0 rows 
fetch next 50 rows only

-- Task 3
SELECT UserName as 'Username', RIGHT(Email, LEN(Email) - CHARINDEX('@', email)) As 'Email Provider' 
FROM   Users
WHERE  LEN(Email) > 0
order by [Email Provider], Username

-- Task 4
Select UserName as 'Username', IpAddress as 'IP Address' 
from Users
Where IpAddress LIKE '___.1%.%.___'
order by Username

-- Task 5
Select Name as 'Game',
	Case when DATEPART(Hour, Start) >= 0 AND DATEPART(Hour, Start) < 12 THEn 'Morning' 
	When DatePart(Hour, Start) >= 12 AND DATEPART(Hour, Start) < 18 Then 'Afternoon' 
	When DATEPART(Hour, Start) >= 18 AND DATEPART(Hour, Start) < 24 Then 'Evening' end as [Part of the Day],
	case When Duration <= 3 Then 'Extra Short'
	When Duration >= 4 AND Duration <= 6 then 'Short'
	When Duration > 6 Then 'Long'
	Else 'Extra Long' end as [Duration]
From Games
Order by Name, [Duration], [Part of the Day]
select * from Games

-- Task 6
SELECT RIGHT(Email, LEN(Email) - CHARINDEX('@', email)) As 'Email Provider', COUNT(Email) as 'Number Of Users'
FROM   Users
WHERE  LEN(Email) > 0
group by RIGHT(Email, Len(Email) - Charindex('@', email))
order by [Number Of Users] DESC, [Email Provider] ASC


--Display the game name, game type, username, level, cash and character name. 
--Sort the result by level in descending order, then by username and game in alphabetical order. 
--Submit for evaluation the result text comma separated with headers.

-- Task 7
Select g.Name as 'Game', gt.Name as 'Game Type', u.UserName as 'Username', ug.Level, ug.Cash, c.Name as 'Character' 
from Users u

JOIN UsersGames ug
ON u.Id = ug.UserId
JOIN Games g
ON ug.GameId = g.Id
JOIN GameTypes gt
ON g.GameTypeId = gt.Id
JOIN Characters c
ON ug.CharacterId = c.Id
Order by ug.Level Desc, u.Username, g.Name ASC

select * from UserGameItems

-- Task 8
Select u.Username from Users u
JOIN UsersGames ug  ON u.Id = ug.UserId

JOIN Games g   ON ug.GameId = g.Id

JOIN UserGameItems ugi  ON ugi.UserGameId = ug.Id

Select u.Username, g.Name as 'Game', COUNT(i.Id) as 'Items Count', sum(i.Price) as 'Items Price' from Users u
Join UsersGames ug On u.Id = ug.UserId

Join Games g On ug.GameId = g.Id

Join UserGameItems ugi ON ug.Id = ugi.UserGameId

JOIN Items i ON ugi.ItemId = i.Id

GROUP BY u.Username, g.Name
HAVING COUNt(i.Id) >= 10
Order by [Items Count] DESC, [Items Price] DESC, u.Username ASC

Select * from [Statistics]
select * from Items


-- Task 10
DECLare @avgSpeed INT = (Select AVG(s.Speed) from [Statistics] s)
DECLARE @avgLuck INT = (Select AVG(s.Luck) from [Statistics] s)
DECLARE @avgMind INT = (Select AVG(s.Mind) From [Statistics] s)

Select i.Name, i.Price,i.MinLevel, s.Strength, s.Defence, s.Speed, s.Luck, s.Mind from Items i
JOIN [Statistics] s ON s.Id = i.StatisticId
Where s.Speed > @avgSpeed
AND s.Luck > @avgLuck
AND s.Mind > @avgMind

ORder by i.Name

select * from GameTypeForbiddenItems
select * from GameTypes
select * from Items


-- Task 11
Select i.Name as 'Item', i.Price, i.MinLevel, gt.Name as 'Forbidden Game Type' From Items i
LEFT JOIN GameTypeForbiddenItems gtbi ON gtbi.ItemId = i.Id
LEFT JOIN GameTypes gt ON gtbi.GameTypeId = gt.Id
ORDER BY gt.Name DESC, i.Name ASC

-- Task 9
--        sum
-- character statistic, 
-- game type statistic
-- items for user in game statistic.

Select * from [Statistics]
Select * from Games
select * from GameTypes
select * from Characters
select * from UsersGames
select * from UserGameItems

select u.Username, g.Name as 'Game', c.Name as 'Character', s.Strength + gt.BonusStatsId as 'Strength', s.Defence + gt.BonusStatsId as 'Defence', s.Speed + gt.BonusStatsId as 'Speed', s.Mind + gt.BonusStatsId as 'Mind', s.Luck +gt.BonusStatsId as 'Luck'
from Users u
Join UsersGames ug ON u.Id = ug.UserId

JOIN Games g ON ug.GameId = g.Id

JOIN GameTypes gt ON g.GameTypeId = gt.Id

JOIN Characters c ON ug.CharacterId = c.Id					--36

JOIN [Statistics] s ON s.Id = c.StatisticId

Join UserGameItems ugi ON ugi.UserGameId = ug.Id


