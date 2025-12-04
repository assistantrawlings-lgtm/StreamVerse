Create database StreamVerse
use StreamVerse ;

create table Users(
User_id varchar(50) primary key,
Join_date date,
Subscription_tier varchar(50),
Region varchar(50)
) ;

CREATE TABLE Producers (
Producer_id VARCHAR(50) PRIMARY KEY,
Name VARCHAR(50) NOT NULL,
Headquarters_City VARCHAR(50)
);

create table Content(
Content_id varchar(50) primary key,
Title varchar(50),
Genre varchar(50),
Duration_minutes int,
Release_Year int,
Producer_id varchar(50),
foreign key (Producer_id) references Producers(Producer_id) on delete cascade);


create table Watch_History(
Watch_id varchar(50) primary key,
Watch_date date,
Watch_time_minutes int,
User_id varchar(50),
Content_id varchar(50),
foreign key (User_id) references Users(User_id) on delete cascade,
foreign key (Content_id) references Content(content_id) on delete cascade
);


select * from Users
select * from Watch_History
select * from producers
select * from Content

---part 2 data population
--- users table

insert into Users(User_id,Join_date,Subscription_tier,Region)
values
('U001', '2022-09-12', 'Basic', 'East'),
('U002', '2020-04-20', 'Premium', 'West'),
('U003', '2024-08-23', 'Basic', 'North'),
('U004', '2023-02-20', 'Premium', 'South'),
('U005', '2022-01-09', 'Premium', 'South') ;

--- Producers
insert into Producers(Producer_id,Name,Headquarters_City)
values
('P001','Rowlings','Port Harcourt'),
('P002','Godwin','Lagos'),
('P003','Ujile','Abuja'),
('P004','Japhet','Owerri') ;

update Producers
set Name = 'Nora'
where Producer_id = 'P004'
;

--- Content
insert into Content(Content_id,Producer_id,Title,Genre,Duration_minutes,Release_Year)
values
('C001','P001','Recipe for Nigerian jollof rice','Culinary','4','2024'),
('C002','P002','The richest man in Babylon','Non-Fiction','10','2019'),
('C003','P003','Ted Lasso','Sport-comedy drama','20','2023'),
('C004','P004','Keep going','Motivational','2','2025'),
('C005','P003','Multiverse','Sci-fi','10','2020'),
('C006','P001','The Shannara Chronnicles','Fantasy','25','2013') ;

--- Watch_History
insert into Watch_History(Watch_id, Watch_date, Watch_time_minutes, User_id, Content_id)
values
('W001','2022-06-17','10','U002','C002'),
('W002','2024-09-01','20','U003','C003'),
('W003','2025-02-21','2','U004','C004'),
('W004','2022-09-01','10','U005','C005'),
('W005','2020-10-01','25','U002','C006'),
('W006','2025-09-11','2','U003','C002'),
('W007','2024-09-01','10','U004','C005'),
('W008','2019-06-30','2','U005','C004'),
('W009','2021-01-02','15','U003','C003'),
('W010','2022-04-01','20','U002','C006') ;

select * from Watch_History
select * from Content

--- part3 Query Challenge
--- 1
select top 3 genre, sum(watch_time_minutes) as Total_Watch_Time
from Content c inner join Watch_History w
on c.Content_id = w.Content_id
group by Genre
;

--- 2
select p.Producer_id, Name 
from producers p join content c
on p.Producer_id = c.Producer_id
join Watch_History w on c.Content_id = w.Content_id
group by p.Producer_id, Name
having count(distinct w.User_id) < 3 ;

--- 3 
select u.User_id, Region, join_date
from Users as u left join Watch_History as w
on u.User_id = w.User_id
where Watch_id is null ;

--- 4
select avg(duration_minutes) as Average_Duration_Minutes
from Content as c
inner join Watch_History as w
on c.Content_id = w.Content_id
inner join Users as u
on u.User_id = w.User_id
where Subscription_tier = 'Premium';

--- 5
select Title, genre from Content
where Duration_minutes > (select avg(duration_minutes) from Content);

--- 6
select p.Name, count(distinct Title) as TotalTitles 
from Producers p inner join Content c
on p.Producer_id = c.Producer_id
group by p.Name
;

--- 7
select sum(Watch_time_minutes) as Total_minutes_watched
from watch_history as w inner join users as u
on w.User_id = u.User_id
group by Watch_time_minutes
having Watch_time_minutes > 10 ;

--- 8
select p.Name, c.Title 
from Producers p right join Content c
on p.Producer_id = c.Producer_id

--- 9
select u.User_id, u.Region 
from Users u 
inner join Watch_History w on u.User_id = w.User_id
inner join content c on c.Content_id = w.Content_id
inner join Producers p on p.Producer_id = c.Producer_id
where c.Genre = 'Sci-fi'
;
	
 --- 10
SELECT
    c.Content_id,
    c.Title
FROM
    Content c
JOIN
    Watch_History wh ON c.Content_id = wh.Content_id
GROUP BY
    c.Content_id, c.Title
HAVING
    COUNT(wh.Content_id) > (
        SELECT
            AVG(view_count)
        FROM
            (
                SELECT
                    COUNT(c.Content_id) AS view_count
                FROM
                    Watch_History
                GROUP BY
                    Content_id
            ) AS ContentViews
    );