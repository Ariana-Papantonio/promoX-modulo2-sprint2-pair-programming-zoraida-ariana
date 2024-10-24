SELECT  'Hola!'  AS tipo_nombre
FROM customers;

-- 1) Ciudades que empiezan con "A" o "B".

SELECT 
	city AS City,
    company_name AS CompanyName,
    contact_name AS ContactName
FROM 
	customers
WHERE 
	City LIKE 'A%' OR City LIKE 'B%';

-- 2) Número de pedidos que han hecho en las ciudades que empiezan con L.

SELECT 
	customers.city AS ciudad,
    customers.company_name AS empresa,
    customers.contact_name AS persona_contacto, 
    COUNT(orders.order_id) AS numero_pedidos
FROM 
	customers
INNER JOIN 
	orders
ON 
	customers.customer_id = orders.customer_id
GROUP BY 
	ciudad, empresa, persona_contacto
HAVING 
	ciudad LIKE 'L%'; 
    
-- 3) Todos los clientes cuyo "country" no incluya "USA".

SELECT
	company_name AS nombre_empresa,
    country AS pais
FROM 
	customers
WHERE country NOT IN ('USA');


-- 4) Todos los clientes que no tengan una "A" en segunda posición en su nombre.

SELECT 
	contact_name AS nombre_cliente
FROM 
	customers
WHERE 
	contact_name NOT LIKE '_A%';
	
SELECT 
	contact_name AS nombre_cliente
FROM 
	customers
WHERE 
	contact_name LIKE '_A%';
	

-------------------