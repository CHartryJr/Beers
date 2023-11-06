-- -- -- Write a query that returns the content of the Serves table.
-- -- -- Write another query that returns the content of the Serves table with the rows sorted by the beer
-- -- -- column. Display Table

-- SELECT BEER.NAME AS BEER_SOLD,BAR.NAME AS BAR_SELLING FROM SERVES JOIN BEER ON SERVES.BEER_SOLD = BEER.BEER_ID JOIN BAR ON BAR.BAR_ID = SERVES.BAR_SELLING ORDER by BEER_SOLD;

--  -- -- RESULT
-- --SERVES_ID|BEER_SOLD|BAR_SELLING|PRICE
-- -- BEER_SOLD|BAR_SELLING
-- -- Budweiser|THE EDGE
-- -- Budweiser|SATISFACTION
-- -- Budweiser|CLUB BOBCAT
-- -- Corona|THE EDGE
-- -- Corona|CLUB BOBCAT
-- -- Dixie|CLUB BOBCAT
-- -- Miller Lite|CLUB BOBCAT
-- -- Miller Lite|SATISFACTION

-- -- -- Write a query that returns the kinds of beers served. There shouldn’t be any duplicates
-- -- -- Different Kinds of Beers Served

-- SELECT DISTINCT NAME AS BEERS FROM BEER,SERVES WHERE BEER_ID = SERVES.BEER_SOLD;

-- -- -- RESULT
-- -- BEERS
-- -- Budweiser
-- -- Corona
-- -- Dixie
-- -- Miller Lite


-- -- -- Write a query that returns the beers served with a price below $2.75.
-- -- -- Cheaper Beers

-- SELECT DISTINCT NAME AS BEERS FROM BEER JOIN SERVES ON SERVES.BEER_SOLD = BEER.BEER_ID WHERE SERVES.PRICE < 2.75;

-- -- -- RESULT
-- -- BEERS
-- -- Budweiser
-- -- Corona
-- -- Dixie
-- -- Miller Lite


-- -- -- Write a query that returns the addresses of the bars a specific drinker such as “Dan” frequents.
-- -- -- Find the Addresses of the Bars

-- SELECT  B.ADDRESS FROM BAR B JOIN VISITS V ON B.BAR_ID = V.BAR_VISITED JOIN DRINKER D ON V.PERSON = D.DRINKER_ID WHERE D.FNAME = 'DAN';

-- -- -- RESULT
-- -- ADDRESS
-- -- 108 MORRIS STREET
-- -- 905 W.MAIN STREET


-- -- -- Write a query that returns the names of all bars that serve a particular beer such as “Dixie”.
-- -- -- Find the Names of Bars

-- SELECT B.NAME AS BAR FROM BAR B JOIN SERVES S ON S.BAR_SELLING  = B.BAR_ID JOIN BEER ON  S.BEER_SOLD = BEER.BEER_ID WHERE BEER.NAME ='Dixie';   

-- -- -- RESULT
-- -- BAR
-- -- CLUB BOBCAT


-- -- -- Write a query that returns the drinkers who like one beer such as “Dixie” but not another beer such as “Corona”.
-- -- -- Find the Drinkers

-- SELECT DISTINCT D.*
-- FROM DRINKER D JOIN 
-- LIKES L ON D.DRINKER_ID = L.PERSON JOIN 
-- BEER B ON L.BEER_CHOICE = B.BEER_ID 
-- WHERE B.NAME ='Dixie' AND D.DRINKER_ID NOT IN 
-- (SELECT L.PERSON FROM LIKES L JOIN BEER B ON L.BEER_CHOICE = B.BEER_ID WHERE B.NAME ='Corona');

--  -- -- Result
--  DRINKER_ID|FNAME|LNAME|ADDRESS
-- 7|Mike|Kickbuttowski|212 getDoe Blvd


-- -- -- Write a query that finds pairs of bars (bar1 and bar2 should be different) that have the same price on at least one beer. Rows returned should look like: [bar1, bar2, beer].
-- -- -- Find Pairs of Bars

--  SELECT B.NAME AS BAR1 ,B2.NAME AS BAR2 ,B2.BEER FROM (SELECT S.BEER_SOLD,S.PRICE,BAR.NAME FROM SERVES S JOIN BAR ON S.BEER_SOLD = BAR.BAR_ID) AS B  JOIN (SELECT  S2.BEER_SOLD ,S2.PRICE,BAR.NAME,BEER.NAME AS BEER FROM SERVES S2 JOIN BAR ON S2.BAR_SELLING = BAR.BAR_ID JOIN BEER ON S2.BEER_SOLD = BEER.BEER_ID) AS B2  ON B.PRICE = B2.PRICE AND B.BEER_SOLD != B2.BEER_SOLD;

-- -- -- Result
-- -- BAR1|BAR2|BEER
-- -- THE EDGE|SATISFACTION|Miller Lite


-- -- -- Write a query that finds all drinkers who ONLY visit bars that serve a specific beer such as “Dixie”.
-- -- -- Find the Drinkers With Common Likes

-- SELECT DISTINCT  D.FNAME||' '||D.LNAME AS Drinker,D.ADDRESS  FROM SERVES JOIN BEER B ON SERVES.BEER_SOLD = B.BEER_ID  JOIN BAR ON SERVES.BAR_SELLING = BAR.BAR_ID JOIN VISITS ON VISITS.BAR_VISITED = BAR.BAR_ID JOIN DRINKER D ON D.DRINKER_ID = VISITS.PERSON WHERE B.NAME = 'Dixie' GROUP BY BAR.NAME,D.FNAME;

--  -- -- Result
-- Drinker|ADDRESS
-- LARC YRTRAH|211 BOBCAT STREET
-- Luke Skywalker|11 galaxy st.
