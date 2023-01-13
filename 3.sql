SELECT c.category_id, c."name", SUM(p.amount) AS revenue
FROM category c  
	JOIN film_category fc USING(category_id)
	JOIN film f USING(film_id)
	JOIN inventory i USING(film_id)
	JOIN rental r USING(inventory_id)
	LEFT JOIN payment p USING(rental_id, customer_id)
GROUP BY c.category_id 
ORDER BY 3 DESC
LIMIT 1;