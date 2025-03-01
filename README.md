# Movie-Sales-Analysis

## Project Overview

This project analyzes movie sales data using SQL to extract key insights, including profitability, return on investment (ROI), and revenue trends. The data was cleaned and prepared in Excel before being imported into SQL for advanced analysis. The final insights are visualized in an Excel dashboard.

##  Dataset Used
- <a href="https://github.com/Shrutikunwar9/Movie-Sales-Analysis/blob/main/new%20movie%20data.csv">Movie Dataset</a>

## Data Handling

The dataset was imported via the SQL Server Import Wizard, so no explicit schema creation queries are provided.

The dataset consists of movie-related attributes like title, genre, director, budget, revenue, profit, ROI, and cast information as provided in **Movie Dataset**.

All data cleaning and additional calculations (e.g., ROI, profit) were performed in Excel before importing into SQL.

## Key Analyses

**Advanced Insights:**

## Dashboard
![Advance query](https://github.com/user-attachments/assets/0f66ee57-edab-4c28-a08b-f105c45e507d)


**Basic Queries:**

## Dashboard
![Basic query](https://github.com/user-attachments/assets/4bddfe3f-db82-4084-997a-153c543be1b5)


## Business Problems and Solutions
## SQL Insights

**1. Profitability & ROI Trends Over Time**
```sql
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
```

**2. Which Genres Make the Most Money?**
```sql
SELECT Genre, 
       COUNT(*) AS movie_count, 
       SUM(Revenue) AS total_revenue, 
      ROUND( AVG((Revenue - Budget) / Budget * 100),3) AS avg_roi
FROM `new movie data`
GROUP BY Genre
ORDER BY total_revenue DESC
LIMIT 5;
```

**3. Star Power: Do Big Actors Mean Bigger Profits?**
```sql
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
```

**4. Box Office Bombs vs. Blockbusters**
```sql
(SELECT `Movie Title`, Budget, Revenue, (Revenue - Budget) AS profit
 FROM `new movie data`
 ORDER BY profit DESC
 LIMIT 5)
 
UNION ALL

(SELECT `Movie Title`, Budget, Revenue, (Revenue - Budget) AS profit
 FROM `new movie data`
 ORDER BY profit ASC
 LIMIT 5);
```

**5. Which Directors Consistently Make Profitable Movies?**
```sql
SELECT director, 
       COUNT(*) AS movie_count, 
       AVG((Revenue - Budget) / Budget * 100) AS avg_roi, 
       SUM(Revenue - Budget) AS total_profit
FROM `new movie data`
WHERE Budget > 0 AND Revenue > 0
GROUP BY director
ORDER BY total_profit DESC
LIMIT 5;
```

**6. Top 10 Highest-Grossing Movies**
```sql
SELECT 
    `Movie Title`, Revenue
FROM
    `new movie data`
ORDER BY revenue DESC
LIMIT 10;
```

**7. Which Movies Had the Best Return on Investment (ROI)?**
```sql
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
```

**8. Which Genres Are the Most Profitable?**
```sql
SELECT 
    Genre, SUM(profit) AS Total_profit
FROM
    `new movie data`
GROUP BY Genre
ORDER BY Total_profit DESC
LIMIT 5;
```

**9.Which Directors Have Generated the Most Revenue?**
```sql
SELECT 
    director, SUM(Revenue) AS total_revenue
FROM
    `new movie data`
GROUP BY director
ORDER BY total_revenue DESC
LIMIT 5;
```

**10. How Has Movie Revenue Changed Over Time? (Yearly Trend)**
```sql
SELECT 
    year, SUM(revenue) AS total_revenue
FROM
    `new movie data`
GROUP BY year
ORDER BY year ASC;
```

**11.Most Watched Movies Based on Revenue.**
```sql
SELECT 
    `Movie Title`, Revenue
FROM
    `new movie data`
ORDER BY Revenue DESC
LIMIT 5;
```

**12.Top 5 Actors Who Starred in the Most Movies**
```sql
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
```

**13.Most Bankable Actors (Based on Total Revenue Earned by Their Movies)**
```sql
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
```

## Conclusion
Here's a draft for the conclusion section of your README.md:

## Conclusion

In this project, we performed an in-depth analysis of movie sales data to uncover valuable insights. By leveraging SQL queries, we were able to answer various important questions, such as:

- Profitability and ROI trends over time
- The most profitable genres
- The impact of star power on movie profits
- Identifying box office hits and flops
- Directors who consistently produce profitable movies
- Highest-grossing movies
- Movies with the best return on investment (ROI)
- Yearly trends in movie revenue
- Most watched movies based on revenue
- Top actors in terms of movie count and total revenue generated

These insights can help industry professionals make data-driven decisions to maximize profitability and understand market trends better. The analysis also highlights the importance of factors like budget allocation, genre selection, and star power in the success of movies.

Feel free to explore the SQL queries provided to gain a deeper understanding of the data and the techniques used in this analysis. Thank you for taking the time to review this project!

## Thank You
