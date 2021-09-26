drop schema firstdb;
drop schema firstdb;
create schema firstdb;
use firstdb;
show variables like "local_infile";
SHOW VARIABLES LIKE "secure_file_priv";
SHOW VARIABLES LIKE "local_infile";


show tables;
describe birdstrikes1;
select * from birdstrikes1;
select airline,cost,state from birdstrikes1;

drop table if exists new_birdstrikes;
create table employees1 (ID int not null,employee_name varchar(255) not null, primary key (ID));
select * from employees1;
insert into employees1 (ID,employee_name) values(1, 'loru');
insert into employees1 (ID,employee_name) values(2, 'lundloru');
insert into employees1 (ID,employee_name) values(3, 'bhagloru');
select * from employees1;
update employees1 set employee_name='Arnold' where ID = '1';
select * from employees1;
use birdstrikes;
show tables;
select * from birdstrikes;
select * from birdstrikes1;
LOAD DATA INFILE 'c:/ProgramData/MySQL/MySQL Server 8.0/Uploads/birdstrikes_small.csv' 
INTO TABLE birdstrikes 
FIELDS TERMINATED BY ';' 
LINES TERMINATED BY '\n' 
IGNORE 1 LINES 
(id, aircraft, flight_date, damage, airline, state, phase_of_flight, @v_reported_date, bird_size, cost, @v_speed)
SET
reported_date = nullif(@v_reported_date, ''),
speed = nullif(@v_speed, '');
select * from birdstrikes;
exercise 2
answer= Tennessee
select * from birdstrikes limit 144,1;
exercise 3
answer= 2000-04-18
select distinct flight_date from birdstrikes order by flight_date desc limit 1;
exercise 4
answer= 5345
select distinct cost from birdstrikes order by cost desc limit 49,1;
select * from birdstrikes where state != 'Alamaba';
select distinct state from birdstrikes where state like 'A%';
select distinct state from birdstrikes where state like 'ala%';
select distinct state from birdstrikes where state like 'North _a%';
select distinct state from birdstrikes where state not like 'a%' order by state;
select distinct state from birdstrikes where state is not null and state != '' order by state;
'exercise 5'
'answer=colorado'
select state from birdstrikes where state is not null and state != '' and bird_size is not null and bird_size != '';
select * from birdstrikes where flight_date between "" and 52,12,31 and state = 'colorado';
exercise 6
answer= 7939
select flight_date from birdstrikes where state = 'colorado'and weekofyear(flight_date)=52;
select now();
select datediff(now(),(select flight_date from birdstrikes where state = 'colorado'and weekofyear(flight_date)=52));
