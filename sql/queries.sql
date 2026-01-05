-- oportunidades por cada estado del pipeline del CRM
SELECT estado, COUNT(*) AS total
FROM oportunidades
GROUP BY estado;

-- facturación total por cada cliente
SELECT c.nombre, SUM(f.importe) AS total_facturado
FROM clientes c
JOIN oportunidades o ON c.id_cliente = o.id_cliente
JOIN servicios s ON o.id_oportunidad = s.id_oportunidad
JOIN facturas f ON s.id_servicio = f.id_servicio
GROUP BY c.nombre;

-- pipeline comercial completo: cliente, oportunidad, estado e importe estimado
SELECT c.nombre AS cliente, o.nombre AS oportunidad, o.estado, o.importe_estimado
FROM oportunidades o
JOIN clientes c ON o.id_cliente = c.id_cliente;





