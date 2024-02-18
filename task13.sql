--1. Select only the Names of all the Bands.
SELECT name 
FROM bands
--2. Select the Oldest Album.
SELECT * 
FROM albums
WHERE release_year = (SELECT MIN(release_year) FROM albums)
--3. Get all Bands that have Albums.
SELECT
		b.name
FROM bands b
JOIN albums a
ON b.id = a.band_id
--4. Get all Bands that have No Albums
SELECT 
		b.name
FROM bands b
LEFT JOIN albums a
ON b.id = a.band_id
WHERE a.band_id is NULL
--5. Get the Longest Album
SELECT
 a.name AS [Album Name],
    SUM(s.length) AS [Total Length]
FROM albums a
JOIN songs s
ON a.id = s.album_id
GROUP BY a.id, a.name
ORDER BY [Total Length] DESC
OFFSET 0 ROWS
FETCH FIRST 1 ROW ONLY;
--6. Get the Average Length of all Songs
SELECT 
		AVG(length) AS average_length
FROM songs;
--7. Select the longest Song off each Album
SELECT
		a.name AS [Album Name],
		s.name AS [Song Name]
FROM albums a
JOIN songs s
ON a.id = s.album_id
WHERE length = (SELECT MAX(length) FROM songs WHERE album_id = a.id)

--8. Get the number of Songs for each Band
SELECT 
		b.name AS [Brand Name],
		COUNT(s.id) AS [Number of Songs]
FROM bands b
LEFT JOIN albums a
ON b.id = a.band_id
LEFT JOIN songs s 
ON a.id = s.album_id
GROUP BY b.id, b.name

