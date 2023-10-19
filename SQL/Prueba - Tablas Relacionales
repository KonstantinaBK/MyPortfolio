-- 1. Revisa el tipo de relación y crea el modelo correspondiente. Respeta las claves primarias, foráneas y tipos de datos.

CREATE TABLE peliculas (
  id integer PRIMARY KEY,
  nombre varchar(255),
  anno integer
);

CREATE TABLE tags (
  id integer PRIMARY KEY,
  tag varchar(32)
);

-- 2. Inserta 5 películas y 5 tags; la primera película debe tener 3 tags asociados, la segunda película debe tener 2 tags asociados.

INSERT INTO peliculas (id, nombre, anno) VALUES
(1, 'El Padrino', 1972),
(2, 'El Señor de los Anillos: La Comunidad del Anillo', 2001),
(3, 'Matrix', 1999),
(4, 'Toy Story', 1995),
(5, 'Parasite', 2019);

INSERT INTO tags (id, tag) VALUES
(1, 'Drama'),
(2, 'Crimen'),
(3, 'Fantasía'),
(4, 'Aventura'),
(5, 'Ciencia ficcion');

SELECT * FROM peliculas;

SELECT * FROM tags;

-- Para asociar los tags a las películas, se necesita crear una tabla intermedia que tenga las claves foráneas de ambas tablas.

CREATE TABLE peliculas_tags (
  pelicula_id integer REFERENCES peliculas(id),
  tag_id integer REFERENCES tags(id),
  PRIMARY KEY (pelicula_id, tag_id)
);

INSERT INTO peliculas_tags (pelicula_id, tag_id) VALUES
(1, 1), 
(1, 2),
(1, 4), 
(2, 3), 
(2, 4), 
(3, 5), 
(4, 4), 
(5, 1); 

-- El Padrino tiene el tag Drama
-- El Padrino tiene el tag Crimen
-- El Padrino tiene el tag Aventura
-- El Señor de los Anillos tiene el tag Fantasía
-- El Señor de los Anillos tiene el tag Aventura
-- Matrix tiene el tag Ciencia ficción
-- Toy Story tiene el tag Aventura
-- Parasite tiene el tag Drama

-- De esta forma, la primera película tiene 3 tags asociados y la segunda película tiene 2 tags asociados.

-- ¿Por qué la tabla intermedia tiene clave primaria y no sólo clave foránea?

-- La tabla intermedia tiene clave primaria compuesta por las dos claves foráneas para evitar que haya registros duplicados. 
-- Es decir, para evitar que una misma película tenga el mismo tag más de una vez. 
-- La clave primaria compuesta garantiza que cada combinación de película y tag sea única en la tabla.

SELECT * FROM peliculas_tags;

-- 3. Cuenta la cantidad de tags que tiene cada película. Si una película no tiene tags debe mostrar 0

SELECT peliculas.nombre, COUNT(peliculas_tags.tag_id) AS tags_por_pelicula
FROM peliculas
LEFT JOIN peliculas_tags ON peliculas.id = peliculas_tags.pelicula_id
GROUP BY peliculas.nombre;

-- 4. Crea las tablas correspondientes respetando los nombres, tipos, claves primarias y foráneas y tipos de datos

CREATE TABLE usuarios (
  id integer PRIMARY KEY,
  nombre varchar(255),
  edad integer
);

CREATE TABLE preguntas (
  id integer PRIMARY KEY,
  pregunta varchar(255),
  respuesta_correcta varchar
);

CREATE TABLE respuestas (
  id integer PRIMARY KEY,
  respuesta varchar(255),
  usuario_id integer REFERENCES usuarios(id),
  pregunta_id integer REFERENCES preguntas(id)
);

-- 5. Agrega 5 usuarios y 5 preguntas.
-- a. La primera pregunta debe estar respondida correctamente dos veces, por dos usuarios diferentes.
-- b. La segunda pregunta debe estar contestada correctamente solo por un usuario.
-- c. Las otras dos preguntas deben tener respuestas incorrectas
-- Contestada correctamente significa que la respuesta indicada en la tabla respuestas es exactamente igual al texto indicado en la tabla de preguntas.

