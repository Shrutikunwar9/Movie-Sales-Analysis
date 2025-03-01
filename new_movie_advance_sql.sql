use movie_db;

# Profitability & ROI Trends Over Time

SELECT year, 
       ROUND(AVG(roi),2) AS avg_roi, 
       AVG(profit) AS avg_profit
FROM (
    SELECT year, 
           ((Revenue - Budget) / Budget) * 100 AS roi, 
           (Revenue - Budget) AS profit
    FROM `new movie data`
    WHERE Budget > 0 AND Revenue > 0
) AS calculated_values
GROUP BY year
ORDER BY year;

#  Which Genres Make the Most Money?

SELECT Genre, 
       COUNT(*) AS movie_count, 
       SUM(Revenue) AS total_revenue, 
      ROUND( AVG((Revenue - Budget) / Budget * 100),3) AS avg_roi
FROM `new movie data`
GROUP BY Genre
ORDER BY total_revenue DESC
LIMIT 5;

# Star Power: Do Big Actors Mean Bigger Profits? 

SELECT actor, 
       COUNT(*) AS movie_count, 
       SUM(Revenue) AS total_revenue, 
       ROUND(AVG((Revenue - Budget) / Budget * 100),2) AS avg_roi
FROM (
    SELECT `Cast (1)` AS actor, revenue, budget FROM `new movie data`
    UNION ALL
    SELECT `Cast (2)`, revenue, budget FROM `new movie data`
    UNION ALL
    SELECT `Cast (3)`, revenue, budget FROM `new movie data`
    UNION ALL
    SELECT `Cast (4)`, revenue, budget FROM `new movie data` 
    UNION ALL
    SELECT `Cast (5)`, revenue, budget FROM `new movie data`
) AS all_cast
GROUP BY actor
ORDER BY total_revenue DESC
LIMIT 5;

# Box Office Bombs vs. Blockbusters

(SELECT `Movie Title`, Budget, Revenue, (Revenue - Budget) AS profit
 FROM `new movie data`
 ORDER BY profit DESC
 LIMIT 5)
 
UNION ALL

(SELECT `Movie Title`, Budget, Revenue, (Revenue - Budget) AS profit
 FROM `new movie data`
 ORDER BY profit ASC
 LIMIT 5);
 
 #  Which directors consistently make profitable movies?
 
 SELECT director, 
       COUNT(*) AS movie_count, 
       AVG((Revenue - Budget) / Budget * 100) AS avg_roi, 
       SUM(Revenue - Budget) AS total_profit
FROM `new movie data`
WHERE Budget > 0 AND Revenue > 0
GROUP BY director
ORDER BY total_profit DESC
LIMIT 5;

