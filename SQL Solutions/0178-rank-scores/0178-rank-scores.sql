SELECT score, r rank FROM 
    (SELECT id, score, DENSE_RANK() OVER(ORDER BY score DESC) r FROM Scores) rank
