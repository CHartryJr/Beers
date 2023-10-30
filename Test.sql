-- -- Write a query that returns the content of the Serves table.
-- -- Write another query that returns the content of the Serves table with the rows sorted by the beer
-- -- column. Display Table

-- SELECT * FROM SERVES;

-- RESULT
-- SERVES_ID|BEER_SOLD|BAR_SELLING|PRICE
-- |1|1|2.5
-- |2|1|3
-- |1|2|2.25
-- |1|3|3.25
-- |2|3|1.5
-- |3|3|2.1
-- |4|3|0.5


-- -- Write a query that returns the kinds of beers served. There shouldn’t be any duplicates
-- -- Different Kinds of Beers Served

-- SELECT DISTINCT NAME FROM BEER,SERVES WHERE BEER_ID = SERVES.BEER_SOLD;

-- RESULT
-- NAME
-- Budweiser
-- Corona
-- Dixie
-- Miller Lite


-- -- Write a query that returns the beers served with a price below $2.75.
-- -- Cheaper Beers

-- SELECT NAME,SERVES.PRICE FROM BEER JOIN SERVES ON SERVES.BEER_SOLD = BEER.BEER_ID WHERE SERVES.PRICE < 2.75;

-- RESULT
-- NAME|PRICE
-- Budweiser|2.5
-- Budweiser|2.25
-- Corona|1.5
-- Dixie|2.1
-- Miller Lite|0.5


-- -- Write a query that returns the addresses of the bars a specific drinker such as “Dan” frequents.
-- -- Find the Addresses of the Bars

-- SELECT D.FNAME || ' '|| D.LNAME AS VISTOR ,VIS_B.BAR_NAME, VIS_B.ADDRESS  
-- FROM DRINKER AS D JOIN (SELECT V.PERSON,B.NAME AS BAR_NAME,B.ADDRESS FROM VISITS as V join  BAR AS B  ON  V.BAR_VISITED = B.BAR_ID ) AS VIS_B
-- ON D.DRINKER_ID = VIS_B.PERSON  GROUP BY  D.FNAME, D.LNAME, VIS_B.BAR_NAME, VIS_B.ADDRESS;  

-- RESULT
-- VISTOR|BAR_NAME|ADDRESS
-- BEN BENJERMAN|SATISFACTION|905 W.MAIN STREET
-- DAN DANGER|SATISFACTION|905 W.MAIN STREET
-- DAN DANGER|THE EDGE|108 MORRIS STREET
-- LARC YRTRAH|CLUB BOBCAT|231 W Hancock STREET
-- LARC YRTRAH|SATISFACTION|905 W.MAIN STREET
-- LARC YRTRAH|THE EDGE|108 MORRIS STREET


-- Write a query that returns the names of all bars that serve a particular beer such as “Dixie”.
-- Find the Names of Bars

-- SELECT B.NAME AS Beer,B_SER.NAME AS 'Bar name' FROM BEER AS B JOIN (SELECT SERVES.*, BAR.Name FROM SERVES JOIN BAR ON BAR.BAR_ID  == SERVES.BAR_SELLING ) AS B_SER ON B.BEER_ID == B_SER.BEER_SOLD GROUP BY B.NAME,B_SER.NAME; 

-- RESULT
-- Beer|Bar name
-- Budweiser|CLUB BOBCAT
-- Budweiser|SATISFACTION
-- Budweiser|THE EDGE
-- Corona|CLUB BOBCAT
-- Corona|THE EDGE
-- Dixie|CLUB BOBCAT
-- Miller Lite|CLUB BOBCAT

-- Write a query that returns the drinkers who like one beer such as “Dixie” but not another beer such as “Corona”.
-- Find the Drinkers
 
-- SELECT B.NAME AS Beer, DRINKS.NAME AS 'Drinker that likes' FROM BEER AS B JOIN (SELECT LIKES.*, D.FNAME||' '||D.LNAME AS NAME FROM LIKES JOIN DRINKER AS D ON D.DRINKER_ID  ==  LIKES.PERSON) AS DRINKS ON B.BEER_ID == DRINKS.BEER_CHOICE GROUP BY B.NAME,DRINKS.NAME; 

-- Results
-- Beer|Drinker that likes
-- Budweiser|BEN BENJERMAN
-- Budweiser|DAN DANGER
-- Budweiser|LARC YRTRAH
-- Corona|AMY BRANCH
-- Corona|DAN DANGER
-- Corona|LARC YRTRAH
-- Dixie|LARC YRTRAH
-- Miller Lite|LARC YRTRAH

-- Write a query that finds pairs of bars (bar1 and bar2 should be different) that have the same price on at least one beer. Rows returned should look like: [bar1, bar2, beer].
-- Find Pairs of Bars



-- Write a query that finds all drinkers who ONLY visit bars that serve a specific beer such as “Dixie”.
-- Find the Drinkers With Common Likes
