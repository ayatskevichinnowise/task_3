SELECT *
FROM (
	SELECT 
        a.actor_id, 
        a.first_name, 
        a.last_name, 
        COUNT(f.film_id) AS amount_of_titles,
		DENSE_RANK() OVER(ORDER BY COUNT(f.film_id) DESC) AS placement
	FROM actor a 
		JOIN film_actor fa USING(actor_id)
		JOIN film f USING(film_id)
		JOIN film_category fc USING(film_id)
		JOIN category c USING(category_id)
	WHERE c."name" = 'Children'
	GROUP BY a.actor_id 
	ORDER BY 4 DESC
	) AS tmp
WHERE placement < 4;