Drop schema if exists football;
create schema football;
use football;

drop table if exists leagues;
create table leagues
(league_id integer not null primary key,
league_name varchar(50));

LOAD DATA INFILE 'c:/ProgramData/MySQL/MySQL Server 8.0/Uploads/leagues.csv'
into table leagues
fields terminated by ','
optionally enclosed by '"'
lines terminated by '\r\n'
ignore 1 lines
(league_id, league_name); 

select * from leagues;

drop table if exists teams;
create table teams
(team_id integer not null primary key,
team_name varchar(50));

load data infile 'c:/ProgramData/MySQL/MySQL Server 8.0/Uploads/teams.csv'
into table teams
fields terminated by ','
optionally enclosed by '"'
lines terminated by '\r\n'
ignore 1 lines
(team_id, team_name);

select * from teams;

drop table if exists games;

create table games
(game_id integer primary key,
league_id integer,
season integer,
date varchar(50),
home_team_id integer,
away_team_id integer,
home_goals integer,
away_goals integer,
foreign key (league_id) references leagues(league_id),
foreign key (home_team_id) references teams(team_id),
foreign key (away_team_id) references teams(team_id));

load data infile 'c:/ProgramData/MySQL/MySQL Server 8.0/Uploads/games.csv'
into table games
fields terminated by ','
optionally enclosed by '"'
lines terminated by '\r\n'
ignore 1 lines
(game_id, 
league_id, 
season, 
date, 
home_team_id, 
away_team_id, 
home_goals, 
away_goals);
select * from games;

drop table if exists teamstats;

create table teamstats
(game_id integer not null,
team_id integer not null,
season integer,
date varchar(50),
location varchar(2),
goals integer,
yellow_cards varchar(50),
red_cards varchar(50),
result varchar(2),
foreign key (team_id) references teams(team_id),
foreign key (game_id) references games(game_id));

load data infile 'c:/ProgramData/MySQL/MySQL Server 8.0/Uploads/teamstats.csv'
into table teamstats
fields terminated by ','
optionally enclosed by '"'
lines terminated by '\r\n'
ignore 1 lines
(game_id, 
team_id, 
season, 
date, 
location, 
goals,  
yellow_cards, 
red_cards, 
result);
select * from teamstats;
