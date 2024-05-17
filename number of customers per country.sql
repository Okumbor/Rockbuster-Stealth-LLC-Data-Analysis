-- SQL query to calculate the number of customers per country and order the results by the customer count in descending order

SELECT 
    co.country,                         -- Selecting the country name
    COUNT(cu.customer_id) AS customer_count  -- Counting unique customer IDs to get the total number of customers per country
FROM 
    customer cu                         -- From the customer table
INNER JOIN 
    address a ON cu.address_id = a.address_id  -- Joining with the address table to get address details for each customer
INNER JOIN 
    city ci ON a.city_id = ci.city_id          -- Joining with the city table to link addresses to cities
INNER JOIN 
    country co ON ci.country_id = co.country_id  -- Joining with the country table to fetch the country name for each city
GROUP BY 
    co.country                         -- Grouping the results by country
ORDER BY 
    customer_count DESC;               -- Ordering the results by the customer count in descending order to show the countries with the most customers at the top
