SELECT *
FROM (
	SELECT  
			c2.city_id, 
			c2.city, 
			c."name",
			ROUND(SUM(amount_of_hours) :: numeric, 2) amount_of_hours, 
			ROW_NUMBER() OVER(PARTITION BY c2.city_id ORDER BY SUM(amount_of_hours) DESC) AS placement
	FROM category c 
		JOIN film_category fc USING(category_id)
		JOIN film f USING(film_id)
		JOIN inventory i USING(film_id)
		JOIN (SELECT 
			r.rental_id, 
			r.inventory_id,
			r.customer_id,
			EXTRACT(EPOCH FROM COALESCE(return_date, last_update) - rental_date) / 3600 AS amount_of_hours
		  FROM rental r ) r USING(inventory_id)
		JOIN customer cust USING(customer_id)
		JOIN address a USING(address_id)
		JOIN city c2 USING(city_id)		
	WHERE c2.city LIKE 'A%' OR 
		  c2.city LIKE '%-%'	
	GROUP BY c2.city_id, c.category_id
	) AS tmp
WHERE placement = 1;