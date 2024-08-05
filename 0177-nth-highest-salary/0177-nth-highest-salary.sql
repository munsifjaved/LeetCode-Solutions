CREATE FUNCTION getNthHighestSalary(@N INT) RETURNS INT AS
BEGIN
    RETURN (
        SELECT TOP 1 salary FROM 
            (SELECT salary, DENSE_RANK() OVER(ORDER BY salary DESC) r FROM Employee) AS Row_query
        WHERE r=@N
        

    );
END