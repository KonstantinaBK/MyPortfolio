-- Crear una base de datos llamada desafio3-tuNombre-tuApellido-3digitos donde los 3 dígitos son escogidos por ti al azar.

CREATE DATABASE desafio3_konstantina_barra_514;

-- Creo tabla Usuarios

CREATE TABLE Usuarios (
id SERIAL,
email VARCHAR,
nombre VARCHAR,
apellido VARCHAR,
rol VARCHAR
);

-- Añado los datos

INSERT INTO Usuarios (email, nombre, apellido, rol) VALUES 
('juan@gmail.com', 'Juan', 'Pérez', 'administrador'),
 ('ana@outlook.com', 'Ana', 'López', 'usuario'),
 ('pedro@yahoo.com', 'Pedro', 'García', 'usuario'),
 ('laura@hotmail.com', 'Laura', 'Sánchez', 'usuario'),
 ('carlos@desafiolatam.com', 'Carlos', 'Rodríguez', 'usuario');
 
 -- Compruebo
 
 SELECT * FROM Usuarios;
 
 -- Creo tabla Posts
 
 CREATE TABLE Posts 
( id SERIAL, titulo VARCHAR, contenido TEXT,
fecha_creacion TIMESTAMP, 
fecha_actualizacion TIMESTAMP, 
destacado BOOLEAN, usuario_id BIGINT );

-- Añado los datos

INSERT INTO Posts (titulo, contenido, fecha_creacion, fecha_actualizacion, destacado, usuario_id) 
VALUES ('Post 1', 'Este es el primer post', '2023-05-18 18:00:00', '2023-05-18 18:00:00', TRUE, 1),
 ('Post 2', 'Este es el segundo post', '2023-05-18 18:10:00', '2023-05-18 18:10:00', FALSE, 1),
 ('Post 3', 'Este es el tercer post', '2023-05-18 18:20:00', '2023-05-18 18:20:00', TRUE, 2),
 ('Post 4', 'Este es el cuarto post', '2023-05-18 18:30:00', '2023-05-18 18:30:00', FALSE, 2),
 ('Post 5', 'Este es el quinto post', '2023-05-18 18:40:00', '2023-05-18 18:40:00', TRUE, NULL);
 
  -- Compruebo
 
 SELECT * FROM Posts;
 
 -- Creo la tabla Comentarios

CREATE TABLE Comentarios 
( id SERIAL, contenido TEXT, 
fecha_creacion TIMESTAMP, 
usuario_id BIGINT, 
post_id BIGINT );

-- Añado datos

INSERT INTO Comentarios (contenido, fecha_creacion, usuario_id, post_id) VALUES 
('Me gustó el primer post', '2023-05-18 18:05:00', 1, 1), 
('Muy interesante el primer post', '2023-05-18 18:15:00', 2, 1), 
('Buen trabajo en el primer post', '2023-05-18 18:25:00', 3, 1), 
('El segundo post me pareció aburrido', '2023-05-18 18:35:00', 1, 2), 
('El segundo post tiene algunos errores', '2023-05-18 18:45:00', 2, 2);

 -- Compruebo
 
 SELECT * FROM Comentarios;
 
 -- 2.- Cruza los datos de la tabla usuarios y posts mostrando las siguientes columnas: nombre e email del usuario junto al título y contenido del post. 

SELECT nombre, email, titulo, contenido 
FROM Usuarios 
INNER JOIN Posts 
ON Usuarios.id = Posts.usuario_id;

-- 3.- Muestra el id, título y contenido de los posts de los administradores. El administrador puede ser cualquier id.

SELECT Posts.id, Posts.titulo, Posts.contenido 
FROM Posts 
INNER JOIN Usuarios 
ON Posts.usuario_id = Usuarios.id 
WHERE Usuarios.rol = 'administrador';

-- 4.- Cuenta la cantidad de posts de cada usuario. La tabla resultante debe mostrar el id e email del usuario junto con la cantidad de posts de cada usuario.

SELECT usuario.id, usuario.email, COUNT(post.id) AS cantidad_posts
FROM Usuarios usuario
LEFT JOIN Posts post
ON usuario.id = post.usuario_id
GROUP BY usuario.id, usuario.email;

-- 5.- Muestra el email del usuario que ha creado más posts. Aquí la tabla resultante tiene un único registro y muestra solo el email. 

SELECT Usuarios.email
FROM Usuarios
INNER JOIN Posts
ON Usuarios.id = Posts.usuario_id
GROUP BY Usuarios.id, Usuarios.email
ORDER BY COUNT(Posts.id) DESC
LIMIT 1;

-- 6.- Muestra la fecha del último post de cada usuario

SELECT Usuarios.email, MAX(Posts.fecha_creacion) AS fecha_ultimo_post
FROM Usuarios
INNER JOIN Posts
ON Usuarios.id = Posts.usuario_id
GROUP BY Usuarios.id, Usuarios.email;

-- 7.- Muestra el título y contenido del post con más comentarios

SELECT Posts.titulo, Posts.contenido
FROM Posts
INNER JOIN Comentarios
ON Posts.id = Comentarios.post_id
GROUP BY Posts.id, Posts.titulo, Posts.contenido
ORDER BY COUNT(Comentarios.id) DESC
LIMIT 1;

-- 8.- Muestra en una tabla el título de cada post, el contenido de cada post y el contenido de cada comentario asociado a los posts mostrados, junto con el email del usuario que lo escribió.

SELECT Posts.titulo, Posts.contenido, Comentarios.contenido AS comentario, Usuarios.email
FROM Posts
INNER JOIN Comentarios
ON Posts.id = Comentarios.post_id
INNER JOIN Usuarios
ON Comentarios.usuario_id = Usuarios.id;

-- 9.- Muestra el contenido del último comentario de cada usuario.

SELECT Usuarios.email, Comentarios.contenido
FROM Usuarios
INNER JOIN Comentarios
ON Usuarios.id = Comentarios.usuario_id
WHERE Comentarios.fecha_creacion = (
  SELECT MAX(fecha_creacion)
  FROM Comentarios
  WHERE usuario_id = Usuarios.id
);

-- 10.- Muestra los emails de los usuarios que no han escrito ningún comentario

SELECT Usuarios.email 
FROM Usuarios 
LEFT JOIN Comentarios 
ON Usuarios.id = Comentarios.usuario_id 
GROUP BY Usuarios.email 
HAVING COUNT(Comentarios.id) = 0;


