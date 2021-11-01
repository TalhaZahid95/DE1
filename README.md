Overview
This folder contains the SQL scripts and the ER diagram which were created as a part of DE1 term project. The first script Zahid_Muhammad_SQL_term_project1_script1 contains 
the schemas and the command run for the creationof tables, while the second script Zahid_Muhammad_SQL_term_project1_script2 contains querries and commands for the creation 
of analytical layer i.e. data warehouse & data marts.
Operational Layer
My Operational layer consists of 4 tables. The first table games includes all the relevant information on the games played in a league between 2014-2018. The second table leagues 
contains information on league name and their ID's. The third table teams contains data on teams i.e. their names and ID's. The fourth table teamstats contains data with the 
location of a match, number of red/yellow cards if any and the outcome of the game. The below diagram shows the relationship between all the tables.


Analytical Layer:
Steps for Analytical Layer:
Create ETL Pipeline to create a data warehouse
Create ETL Pipeline to create a data mart for analysis


Data Warehouse:
The Data Warehouse named as team_data was created with the help of left joins, all the relevant fields from the data were selected and integrated in to a table for the purpose 
of analysis.
Data Marts:
Using the Data Warehouse (team_data) i created earlier, i made 2 Data Marts with the help of views to answer specific question related to the data set.
View 1: home_away_significance_in_outcome which included all the relevant fields from the data set which were required to help in the analysis of my question. The view was further 
dropped into a procedure (Select_league_year_home_away) which allow the viewer to select a particular league and particular year to see if the home or away had any significant 
advantage or disadvantage for the playing teams in terms of the win percentage for the teams playing in their home grounds.
View 2: Yellow_Red_card_count_team which included all the relevant fields from the data set which were required to help in the analysis of my question. The view was further
dropped into a procedure (Select_league_year_count_yellow_red_cards) which allow the viewer to see the top 5 teams in any particular league and any particular season which recieved 
the most number of red and yellow cards combined.
