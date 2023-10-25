USE sakila;

# CHALLENGE 1

## 1.1	Determine the shortest and longest movie durations and name the values as max_duration and min_duration.

SELECT MAX(length) AS max_duration , MIN(length) AS min_duration FROM sakila.film;

## 1.2 	Express the average movie duration in hours and minutes.

SELECT AVG(length) AS average_duration, 
FLOOR(AVG(length) / 60) AS hours, AVG(length) % 60 AS minutes
FROM sakila.film;

## 2.1 	Calculate the number of days that the company has been operating

SELECT MAX(rental_date) AS max_date, 
MIN(rental_date) AS min_date,
DATEDIFF(MAX(rental_date), MIN(rental_date)) AS operating_days
FROM sakila.rental;

## 2.2	Retrieve rental information
##		Add two additional columns to show the month and weekday of the rental. 
## 		Return 20 rows of results

SELECT rental_date, 
MONTHNAME(rental_date) AS rental_month, 
DAYNAME(rental_date) AS rental_weekday
FROM sakila.rental LIMIT 20;

## 3.0	Replace NULL values in rental duration with NA and sort in ascending order.

SELECT title,
IFNULL(rental_duration, 'NA') AS rental_duration
FROM sakila.film
ORDER BY title ASC;


# CHALLENGE 2

## 1.1	The total number of films that have been released.

SELECT COUNT(title) AS "total_films"
FROM sakila.film;

## 1.2	The number of films for each rating.

SELECT rating, COUNT(*) AS total_count
FROM sakila.film
GROUP BY rating;

## 1.3	The number of films for each rating, sorting the results in descending order.

SELECT rating, COUNT(*) AS total_count
FROM sakila.film
GROUP BY rating
ORDER BY total_count DESC;


## 2.1	The mean film duration for each rating.

SELECT rating, AVG(length) AS average_length
FROM sakila.film
GROUP BY rating;

## 2.2	Which ratings have a mean duration of over two hours

SELECT rating, AVG(length) AS average_length
FROM sakila.film
GROUP BY rating
HAVING AVG(length) > 120;