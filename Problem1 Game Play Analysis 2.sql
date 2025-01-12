# Write your MySQL query statement below
WITH CTE AS(
    SELECT player_id, device_id, event_date, rank() OVER (PARTITION BY player_id ORDER BY event_date) AS 'rnk' FROM Activity)
    
    SELECT player_id, device_id FROM CTE
    WHERE rnk = 1