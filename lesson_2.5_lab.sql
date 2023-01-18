USE sakila;
-- 1.Select all the actors with the first name ‘Scarlett’.
SELECT *  
FROM actor
WHERE first_name = 'Scarlett';

-- 2. How many films (movies) are available for rent and how many films have been rented?
SELECT count(film_id) 
FROM inventory; -- 4581 films are available for rent.
SELECT count(rental_id) 
FROM rental; -- 16044 films have been rented.

-- 3.What are the shortest and longest movie duration? Name the values max_duration and min_duration.
SELECT MAX(length) AS max_duration, MIN(length) AS min_duration
FROM sakila.film;

-- 4. What's the average movie duration expressed in format (hours, minutes)?
SELECT FLOOR(AVG(length)/60) AS hour, ROUND(AVG(length) % 60,2) AS min
FROM film;

-- 5. How many distinct (different) actors' last names are there?
SELECT COUNT(DISTINCt last_name) 
FROM actor;

-- 6. Since how many days has the company been operating (check DATEDIFF() function)?
SELECT DATEDIFF(MAX(payment_date),MIN(payment_date)) 
FROM payment;

-- 7.Show rental info with additional columns month and weekday. Get 20 results.
SELECT *, date_format(rental_date,'%M')  AS month,date_format(rental_date, '%W') AS weekday
FROM rental
LIMIT 20;

-- 8.Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
SELECT*,
CASE 
WHEN weekday(rental_date) < 5 THEN 'workday'
ELSE 'weekend'
END AS day_type
FROM rental;

-- 9.Get release years.
SELECT release_year 
FROM film;

-- 10.Get all films with ARMAGEDDON in the title.
SELECT title 
FROM film
WHERE title LIKE '%ARMAGEDDON%';

-- 11.Get all films which title ends with APOLLO.
SELECT title 
FROM film
WHERE title LIKE '%APOLLO';

-- 12.Get 10 the longest films.
SELECT * 
FROM film
ORDER BY length DESC
LIMIT 10;

-- 13.How many films include Behind the Scenes content?
SELECT COUNT(film_id) 
FROM film
WHERE special_features LIKE '%Behind the Scenes%';



