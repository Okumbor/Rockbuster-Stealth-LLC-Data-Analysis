-- SQL query to calculate total sales by country

SELECT 
    co.country,                               -- Selecting the country name
    SUM(p.amount) AS total_sales              -- Summing up payment amounts and labeling the sum as total_sales
FROM 
    payment p                                 -- Starting from the payment table, which records transaction amounts
JOIN 
    rental r ON p.rental_id = r.rental_id     -- Joining payment to rental to link payments to their respective rentals
JOIN 
    inventory i ON r.inventory_id = i.inventory_id -- Joining rental to inventory to link rentals to specific inventory items
JOIN 
    store s ON i.store_id = s.store_id        -- Joining inventory to store to locate where the inventory items are held
JOIN 
    address a ON s.address_id = a.address_id  -- Joining store to address to get the physical address of each store
JOIN 
    city ci ON a.city_id = ci.city_id         -- Joining address to city to further detail the location
JOIN 
    country co ON ci.country_id = co.country_id -- Finally, joining city to country to reach the country details
GROUP BY 
    co.country                                -- Grouping results by country, to aggregate sales data by this dimension
ORDER BY 
    total_sales DESC;                         -- Ordering the results by the total sales, from highest to lowest
