-- Pair programming subconsultas: 

USE northwind; 

-- 1 Extraed los pedidos con el máximo "order_date" para cada empleado: 

-- mini query 
SELECT MAX(order_date) AS max_order_date, employee_id
	FROM orders
    WHERE employee_id = 5; 

-- query final: 
SELECT order_id, customer_id, employee_id, order_date, required_date
	FROM orders AS q1
    WHERE order_date = (SELECT MAX(order_date)
	FROM orders AS q2
    WHERE q1.employee_id = q2.employee_id); 


-- 3 Extraed información de los productos "Beverages"

-- si sabemos el numero: 
SELECT product_id, product_name, category_id
	FROM products 
    WHERE category_id = 1; 

-- buscando en la otra tabla con IN:

SELECT product_id, product_name, category_id
	FROM products 
    WHERE category_id IN (
							SELECT category_id
                            FROM categories
                            WHERE category_id = 1); 
                            
-- si tuvieramos que juntar tablas: 

SELECT product_id, product_name, categories.category_id, categories.category_name
FROM products
INNER JOIN categories
ON products.category_id = categories.category_id
WHERE category_name = 'Beverages'; 