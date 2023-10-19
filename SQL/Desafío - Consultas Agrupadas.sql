--  Al principio del script debe crear una base de datos llamada desafio2-tuNombre-tuApellido-3digitos donde los 3 dígitos son escogidos por ti al azar. 

CREATE DATABASE desafio2_Konstantina_Barra_514;

-- Utilizando el siguiente set de datos:

CREATE TABLE IF NOT EXISTS INSCRITOS(cantidad INT, fecha DATE, fuente
VARCHAR);
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 44, '01/01/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 56, '01/01/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 39, '01/02/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 81, '01/02/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 12, '01/03/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 91, '01/03/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 48, '01/04/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 45, '01/04/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 55, '01/05/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 33, '01/05/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 18, '01/06/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 12, '01/06/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 34, '01/07/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 24, '01/07/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 83, '01/08/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 99, '01/08/2021', 'Página' );

-- REVISO LA TABLA INSCRITOS

SELECT * FROM INSCRITOS;

-- ¿Cuántos registros hay? 

SELECT COUNT (*) FROM INSCRITOS;

-- ¿Cuántos inscritos hay en total?  

SELECT SUM(cantidad) AS Total_Inscritos FROM INSCRITOS;

-- ¿Cuál o cuáles son los registros de mayor antigüedad? 

SELECT * FROM INSCRITOS
WHERE fecha = (SELECT MIN(fecha) FROM INSCRITOS);

-- ¿Cuántos inscritos hay por día? (entendiendo un día como una fecha distinta de ahora en adelante)

SELECT fecha, SUM(cantidad) AS Inscritos_por_dia FROM INSCRITOS GROUP BY fecha ORDER BY fecha ASC;

-- ¿Cuántos inscritos hay por fuente?  

SELECT fuente, SUM(cantidad) AS Inscritos_por_fuente FROM INSCRITOS GROUP by fuente ORDER BY fuente ASC;

-- ¿Qué día se inscribió la mayor cantidad de personas? ¿Cuántas personas se inscribieron en ese día?

SELECT fecha, SUM(cantidad) AS Inscritos_por_dia FROM INSCRITOS GROUP by fecha ORDER BY Inscritos_por_dia DESC LIMIT 1;

-- ¿Qué días se inscribieron la mayor cantidad de personas utilizando el blog? ¿Cuántas personas fueron?

SELECT * from INSCRITOS where cantidad = (SELECT MAX(cantidad) AS Inscritos_por_blog FROM INSCRITOS
WHERE fuente = 'Blog');

-- ¿Cuál es el promedio de personas inscritas por día? 

SELECT fecha, AVG(cantidad) AS promedio_inscritos_por_dia FROM INSCRITOS GROUP BY fecha ORDER BY promedio_inscritos_por_dia ASC;

-- ¿Qué días se inscribieron más de 50 personas?

SELECT fecha, SUM(cantidad) AS Inscritos_por_dia FROM INSCRITOS GROUP BY fecha HAVING
SUM(cantidad) > 50;

-- ¿Cuál es el promedio de personas inscritas a partir del tercer día?

SELECT fecha, AVG(cantidad) AS promedio_inscritos_por_dia FROM INSCRITOS WHERE fecha >= '2021-03-01' GROUP BY fecha ORDER BY promedio_inscritos_por_dia ASC;

