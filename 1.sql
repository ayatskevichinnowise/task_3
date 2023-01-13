SELECT name, COUNT(fc.film_id) AS amount_of_films
FROM category c
	LEFT JOIN film_category fc USING(category_id)
GROUP BY c.category_id 
ORDER BY 2 DESC;