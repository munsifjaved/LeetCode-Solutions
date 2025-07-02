SELECT * 
FROM products
WHERE description ~ '(^|[^a-zA-Z0-9])SN[0-9]{4}-[0-9]{4}([^a-zA-Z0-9]|$)';