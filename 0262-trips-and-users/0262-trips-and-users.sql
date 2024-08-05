WITH Cancelled_Request AS (  
    SELECT t.request_at, COUNT(t.id) AS cancelled
    FROM Trips t
    JOIN Users u ON t.client_id = u.users_id 
    JOIN users u2 ON t.driver_id = u2.users_id
    WHERE u.banned = 'No' AND u2.banned='No'
    AND t.status IN ('cancelled_by_client', 'cancelled_by_driver')
    GROUP BY t.request_at
),     
Total_request AS (   
    SELECT t.request_at, COUNT(t.id) AS requests
    FROM Trips t
    JOIN Users u ON t.client_id = u.users_id 
    JOIN users u2 ON t.driver_id = u2.users_id
    WHERE u.banned = 'No' AND u2.banned='No'
    GROUP BY t.request_at
)
SELECT tr.request_at AS Day, 
       ROUND(CAST(ISNULL(cr.cancelled,0) AS FLOAT) / tr.requests, 2) AS [Cancellation Rate]
FROM Total_request tr
LEFT JOIN Cancelled_Request cr ON tr.request_at = cr.request_at
WHERE tr.request_at BETWEEN '2013-10-01' AND '2013-10-03';