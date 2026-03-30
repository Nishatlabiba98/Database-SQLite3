-- Capstone Answers
-- Fill in each query below.

-- Q1: List every artist name and country, sorted alphabetically by name.
Select name, country
FROM artists
ORDER BY name ASC;

-- Q2: How many albums are in the catalog?
SELECT COUNT(*) AS total_albums
FROM albums;

-- Q3: Which genre has the most albums? (genre name and count)
SELECT genre, name COUNT(*) AS album_count
FROM albums
GROUP BY genre.id
JOIN genres ON albums.genre_id = genres.id
ORDER BY album_count DESC
LIMIT 1;

-- Q4: Album titles released before 1970, with artist name.
SELECT albums.title, artists.name
FROM albums
JOIN artists ON albums.artist_id = artists.id
WHERE albums.release_year < 1970;

-- Q5: Longest track — title, album title, duration as MM:SS.

SELECT 
    tracks.title,
    albums.title AS album_title,
    (tracks.duration / 60) || ':' || printf('%02d', tracks.duration % 60) AS duration_mmss
FROM tracks
JOIN albums ON tracks.album_id = albums.id
ORDER BY tracks.duration DESC
LIMIT 1;
    
-- Q6: Track count per album, sorted by count descending.
SELECT albums.title, COUNT(tracks.id) AS track_count
FROM albums
JOIN tracks ON albums.id = tracks.album_id
GROUP BY albums.id
ORDER BY track_count DESC;

-- Q7: Artists with more than one album.


-- Q8: Tracks longer than 5 minutes — track title, album title, artist name.


-- Q9: Average track duration per genre (in seconds, rounded to 1 decimal).


-- Q10: Artist with the most total tracks — artist name and total count.


-- BONUS: Per-album summary (title, artist, genre, track count, total minutes).
