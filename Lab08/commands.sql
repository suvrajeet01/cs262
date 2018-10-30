/* -- Exercise 8.1

-- Retrieve a list of all the games, ordered by date with the most recent game coming first.
SELECT * FROM Game ORDER BY TIME DESC;
-- Retrieve all the games that occurred in the past week.
SELECT * FROM Game 
    WHERE time > NOW() - INTERVAL '7' DAY;
-- Retrieve a list of players who have (non-NULL) names.
SELECT * FROM Player
    WHERE name IS NOT NULL;
-- Retrieve a list of IDs for players who have some game score larger than 2000.
SELECT Player.ID from Player, PlayerGame
    WHERE Player.ID = PlayerGame.playerID
    AND PlayerGame.score > 2000;
-- Retrieve a list of players who have GMail accounts.
SELECT * FROM Player
    WHERE emailAddress LIKE '%gmail.edu' */

-- Exercise 8.2

-- Retrieve all “The King”’s game scores in decreasing order.
-- Retrieve the name of the winner of the game played on 2006-06-28 13:20:00.
-- So what does that P1.ID < P2.ID clause do in the last example query?
-- The query that joined the Player table to itself seems rather contrived. Can you think of a realistic situation in which you’d want to join a table to itself?
