# Shutterfly
Code Challenge
# Prequsites:

Python 3.0 is required for this code as pymysql need to be used
MySQL is the database used to save data 

# Assumptions:
Pre built solutions / parser / libraries are not used, hence custom parses is built. 


# Libraries used:
I have used pymysql library in order to connect MYSql database server. 

Liraried which can make it better:
There are many libraries available which can do the task much faster and efficient but i assumed that readily available functions are not allowed.
Therefor i didnt use them. Below mentioned libraries could have worked better in this case
re - for regex
itertools for iterations and work with key value pairs
ast - to convert lists into key value pairs  
pandas - to create data frames and calculate in memory
json - to parse json files.


# SQL:
All sql code resides in *.sql files in 'src' folder. 
There are 1 file for creating objects and another file to populate data.
I am not calling SQL filed from python file because we create DB objects once and there is no point keep checking their existence before every execution


# Failed or incomplete test cases:
1) Nested Json parsing for site_visits (tag) element is not implemented. tried to load that table alone separately using json normalize to flatten the structure but couldn't get that working because of time constraints.
2) I couldn’t check for rows already exists in tables before insert and update. I couldn’t finish in time because of work pressure at my current job

# Future challenges
1) data cleansing data needs more work
2) Parsing of nestec key value pairs need to be taken care


