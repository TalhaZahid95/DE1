## Creating Data Warehouse

drop table if exists team_data;

create table team_data as 
select
t4.league_name,
t3.game_id,
t3.season,
t2.team_id,
t2.team_name,
t1.location,
t1.goals,
t1.yellow_cards,
t1.red_cards,
t1.result
from teamstats t1
left join teams t2
using (team_id)
left join games t3
using (game_id)
left join leagues t4
using (league_id);

select * from team_data;

## does home/away has any significance in the outcome of a match?

drop view if exists home_away_significance_in_outcome;
create view home_away_significance_in_outcome as 
select league_name, season, game_id, location, result
from team_data;

select * from home_away_significance_in_outcome;

drop procedure if exists select_league_year_home_away;

delimiter ??
create procedure select_league_year_home_away(
	IN league_ varchar(50),
		season_ integer
)
Begin
	select league_name, season, 
    (select count(result) from home_away_significance_in_outcome
    where location = 'h' and result = 'w' and league_name = league_
    and season = season_)/(select  count(distinct game_id) from home_away_significance_in_outcome
    where league_name = league_
    and season = season_)*100 as home_win_perc
    from home_away_significance_in_outcome 
    where league_name = league_
    and season = season_
    group by league_name, season;
    
End ??
Delimiter ;

call select_league_year_home_away('Serie a',2015);

## Highest number of red/yellow cards to a team according to the league and year?

drop view if exists Yellow_Red_card_count_team;

create view `Yellow_Red_card_count_team` as 
select league_name, season, team_name, location, yellow_cards,red_cards,result
from team_data;

select * from Yellow_Red_card_count_team;

drop procedure if exists Select_league_year_count_yellow_red_cards;

delimiter //
create procedure Select_league_year_count_yellow_red_cards(
	in league_ varchar(50),
		season_ integer
)
begin
	select league_name, season, team_name,
    (sum(yellow_cards)+sum(red_cards)) as total_cards
    from Yellow_Red_card_count_team
    where league_name = league_
    and season = season_
    group by team_name
    order by total_cards desc
    limit 5;
end //
delimiter ;

call Select_league_year_count_yellow_red_cards ('Premier league',2017);