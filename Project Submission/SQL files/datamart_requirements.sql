/* Requirement 1.
For each Rental, list the email address of the Customer and which Store it was rented from / they are a customer of. */
SELECT r.rental_id AS 'Rental ID', f.title AS 'Film title', s.store_id AS 'Store ID', s.address AS 'Store address', CONCAT(c.first_name , ' ' , c.last_name) AS 'Customer Name', c.email AS 'Customer Email'
FROM dim_customer AS c, fact_rental AS r, dim_film AS f, dim_store AS s
WHERE c.customer_id = r.customer_id
AND r.film_id = f.film_id
AND s.store_id = r.store_id
ORDER BY s.store_id ASC;

/* Rquirement 2.
List the least popular films (10) released in 2005 and list the actor for these films.*/

SELECT r.rental_id AS 'Rental ID', r.film_id AS 'Film ID', f.title as 'Film Title', CONCAT(a.first_name, ' ', a.last_name) AS 'Actor Name'
FROM fact_rental AS r, dim_film as f, dim_actor AS a
WHERE r.film_id = f.film_id
AND r.actor_id = a.actor_id 
GROUP BY r.film_id
ORDER BY COUNT(r.film_id) DESC LIMIT 10;




/* Requirement 3.
Identify which films are currently on rent, and provide what Category. "Today's" date: 24 October, 2005 */
SELECT r.rental_id AS 'Rental ID', f.film_id AS 'Film ID', f.title AS 'Title', r.rental_date AS 'Rental Date', c.name AS 'Category'
FROM fact_rental as r, dim_film as f, dim_category as c
WHERE r.film_id = f.film_id
AND r.category_id = c.category_id
AND r.rental_date > '2005-10-24 00:00:00' /* Today */
AND r.rental_date < '2005-10-25 00:00:00' /* Tomorrow */
/*AND r.return_date > '2005-10-24 00:00:00'*/; /* Not included as it shows no results, becasue all dates are random. In a real application, this date could only be in the future from 'today' */

/*

Would use this is actual application;

SELECT r.rental_id AS 'Rental ID', f.film_id AS 'Film ID', f.title AS 'Title', r.rental_date AS 'Rental Date', c.name AS 'Category'
FROM fact_rental as r, dim_film as f, dim_category as c
WHERE r.film_id = f.film_id
AND r.category_id = c.category_id
AND r.rental_date > CURRENT_DATE()
AND r.rental_date < CURRENT_DATE() + INTERVAL 1 DAY
*/

/* Requirement 4.
For each Rental, list which are over €25.50 */
SELECT r.rental_id AS 'Rental ID **For each rental**', f.film_id AS 'Film ID', f.title AS 'film_title', f.rental_rate AS 'Price per rental'
FROM fact_rental AS r, dim_film as f
WHERE r.film_id = f.film_id
AND f.rental_rate > 25.50;