CREATE DATABASE movie_db;
USE movie_db;

# Top 10 Highest-Grossing Movies
SELECT 
    `Movie Title`, Revenue
FROM
    `new movie data`
ORDER BY revenue DESC
LIMIT 10;

# Which Movies Had the Best Return on Investment (ROI)?
SELECT 
    `Movie Title`,
    Budget,
    revenue,
    ((revenue - budget) / budget) * 100 AS ROI
FROM
    `new movie data`
WHERE
    budget > 0
ORDER BY ROI DESC
LIMIT 10;

# Which Genres Are the Most Profitable?
SELECT 
    Genre, SUM(profit) AS Total_profit
FROM
    `new movie data`
GROUP BY Genre
ORDER BY Total_profit DESC
LIMIT 5;

# Which Directors Have Generated the Most Revenue?
SELECT 
    director, SUM(Revenue) AS total_revenue
FROM
    `new movie data`
GROUP BY director
ORDER BY total_revenue DESC
LIMIT 5;

# How Has Movie Revenue Changed Over Time? (Yearly Trend)
SELECT 
    year, SUM(revenue) AS total_revenue
FROM
    `new movie data`
GROUP BY year
ORDER BY year ASC;

# Most Watched Movies Based on Revenue
SELECT 
    `Movie Title`, Revenue
FROM
    `new movie data`
ORDER BY Revenue DESC
LIMIT 5;

#Top 5 Actors Who Starred in the Most Movies
SELECT actor, COUNT(*) AS movie_count
FROM (
    SELECT `Cast (1)`AS actor FROM `new movie data` 
    UNION ALL
    SELECT `Cast (2)` FROM `new movie data` 
    UNION ALL
    SELECT `Cast (3)` FROM `new movie data` 
    UNION ALL
    SELECT `Cast (4)` FROM `new movie data`
    UNION ALL
    SELECT `Cast (5)` FROM `new movie data`
) AS all_cast
GROUP BY actor
ORDER BY movie_count DESC
LIMIT 5;

# Most Bankable Actors (Based on Total Revenue Earned by Their Movies)
SELECT actor, SUM(revenue) AS total_revenue
FROM (
    SELECT `Cast (1)` AS actor, revenue FROM `new movie data` 
    UNION ALL
    SELECT `Cast (2)`, revenue FROM `new movie data`
    UNION ALL
    SELECT `Cast (3)`, revenue FROM `new movie data`
    UNION ALL
    SELECT `Cast (4)`, revenue FROM `new movie data`
    UNION ALL
    SELECT `Cast (5)`, revenue FROM `new movie data`
) AS all_cast
GROUP BY actor
ORDER BY total_revenue DESC
LIMIT 5;