INSERT INTO usuarios (id, nombre, edad) VALUES
(1, 'Ana', 25),
(2, 'Beto', 30),
(3, 'Carlos', 28),
(4, 'Diana', 32),
(5, 'Elena', 27);

INSERT INTO preguntas (id, pregunta, respuesta_correcta) VALUES
(1, '¿Cuál es la capital de Chile?', 'Santiago'),
(2, '¿Qué animal tiene trompa?', 'Elefante'),
(3, '¿Qué planeta es el más grande del sistema solar?', 'Júpiter'),
(4, '¿Qué instrumento tiene 88 teclas?', 'Piano'),
(5, '¿Qué deporte se juega con un balón ovalado?', 'Rugby');

INSERT INTO respuestas (id, respuesta, usuario_id, pregunta_id) VALUES
(1, 'Santiago', 1, 1), -- Ana responde correctamente la primera pregunta
(2, 'Santiago', 2, 1), -- Beto responde correctamente la primera pregunta
(3, 'Elefante', 3, 2), -- Carlos responde correctamente la segunda pregunta
(4, 'Ballena', 4, 2), -- Diana responde incorrectamente la segunda pregunta
(5, 'Saturno', 5, 3), -- Elena responde incorrectamente la tercera pregunta
(6, 'Marte', 1, 3), -- Ana responde incorrectamente la tercera pregunta
(7, 'Piano', 2, 4), -- Beto responde incorrectamente la cuarta pregunta
(8, 'Guitarra', 3, 4), -- Carlos responde incorrectamente la cuarta pregunta
(9, 'Rugby', 4, 5), -- Diana responde incorrectamente la quinta pregunta
(10, 'Fútbol', 5, 5); -- Elena responde incorrectamente la quinta pregunta

SELECT * FROM usuarios;
SELECT * FROM preguntas;
SELECT * FROM respuestas;

-- 6. Cuenta la cantidad de respuestas correctas totales por usuario (independiente de la pregunta),
-- incluyendo los que tienen cero respuestas correctas.

SELECT usuarios.nombre, COUNT(respuestas.id) AS respuestas_correctas
FROM usuarios
INNER JOIN respuestas ON usuarios.id = respuestas.usuario_id
INNER JOIN preguntas ON respuestas.pregunta_id = preguntas.id
WHERE respuestas.respuesta = preguntas.respuesta_correcta
GROUP BY usuarios.nombre;

-- 7. Por cada pregunta, en la tabla preguntas, cuenta cuántos usuarios respondieron correctamente. 

SELECT preguntas.pregunta, COUNT(respuestas.id) AS respuestas_correctas
FROM preguntas
INNER JOIN respuestas ON preguntas.id = respuestas.pregunta_id
WHERE respuestas.respuesta = preguntas.respuesta_correcta
GROUP BY preguntas.pregunta;

-- 8. Implementa un borrado en cascada de las respuestas al borrar un usuario. Prueba la implementación borrando el primer usuario.

ALTER TABLE respuestas 
DROP CONSTRAINT respuestas_usuario_id_fkey, 
ADD FOREIGN KEY (usuario_id) 
REFERENCES usuarios(id) 
ON DELETE CASCADE;

ALTER TABLE respuestas
DROP CONSTRAINT respuestas_usuario_id_fkey;

ALTER TABLE respuestas
ADD CONSTRAINT respuestas_usuario_id_fkey
FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE;

-- 9. Crea una restricción que impida insertar usuarios menores de 18 años en la base de datos. 

ALTER TABLE usuarios
ADD CONSTRAINT edad_minima
CHECK (edad >= 18);

-- 10. Altera la tabla existente de usuarios agregando el campo email. Debe tener la restricción de ser único.

ALTER TABLE usuarios
ADD COLUMN email varchar(255) 
UNIQUE;
