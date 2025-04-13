Q1 - Who is the senior most employee based on job title?

SELECT * FROM employee
ORDER BY levels DESC
LIMIT 1;

Q2 - Which country has most invoices?

SELECT * FROM invoice

SELECT COUNT (*), billing_country
FROM invoice 
GROUP BY billing_country
ORDER BY COUNT Desc;

Q3 - What are top 3 values of total invoices?

SELECT total FROM invoice
ORDER BY total DESC
LIMIT 3;

Q4 - Which city has the best customers?

SELECT billing_city, SUM(total) AS invoice_total
FROM invoice
GROUP BY billing_city
ORDER BY invoice_total DESC
LIMIT 1;

Q5 - Who is best customer?

SELECT c.customer_id, c.first_name, c.last_name, SUM(i.total) AS total
FROM customer AS c
LEFT JOIN invoice AS i
ON c.customer_id = i.customer_id
GROUP BY c.customer_id
ORDER BY total DESC
LIMIT 1;

Q6 - Return email, first_name, last_name & genre of all rock music listeners.
     Return list in alphabetically order by email.

SELECT DISTINCT email, first_name, last_name
FROM customer
JOIN invoice ON customer.customer_id = invoice.customer_id
JOIN invoice_line ON invoice.invoice_id = invoice_line.invoice_id
WHERE track_id IN(
	SELECT track_id FROM track
	JOIN genre ON track.genre_id = genre.genre_id
	WHERE genre.name LIKE 'Rock'
)
ORDER BY email;

Q7 - Artist who has written most rock music.
	 Return Artist name and total track count of top 10 rock bands.

SELECT artist.name AS artist_name, COUNT(track.track_id) AS total_rock_tracks
FROM artist
JOIN album ON artist.artist_id = album.artist_id
JOIN track ON album.album_id = track.album_id
JOIN genre ON track.genre_id = genre.genre_id
WHERE genre.name = 'Rock'
GROUP BY artist.artist_id, artist.name
ORDER BY total_rock_tracks DESC
LIMIT 10;

Q8 - Return all track names that have a song length longer than the average song length.
	 Return the name and milliseconds for each track. Order by song length with the longest songs listed first.

SELECT name, milliseconds
FROM track
WHERE milliseconds > (SELECT AVG(milliseconds) FROM track)
ORDER BY milliseconds DESC;





