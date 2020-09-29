#Look at the whole dataset
SELECT *
  FROM tutorial.us_housing_units
 
#grabing only the columns year, month, and west to specifically look at in the dataset
 
 SELECT year,
       month,
       west
  FROM tutorial.us_housing_units
  
#looking at the whole dataset without using the*
SELECT year,
       month,
       month_name,
       west,
       midwest,
       south,
       northeast
  FROM tutorial.us_housing_units

#Renaming the variable names in the dataset to be capitials.
SELECT year AS "Year",
       month AS "Month",
       month_name AS "Month Name",
       west AS "West",
       midwest AS "Midwest",
       south AS "South",
       northeast AS "Northeast"
  FROM tutorial.us_housing_units


#allowing us to see/run 15 of our rows in our dataset. The default is to show 100 rows/observations. 
SELECT *
  FROM tutorial.us_housing_units
 LIMIT 15


#Only includes data that meets a qualifying event. In this case, include all data that has 1 in the month varibale. 
SELECT *
  FROM tutorial.us_housing_units
 WHERE month = 1

#Selects all cases that have above 50,000 (only 50 cause the units are already in thousands) for the west column. 
SELECT *
  FROM tutorial.us_housing_units
 WHERE west > 50

#selects all cases that have 20,000 or less 
SELECT *
  FROM tutorial.us_housing_units
 WHERE south <= 20

#selects all cases that have February as their month (note: if you use < or >, for strings, they sort alphabetically)
SELECT *
  FROM tutorial.us_housing_units
 WHERE month_name = 'February'


#only selects cases with moths alphabetically n or before. 
SELECT *
  FROM tutorial.us_housing_units
 WHERE month_name <= 'n'

#caluclates the sum of the four regions in a separate column (AS = new varabible)   +/- only can be used across variables not to sum rows of a variable. 
SELECT year,
       month,
       west,
       south,
       midwest,
       northeast,
       west + south + midwest +northeast AS usa_total
  FROM tutorial.us_housing_units


#include datasets where west got gore than midwest and noreast combind
SELECT year,
       month,
       west,
       south,
       midwest,
       northeast
  FROM tutorial.us_housing_units
  WHERE west > (midwest + northeast)


#calculate percent and include data from more recent or equal to 2000
SELECT year,
       month,
       midwest/(west + south + midwest + northeast)*100 AS midwest_new,
       south/(west + south + midwest + northeast)*100 AS south_new,
       northeast/(west + south + midwest + northeast)*100 AS northeast_new,
       west/(west + south + midwest + northeast)*100 AS west_new
  FROM tutorial.us_housing_units
 WHERE year >= 2000

#% used to select specific charaters, in this case only include variables that have "luadcris" as their variable.
#note: this does not just have to be the first part case, %he% could select he, her, she ect... 
SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE "group" ilike '%ludacris%'


#this is what makes it start with a specific letter
SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE "group" LIKE 'DJ%'



#shows entries of several "specific cases" 
#in this example we are including cases that have one of 3
SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE "group" IN ('M.C. Hammer', 'Hammer', 'Elvis Presley')

#including cases that are between certain numbers 
SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year BETWEEN 1985 AND 1990


#excludes cases with missing data for a specific variable
SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE song_name IS NULL

#selecting case that include two different things which must be met
SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year_rank <= 10
   AND "group" ILIKE '%ludacris%'

SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year_rank = 1
   AND year IN (1990, 2000, 2010)

SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year BETWEEN 1960 AND 1969
   AND song_name ilike '%love%'

#using or allows you to have either case, but having and makes the first thing needing to hapen to then sort the secong
#conditional    
SELECT *
     FROM tutorial.billboard_top_100_year_end
     WHERE year_rank <= 10
       AND ("group" ILIKE '%katy perry%' OR "group" ILIKE '%bon jovi%')

SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE song_name LIKE '%California%'
   AND (year BETWEEN 1970 AND 1979 OR year BETWEEN 1990 AND 1999)

SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE "group" ILIKE '%dr. dre%'
   AND (year <= 2000 OR year >= 2010)

#NOT include every case excpet what you specify 
   SELECT *
      FROM tutorial.billboard_top_100_year_end
     WHERE song_name NOT ILIKE '%a%'
       AND year = 2013

#order in decending order 
SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year = 2012
 ORDER BY song_name DESC

SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE "group" ILIKE '%t-pain%'
 ORDER BY year_rank DESC

SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year IN (2013, 2003, 1993)  --
   AND year_rank BETWEEN 10 AND 20  
 ORDER BY year, year_rank