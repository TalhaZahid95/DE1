drop schema if exists DE_term_project2;
create schema DE_term_project2;
use DE_term_project2;

drop table if exists suicide;
create table suicide
(Region_code varchar(50),
Region_name varchar(50),
Country_code varchar(50),
Country_name varchar(500),
Year integer,
Gender varchar(10),
Age_group varchar(50),
suicide_rate_per_100k_people varchar(50),
lower_bound varchar(50),
upper_bound varchar(50),
Date_recorded varchar(50));

load data infile 'c:/ProgramData/MySQL/MySQL Server 8.0/Uploads/suicide.csv'
into table suicide
fields terminated by ','
lines terminated by '\r\n'
ignore 1 lines 
(Region_code, Region_name, Country_code, Country_name, Year, Gender,
Age_group,suicide_rate_per_100k_people, lower_bound, upper_bound,
Date_recorded);

select * from suicide;

