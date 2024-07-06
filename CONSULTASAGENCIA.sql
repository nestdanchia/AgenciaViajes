use agencia_viajes;

SELECT nombre ,now()
from turista,reservas
where id_hotel=1 and turista.id =reservas.id_turista;

SELECT nombre,direccion 
from turista,reservas
where id_hotel=1 and turista.id =reservas.id_turista;
SELECT *  FROM reservas NATURAL JOIN turista;

 SELECT nombre, fecha_entrada,fecha_salida FROM reservas NATURAL JOIN turista WHERE id=id_turista AND  id=1;

SELECT count(*) from turista;
select avg(precio_noche) from habitacion;

SELECT count(*) AS  "Cantidad Reservas ",id_habitacion,precio_noche
from reservas GROUP BY id_habitacion Having id_habitacion=24;

SELECT COUNT(id_hotel) AS "TOTAL HOTEL", id_hotel ,SUM(precio_noche ) AS "total" FROM
 reservas GROUP BY id_hotel
 HAVING SUM(precio_noche) >50000;
 
 
 SELECT 
 id_turista ,SUM(precio_noche) AS "PAGO",
 SUM(cantidad_personas) AS "Personas" turista
 FROM reservas GROUP BY id_turista 
 HAVING SUM(cantidad_personas) > 2;
 
 
 
 
 SELECT reservas.fecha_entrada,reservas.id_turista,nombre_hotel,turista.nombre,pago_confirmado   FROM reservas
 JOIN hoteles
 ON reservas.id_hotel = hoteles.id
 JOIN turista
 ON reservas.id_turista = turista.id
 JOIN pago
 ON  reservas.id_reserva = pago.id_reserva;
 

SELECT id_turista,id_habitacion ,pago_confirmado,fecha_entrada FROM reservas R ,pago P 
WHERE R.id_reserva = P.id_reserva 
ORDER BY id_turista;
SELECT id_turista ,MAX(precio_noche),SUM(precio_noche)
FROM reservas
GROUP BY id_turista;

SELECT id_turista From reservas GROUP BY id_turista;


/*   https://learnsql.es/blog/explicacion-de-la-funcion-de-recuento-de-sql-con-7-ejemplos/ */
 
