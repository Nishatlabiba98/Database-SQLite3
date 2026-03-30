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
SELECT artists.name, COUNT(albums.id) AS album_count
FROM artists
JOIN albums ON artists.id = albums.artist_id
GROUP BY artists.id
HAVING album_count > 1;

-- Q8: Tracks longer than 5 minutes — track title, album title, artist name.
SELECT tracks.title, albums.title AS album_title, artists.name AS artist_name
FROM tracks
JOIN albums ON tracks.album_id = albums.id
JOIN artists ON albums.artist_id = artists.id
WHERE tracks.duration > 300;

-- Q9: Average track duration per genre (in seconds, rounded to 1 decimal).
SELECT genres.name AS genre_name, ROUND(AVG(tracks.duration), 1) AS avg_duration
FROM genres
JOIN albums ON genres.id = albums.genre_id
JOIN tracks ON albums.id = tracks.album_id
GROUP BY genres.id;

-- Q10: Artist with the most total tracks — artist name and total count.

SELECT artists.name, COUNT(tracks.id) AS total_tracks
FROM artists
JOIN albums ON artists.id = albums.artist_id
JOIN tracks ON albums.id = tracks.album_id
GROUP BY artists.id
ORDER BY total_tracks DESC
LIMIT 1;
-- BONUS: Per-album summary (title, artist, genre, track count, total minutes).
SELECT 
    albums.title AS album_title,
    artists.name AS artist_name,
    genres.name AS genre_name,
    COUNT(tracks.id) AS track_count,
    ROUND(SUM(tracks.duration) / 60.0, 2) AS total_minutes
FROM albums
JOIN artists ON albums.artist_id = artists.id
JOIN genres ON albums.genre_id = genres.id
JOIN tracks ON albums.id = tracks.album_id
GROUP BY albums.id
ORDER BY total_minutes DESC; // didnt do this myself.