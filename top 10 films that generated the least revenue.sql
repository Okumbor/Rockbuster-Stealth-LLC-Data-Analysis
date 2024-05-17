-- SQL query to identify the top 10 films that generated the least revenue

SELECT 
    f.title,                                 -- Title of the film from the film table
    SUM(p.amount) AS total_revenue           -- Sum of payments made for each film, labeled as total_revenue
FROM 
    film f                                   -- Primary table containing film data
JOIN 
    inventory i ON f.film_id = i.film_id     -- Joining inventory to films using the film_id to link film data with its physical copies
JOIN 
    rental r ON i.inventory_id = r.inventory_id -- Joining rental to inventory to track rentals for each inventory item
JOIN 
    payment p ON r.rental_id = p.rental_id   -- Joining payment to rental to include payment details for rentals
GROUP BY 
    f.title                                  -- Grouping the results by film title to aggregate the revenue data
ORDER BY 
    total_revenue ASC                        -- Ordering the results by total revenue in ascending order to find the least revenue-generating films
LIMIT 
    10;                                      -- Limiting the output to only the top 10 least revenue-generating films
