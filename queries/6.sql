-- The cities with the number of active and inactive customers
SELECT 
	c2.city_id, 
	c2.city,
	COUNT(c.active) - SUM(c.active) AS non_active_users, 
	SUM(c.active) AS active_users
FROM customer c 
	JOIN address a USING(address_id)
	JOIN city c2 USING(city_id)
GROUP BY c2.city_id 
ORDER BY 3 DESC;