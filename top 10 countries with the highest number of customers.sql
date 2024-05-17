-- SQL query to retrieve the top 10 countries with the highest number of customers

SELECT 
    co.country,                                 -- Country name from the country table
    COUNT(cu.customer_id) AS customer_count     -- Count of unique customer IDs to determine the number of customers per country
FROM 
    customer cu                                 -- Primary table containing customer data
INNER JOIN 
    address a ON cu.address_id = a.address_id   -- Joining with address table to link customers to their addresses
INNER JOIN 
    city ci ON a.city_id = ci.city_id           -- Joining with city table to link addresses to cities
INNER JOIN 
    country co ON ci.country_id = co.country_id -- Joining with country table to get the country for each city
GROUP BY 
    co.country                                  -- Grouping results by country to prepare for counting
ORDER BY 
    customer_count DESC                         -- Ordering results by the number of customers, from highest to lowest
LIMIT 
    10;                                         -- Limiting the results to the top 10 countries
