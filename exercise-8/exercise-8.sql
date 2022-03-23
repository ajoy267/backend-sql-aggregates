-- rank of film category by times rented
-- include the name, count, and rank
SELECT 
    name,
    COUNT(*), 
    RANK() OVER(ORDER BY COUNT(*) DESC)
FROM 
    category
RIGHT JOIN 
    film_category
ON 
    category.category_id = film_category.category_id
RIGHT JOIN 
    inventory
ON 
    film_category.film_id = inventory.film_id
RIGHT JOIN 
    rental
ON 
    inventory.inventory_id = rental.inventory_id
GROUP BY 
    name
ORDER BY 
    RANK