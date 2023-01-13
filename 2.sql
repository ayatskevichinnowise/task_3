SELECT a.first_name, a.last_name, COUNT(r.rental_id) AS amount_of_rent
FROM actor a 
	JOIN film_actor fa USING(actor_id)
	JOIN film f USING(film_id)
	JOIN inventory i USING(film_id)
	JOIN rental r USING(inventory_id)
GROUP BY a.actor_id 
ORDER BY 3 DESC
LIMIT 10;