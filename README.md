# Способы хранения деревьев в БД

Примеры запросов:

-- NESTED SET

WITH root AS (SELECT left_key, right_key FROM structure WHERE id = 10)
SELECT s.title, e.name, p.name FROM structure s 
LEFT JOIN structure_employee se ON s.id = se.structure_id 
    JOIN employee e ON se.employee_id = e.id 
        JOIN position p ON p.id = e.position_id
            WHERE left_key >= (SELECT left_key FROM root) 
                AND right_key <= (SELECT right_key FROM root);

-- MATERIALIZED PATHS

SELECT s.title, e.name, p.position FROM structure s 
LEFT JOIN structure_employee se ON s.id = se.structure_id 
    JOIN employee e ON se.employee_id = e.id 
        JOIN position p ON p.id = e.position_id
            WHERE path LIKE '1.2%' ORDER BY path;

-- ADJACENCY LIST

WITH RECURSIVE sub_category(id, title, parent_id, level) AS (
    SELECT id, title, parent_id, 1 FROM structure WHERE id = 3
    UNION ALL 
    SELECT s.id, s.title, s.parent_id, level + 1
    FROM structure s, sub_category sc
    WHERE s.parent_id = sc.id  
)
SELECT sc.id, sc.title, sc.parent_id, sc.level, e.name, p.position FROM sub_category sc 
    LEFT JOIN structure_employee se ON sc.id = se.structure_id 
        JOIN employee e ON se.employee_id = e.id 
            JOIN position p ON p.id = e.position_id;

-- CLOSURE TABLE

SELECT s.title, c.parent_id, c.child_id, level, e.name, p.position FROM closure c
    LEFT JOIN structure s ON s.id = c.parent_id
        LEFT JOIN structure_employee se ON s.id = se.structure_id 
            JOIN employee e ON se.employee_id = e.id 
                JOIN position p ON p.id = e.position_id
WHERE child_id = 4
ORDER BY level;
