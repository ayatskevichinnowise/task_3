-- Titles that are not in inventory
SELECT f.title
FROM film f 
	LEFT JOIN inventory i USING(film_id)
WHERE i.inventory_id IS NULL;