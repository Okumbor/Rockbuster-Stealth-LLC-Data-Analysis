-- SQL query to retrieve customer spending by country

SELECT 
    cu.customer_id,       -- Customer's unique identifier
    cu.first_name,        -- Customer's first name
    cu.last_name,         -- Customer's last name
    co.country,           -- Country name from the country table
    SUM(p.amount) AS total_spent  -- Total amount spent by the customer, summarized and named as total_spent
FROM 
    customer cu           -- Primary table containing customer details
JOIN 
    address a ON cu.address_id = a.address_id  -- Joining with address to get customer's address details
JOIN 
    city ci ON a.city_id = ci.city_id          -- Joining with city to link addresses to cities
JOIN 
    country co ON ci.country_id = co.country_id  -- Joining with country to derive the country for each city
JOIN 
    payment p ON cu.customer_id = p.customer_id  -- Joining with payment to aggregate total spent by each customer
GROUP BY 
    cu.customer_id,      -- Grouping results by customer ID
    co.country           -- Also grouping by country to distinguish customers in different countries
ORDER BY 
    total_spent DESC;    -- Ordering results by total spent in descending order to see the highest spenders first
