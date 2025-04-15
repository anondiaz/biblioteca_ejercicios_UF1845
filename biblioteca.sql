-- ----- Creación de la BBDD -----
# Hay que crear una BD llamada 'biblioteca'

CREATE DATABASE IF NOT EXISTS biblioteca;
-- ----- Declaramos el uso de la BBDD -----
USE biblioteca;

-- ----- Borramos toda la BBDD -----
-- DROP DATABASE biblioteca;

-- ----- Creación de una tabla en la BBDD -----
# Hay que crear una tabla llamada 'libros'
# Debe contener :
# 	-- id int NOT NULL AUTO_INCREMENT PRIMARY KEY
# 	-- titulo varchar(100) NOT NULL 
# 	-- autor_nombre varchar(50) NOT NULL
# 	-- autor_apellido varchar(100) NULL 
# 	-- year_edition YEAR
#	-- editorial varchar(50) NOT NULL
# 	-- ejemplares smallint UNSIGNED
# 	-- fecha_incorporacion DEFAULT CURRENT_TIMESTAMP

CREATE TABLE libros (
id int NOT NULL auto_increment PRIMARY KEY,
titulo varchar(100) NOT NULL,
autor_nombre varchar(50) NOT NULL,
autor_apellido varchar(100) NULL,
editorial varchar(50) NOT NULL,
year_edition YEAR,
ejemplares smallint UNSIGNED,
fecha_incorporacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ----- Describimos la tabla para ver como es -----
DESCRIBE libros;

-- ----- Borramos la tabla -----
-- DROP TABLE libros;

-- --- Vamos a insertar unos libros -----
# Inserta este libro:
# Cien años de soledad
# Gabriel
# García Marquez
# 1990
# Tusquets
# 3
-- Definimos todos los campos e insertamos todos los campos, menos el ID que se pondrá automático
INSERT INTO libros(titulo, autor_nombre, autor_apellido, editorial, year_edition, ejemplares) 
VALUES ("Cien años de soledad", "Gabriel", "García Marquez", "Tusquets", 1990, 3);

INSERT INTO libros(titulo, autor_nombre, autor_apellido, editorial, year_edition, ejemplares) 
VALUES ("El coronel no tiene quien le escriba", "Gabriel", "García Marquez", "Tusquets", 1995, 2);

INSERT INTO libros(titulo, autor_nombre, autor_apellido, editorial, year_edition, ejemplares) 
VALUES ("Python", "Guido", "Van Rossum", "Anaya  Multimedia", 2024, 4);

-- Definimos todos los campos menos el apellido e insertamos todos los campos, menos el apellido, que quedará como NULL y el ID que se pondrá automático
INSERT INTO libros(titulo, autor_nombre, editorial, year_edition, ejemplares) 
VALUES ("La Odisea", "Homero", "Catedra", 2024, 2);

SELECT * FROM libros;

# Seleccionar los libros cuyo nombre de autor empieza por "G"
SELECT titulo
FROM libros
WHERE autor_nombre like "G%";

-- ----- SELECT's -----

# Cuántos libros diferentes tenemos en la biblioteca
SELECT COUNT(id) as "número de libros"
FROM libros;

# Cuántos ejemplares tenemos ahora en la biblioteca
SELECT SUM(ejemplares) as "número de ejemplares"
FROM libros;

# Obtener los autores de la biblioteca con repeticiones
SELECT autor_nombre, autor_apellido
FROM libros;

# Obtener los autores de la biblioteca sin repeticiones
SELECT distinct autor_apellido, autor_nombre
FROM libros;

# Obtener los autores de la biblioteca sin repeticiones
SELECT concat(autor_nombre, " ", autor_apellido) as autores
FROM libros;

SELECT concat_ws(" ", autor_nombre, autor_apellido) as autores
FROM libros;

# Promedio de ejemplares que tenemos ahora en la biblioteca
SELECT AVG(ejemplares) as "promedio de ejemplares"
FROM libros;

# ¿De qué título tenemos más ejemplares? <-- Solución mala
SELECT titulo, ejemplares
FROM libros
order by ejemplares DESC
limit 1;

# ¿De qué título tenemos menos ejemplares? <-- Solución mala
SELECT titulo, ejemplares
FROM libros
order by ejemplares ASC
limit 1;

SELECT MIN(ejemplares)
FROM libros;

SELECT max(ejemplares)
FROM libros;

-- Anidación de selects simple
SELECT titulo, ejemplares
FROM libros
WHERE ejemplares = (SELECT MIN(ejemplares)
FROM libros);

SELECT titulo, ejemplares
FROM libros
WHERE ejemplares = 2;

-- ----- Modificar una tabla -----
ALTER TABLE libros ADD COLUMN genero varchar(30) NOT NULL;

-- ----- Eliminar una columna/campo -----
-- ALTER TABLE libros DROP genero;

-- ----- Modificar una columna, en lugar de andar borrando y creando, si hubiera datos imagina -----
ALTER TABLE libros MODIFY COLUMN genero varchar(20) NOT NULL;

DESCRIBE libros;

-- ----- Actualizaciones de la tabla -----
-- Todos los libros son del genero ficción, menos pyhthon que es programación
SELECT * FROM libros;
USE biblioteca;

-- En modo seguro (Safe UPDATES) no nos va a dejar ni UPDATES ni DELETES, con esa configuarción solo deja si se utiliza el ID
-- Lo desactivamos de momento

-- Actualizar campos con UPDATE
UPDATE libros SET genero = 'ficción';
UPDATE libros SET genero = 'programación' where titulo = 'Python';

-- Lo mismo, peor no tengo id 6
UPDATE libros SET autor_nombre = 'Paco' where id =6 ;
UPDATE libros SET autor_apellido = 'Martinez Diaz' where id =6 ;
UPDATE libros SET editorial = 'Amazon' where id =6 ;
UPDATE libros SET year_edition = 2018 where id =6 ;
UPDATE libros SET ejemplares = 6 where id =6 ;

-- Añadir 10 titulos más :
-- 2 de programación 
-- 2 de poesia
-- 3 de historia
-- 3 de arte

-- Programación
INSERT INTO libros(titulo, autor_nombre, autor_apellido, editorial, year_edition, ejemplares, genero) 
VALUES ("Aprende C", "Pepe", "García Lopez", "Anaya", 2004, 2, "programación"),
("Aprende HTML", "Paco", "García Perez", "Anaya", 2010, 3, "programación")
;

-- Poesia
INSERT INTO libros(titulo, autor_nombre, autor_apellido, editorial, year_edition, ejemplares, genero) 
VALUES ("Veinte poemas de amor y una canción desesperada", "Pablo", "Neruda", "Editorial Planeta", 1994, 6, "poesía"),
("El árbol rojo", "María", "Baranda", "Fondo de Cultura Económica", 2002, 4, "poesía"),
("Poeta en Nueva York", "Federico", "García Lorca", "Editorial Cátedra", 2005, 8, "poesía")
;

-- Historia
INSERT INTO biblioteca.libros(titulo, autor_nombre, autor_apellido, editorial, year_edition, ejemplares, genero) 
VALUES 
("Grandes Liadas de la Historia: Desastres históricos, narrados con fidelidad y algo de mala leche", "Jesús", "Barranco Reyes", "SINGULARIDAD", 2024, 5, "historia"),
("Locos por la historia: 125 curiosidades de la historia que nunca antes te habían contado", "Bonalletra", "Alcompàs", "Shackleton Kids", 2021, 2, "historia"),
("Una historia de España (Best Seller)", "Arturo", "Pérez-Reverte", "DeBolsillo", 2022, 2, "historia"),
("Historia del mundo mapa a mapa (Enciclopedia visual)", "DK", " ", "DK", 2019, 1, "historia")
;

-- Arte
INSERT INTO biblioteca.libros(titulo, autor_nombre, autor_apellido, editorial, year_edition, ejemplares, genero) 
VALUES 
("Monet", " Christoph", "Heinrich", "Taschen", 2023, 2, "arte"),
("London. Portrait of a City", "Reuel", "Golden", "Taschen", 2023, 1, "arte"),
("Van Gogh. La Obra Completa. Pintura", " Rainer", "Metzger", "Taschen", 2015, 3, "arte")
;

-- ----- Vamos a filtrar los SELECT -----
SELECT titulo, genero FROM biblioteca.libros WHERE genero = 'arte' OR genero = 'historia' OR genero = 'programacion';
SELECT titulo, genero FROM biblioteca.libros WHERE genero NOT IN ('arte' , 'historia', 'programacion');

-- Libros cuya cantidad de ejemplares está entre 2 y 4
SELECT titulo, ejemplares
FROM biblioteca.libros
WHERE ejemplares BETWEEN 2 AND 4 ORDER BY ejemplares ASC
;

-- Necesitamos una tabla nueva para las editoriales
CREATE TABLE editoriales (
id_editorial INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nombre_editorial VARCHAR(100) NOT NULL,
ciudad_editorial VARCHAR(100) NULL
);
USE biblioteca;

-- ----- Borramos la tabla -----
-- DROP TABLE editoriales;

-- ALTER TABLE tbl_editoriales RENAME editoriales;

DESCRIBE editoriales;

SELECT editorial FROM libros;

INSERT INTO editoriales (nombre_editorial)
SELECT DISTINCT editorial FROM libros;

SELECT * FROM editoriales ;

--  Añadir una columna en la tabla libros (id_editorial) con los ids
ALTER TABLE libros ADD id_editorial INT NOT NULL;
-- Eliminar la columna editorial y rellenar la columna id_editorial
SELECT * FROM libros;

SELECT libros.titulo, editoriales.nombre_editorial
FROM libros, editoriales;

SELECT li.titulo, ed.nombre_editorial
FROM libros AS li, editoriales AS ed;

SELECT li.titulo, ed.nombre_editorial
FROM libros li, editoriales ed
WHERE li.editorial = ed.nombre_editorial
;

SELECT li.titulo, ed.nombre_editorial
FROM libros li
JOIN editoriales ed ON li.editorial = ed.nombre_editorial
;

-- Rellenamos la columna id_editorial
UPDATE libros li, editoriales ed
SET li.id_editorial = ed.id_editorial
WHERE li.editorial = ed.nombre_editorial
;

-- Eliminamos la columna editorial
ALTER TABLE libros
DROP editorial;

-- Vamos con los JOIN
SELECT li.titulo, ed.nombre_editorial, ed.ciudad_editorial
FROM libros li
JOIN editoriales ed
ON li.id_editorial = ed.id_editorial
;

-- Necesitamos una tabla para las poblaciones
-- poblacion varchar(50)
-- id_poblacion
-- Que se vinculará a la tabla editoriales

CREATE TABLE poblaciones (
id_poblacion INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nombre_poblacion VARCHAR(100) NOT NULL
);

USE biblioteca;
-- ----- Borramos la tabla -----
-- DROP TABLE poblaciones;

-- ALTER TABLE tbl_poblaciones RENAME poblaciones;

-- Añadimos las poblaciones a las editoriales
UPDATE editoriales SET ciudad_editorial = 'Barcelona' WHERE nombre_editorial = 'Tusquets';
UPDATE editoriales SET ciudad_editorial = 'Madrid' WHERE nombre_editorial = 'Anaya  Multimedia';
UPDATE editoriales SET ciudad_editorial = 'Madrid' WHERE nombre_editorial = 'Catedra';
UPDATE editoriales SET ciudad_editorial = 'Madrid' WHERE nombre_editorial = 'Anaya';
UPDATE editoriales SET ciudad_editorial = 'Barcelona' WHERE nombre_editorial = 'Editorial Planeta';
UPDATE editoriales SET ciudad_editorial = 'Madrid' WHERE nombre_editorial = 'Fondo de Cultura Económica';
UPDATE editoriales SET ciudad_editorial = 'Madrid' WHERE nombre_editorial = 'Editorial Cátedra';
UPDATE editoriales SET ciudad_editorial = 'Valencia' WHERE nombre_editorial = 'SINGULARIDAD';
UPDATE editoriales SET ciudad_editorial = 'Barcelona' WHERE nombre_editorial = 'Shackleton Kids';
UPDATE editoriales SET ciudad_editorial = 'Barcelona' WHERE nombre_editorial = 'DeBolsillo';
UPDATE editoriales SET ciudad_editorial = 'Londres' WHERE nombre_editorial = 'DK';
UPDATE editoriales SET ciudad_editorial = 'Colonia' WHERE nombre_editorial = 'Taschen';

--  Añadir una columna en la tabla editoriales (id_poblaciones) con los id de las poblaciones
ALTER TABLE editoriales ADD id_poblaciones INT NOT NULL;
-- Vamos a ponerlo en singular
ALTER TABLE editoriales RENAME COLUMN id_poblaciones to id_poblacion;

SELECT * FROM libros;
SELECT * FROM editoriales;
SELECT * FROM poblaciones;

INSERT INTO poblaciones (nombre_poblacion)
SELECT DISTINCT ciudad_editorial FROM editoriales;

UPDATE editoriales ed, poblaciones po
SET ed.id_poblacion = po.id_poblacion
WHERE ed.ciudad_editorial = po.nombre_poblacion
;

ALTER TABLE editoriales
DROP ciudad_editorial;

SELECT li.titulo, li.ejemplares, ed.nombre_editorial, po.nombre_poblacion
FROM libros li
JOIN editoriales ed
ON li.id_editorial = ed.id_editorial
JOIN poblaciones po
ON ed.id_poblacion = po.id_poblacion
;

-- Vamos a incorporar los usuarios
-- id_usuario
-- nombre
-- apellido
-- fecha de nacimiento (aaaa-mm-dd)
-- numero de carnet SELECT FLOOR(RAND()*(b-a+1))+a
-- SELECT FLOOR(RAND()*(99999999-10000000+1))+10000000 as carnet;
-- fecha de inscripcion

CREATE TABLE usuarios (
id_usuario INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
numero_carnet INT UNIQUE NOT NULL,
nombre_usuario VARCHAR(20) NOT NULL,
apellido_usuario VARCHAR(30) NOT NULL,
fecha_nacimiento DATE NOT NULL,
fecha_inscripcion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

USE biblioteca;
-- ----- Borramos la tabla -----
-- DROP TABLE usuarios;

-- ALTER TABLE tbl_usuarios RENAME usuarios;

DESCRIBE usuarios;

-- Cambiar id de la tabla libros a id_libro

ALTER TABLE libros RENAME COLUMN id to id_libro;

-- Vamos a crear la tabla prestamos
-- id_prestamo
-- id_usuario
-- id_libro
-- fecha_prestamo

CREATE TABLE prestamos (
id_prestamo INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
id_usuario INT NOT NULL,
id_libro INT NOT NULL,
fecha_prestamo TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

USE biblioteca;
-- ----- Borramos la tabla -----
-- drop table prestamos ;

-- ALTER TABLE tbl_prestamos RENAME prestamos;

DESCRIBE prestamos;

-- Vamos a insertar usuarios
INSERT INTO usuarios(numero_carnet, nombre_usuario, apellido_usuario, fecha_nacimiento)
VALUES (FLOOR(RAND()*(99999999-10000000+1))+10000000, "Pepe", "García Lopez", "2004-02-13"),
(FLOOR(RAND()*(99999999-10000000+1))+10000000, "Paco", "Lopez Martinez", "2000-04-22"),
(FLOOR(RAND()*(99999999-10000000+1))+10000000, "Pedro", "Rodriguez Gomez", "1999-01-18"),
(FLOOR(RAND()*(99999999-10000000+1))+10000000, "Marta", "Azuara", "1970-06-22"),
(FLOOR(RAND()*(99999999-10000000+1))+10000000, "Elena", "Garcia Garcia", "1990-03-20"),
(FLOOR(RAND()*(99999999-10000000+1))+10000000, "Adria", "Diaz Martinez", "1980-05-23"),
(FLOOR(RAND()*(99999999-10000000+1))+10000000, "Andres", "Vazquez Martinez", "1974-01-02"),
(FLOOR(RAND()*(99999999-10000000+1))+10000000, "Jordi", "Lopez Nicolau", "2005-02-01"),
(FLOOR(RAND()*(99999999-10000000+1))+10000000, "Manuela", "Cuchillo Martinez", "2001-08-31"),
(FLOOR(RAND()*(99999999-10000000+1))+10000000, "Juan", "Martinez Gomez", "2010-07-23"),
(FLOOR(RAND()*(99999999-10000000+1))+10000000, "Eduardo", "Cunchillo Vivar", "1960-10-20"),
(FLOOR(RAND()*(99999999-10000000+1))+10000000, "Manuela", "Cuchillo Birba", "1962-12-21"),
(FLOOR(RAND()*(99999999-10000000+1))+10000000, "Pedro", "Rodriguez Cebolla", "1998-12-12")
;

SELECT * FROM usuarios;

-- Vamos a insertar prestamos
INSERT INTO prestamos(id_usuario, id_libro)
VALUES (1, 1), (1, 2), (1, 3), (2, 1), (2, 2), (3, 1)
;

SELECT * FROM prestamos;

-- NATURAL JOIN sirve para hacer un INNER JOIN (o JOIN a secas)
-- cuando los ids de relación se llaman igual
SELECT us.nombre_usuario, us.apellido_usuario, li.titulo, pr.fecha_prestamo
FROM usuarios us
NATURAL JOIN prestamos pr
NATURAL JOIN libros li;

-- Selección de usuarios que no han tomado un libro prestado
SELECT us.nombre_usuario, us.apellido_usuario, pr.fecha_prestamo
FROM usuarios us
LEFT JOIN prestamos pr
ON us.id_usuario = pr.id_usuario
WHERE fecha_prestamo IS NULL;

-- ALTER TABLE usuarios
-- RENAME COLUMN apellido TO apellido_usuario;

-- Selección de cuantos libros ha cogido cada usuario
SELECT us.nombre_usuario, us.apellido_usuario, COUNT(id_libro) as librosPrestados
FROM usuarios us
NATURAL JOIN prestamos pr
NATURAL JOIN libros li
GROUP BY us.id_usuario;

--  NECESITAMOS SABER...
USE biblioteca;
-- Qué usuarios han tomado prestados libros de editoriales de Barcelona

SELECT DISTINCT us.numero_carnet, us.nombre_usuario, us.apellido_usuario, ed.nombre_editorial, po.nombre_poblacion, pr.fecha_prestamo
FROM usuarios us
NATURAL JOIN prestamos pr
NATURAL JOIN editoriales ed
NATURAL JOIN poblaciones po
-- ON us.id_usuario = pr.id_usuario
WHERE nombre_poblacion = "Barcelona";

-- Cuántos libros hay de editoriales que no son de Barcelona

SELECT COUNT(li.id_libro)  -- li.titulo, ed.nombre_editorial, po.nombre_poblacion
FROM libros li
NATURAL JOIN editoriales ed
NATURAL JOIN poblaciones po
WHERE nombre_poblacion NOT IN ("Barcelona");

-- Cuántos libros tenemos que empiecen por p

SELECT COUNT(id_libro) AS librosConP
FROM libros WHERE titulo LIKE "p%" ;

-- Cuál es el libro más prestado

-- Hacemos una primera querie que nos devuelva los titulos y las cantidades
SELECT li.titulo, pr.id_libro, COUNT(pr.id_libro) AS MasPrestado -- Seleccionamos titulo, id_libro y el conteo de los prestamos
FROM prestamos pr -- seleccionamos la primera tabla
NATURAL JOIN libros li -- Unimos con la segunda tabla
GROUP BY pr.id_libro -- Agrupamos por id_libro para sumar las repeticiones
-- Una vez que esto funciona vamos a filtrar
-- Con el having filtramos
HAVING MasPrestado = -- Establecemos el campo por el que queremos filtrar 
( SELECT COUNT(id_libro) AS MasPrestado FROM prestamos GROUP BY id_libro ORDER BY MasPrestado DESC LIMIT 1 ); -- Esta querie la explico debajo, es la que nos devuelve el numero más grande

-- Hacemos una segunda querie que nos devuelva el número más grande
-- Buscamos/Filtramos el numero más grande del conteo de los prestamos
SELECT COUNT(id_libro) as MasPrestado -- Seleccionamos y contamos los libros en una nueva columna
FROM prestamos -- de la tabla de prestamos
GROUP BY id_libro -- agrupamos el conteo por id_libro
ORDER BY MasPrestado DESC -- para poder filtrar bien los ordenamos de mayor a menor
LIMIT 1; -- Indicamos que solo nos coja el número máximo

-- ---------------------------------
-- Qué usuarios han leido el libro más prestado

SELECT DISTINCT us.numero_carnet, us.nombre_usuario, us.apellido_usuario, li.titulo
FROM usuarios us
NATURAL JOIN prestamos pr
NATURAL JOIN libros li
WHERE li.id_libro in (
SELECT COUNT(pr.id_libro) AS MasPrestado -- Seleccionamos titulo, id_libro y el conteo de los prestamos
FROM prestamos pr -- seleccionamos la primera tabla
NATURAL JOIN libros li -- Unimos con la segunda tabla
GROUP BY pr.id_libro -- Agrupamos por id_libro para sumar las repeticiones
-- Una vez que esto funciona vamos a filtrar
-- Con el having filtramos
HAVING MasPrestado = -- Establecemos el campo por el que queremos filtrar 
( SELECT COUNT(id_libro) AS MasPrestado FROM prestamos GROUP BY id_libro ORDER BY MasPrestado DESC LIMIT 1 ) -- Esta querie la explico debajo, es la que nos devuelve el numero más grande
);

-- SELECT us.nombre_usuario, li.titulo, li.id_libro
-- FROM libros li
-- NATURAL JOIN prestamos pr
-- NATURAL JOIN usuarios us
-- ORDER BY li.id_libro
-- WHERE id_libro = (
-- SELECT id_libro FROM prestamos GROUP BY id_libro HAVING COUNT(id_libro) = (
-- SELECT MAX(MasPrestado) FROM (
-- SELECT COUNT(id_libro) AS MasPrestado FROM prestamos GROUP BY id_libro
-- ) AS listaMasPrestados));

-- SELECT us.nombre_usuario, li.titulo, li.id_libro
-- FROM libros li
-- NATURAL JOIN prestamos pr
-- NATURAL JOIN usuarios us
-- WHERE li.id_libro = (
-- SELECT id_libro FROM prestamos GROUP BY id_libro HAVING COUNT(id_libro) = (
-- SELECT MAX(MasPrestado) FROM (
-- SELECT COUNT(id_libro) AS MasPrestado FROM prestamos GROUP BY id_libro
-- ) AS listaMasPrestados))
-- ORDER BY li.id_libro;

-- -- SELECT id_libro, COUNT(id_libro) AS MasPrestado FROM prestamos NATURAL JOIN libros li GROUP BY id_libro HAVING MasPrestado = (SELECT COUNT(id_libro) AS MasPrestado FROM prestamos GROUP BY id_libro ORDER BY MasPrestado DESC LIMIT 1)

-- SELECT id_libro
-- FROM prestamos
-- GROUP BY id_libro
-- ORDER BY COUNT(*) DESC
-- LIMIT 1;


-- Borra el libro con id_libro = 6

-- Añade la editorial Mondadori, de Milán
insert into poblaciones(nombre_poblacion) values ('Milán');
-- Para establecer una variable
set @idPoblacion = (select id_poblacion from poblaciones where nombre_poblacion = 'Milán');
insert into editoriales(nombre_editorial, id_poblacion) VALUES ('Mondadori', @idPoblacion);

-- Añade el libro "Ciudadanos", del autor Simón Schama, género "política", editado en 2022

-- Obtén el libro o libros de más reciente publicación

-- Obtén la editorial cuyos libros son los más prestados

-- ----- Hablamos del HAVING -----
SELECT l.titulo, count(l.id_libro)
FROM libros l
NATURAL JOIN prestamos p
GROUP BY l.id_libro
HAVING count(l.id_libro) = 3;

-- ----- Hablamos de Foreign Keys -----
ALTER TABLE libros
ADD CONSTRAINT fk_editorial
FOREIGN KEY (id_editorial)
REFERENCES editoriales(id_editorial)
-- on delete cascade -- borra sin restricciones
-- on update cascade -- lo mismo
-- on delete set null -- pone un nulo y pierdo la información
-- on update set null -- lo mismo
ON DELETE RESTRICT -- solo borra si no hay más elemntos asociados
ON UPDATE RESTRICT
;

ALTER TABLE editoriales
ADD CONSTRAINT fk_poblacion
FOREIGN KEY (id_poblacion)
REFERENCES poblaciones(id_poblacion)
-- on delete cascade -- borra sin restricciones
-- on update cascade -- lo mismo
-- on delete set null -- pone un nulo y pierdo la información
-- on update set null -- lo mismo
ON DELETE RESTRICT -- solo borra si no hay más elemntos asociados
ON UPDATE RESTRICT
;

ALTER TABLE prestamos
ADD CONSTRAINT fk_usuario
FOREIGN KEY (id_usuario)
REFERENCES usuarios(id_usuario)
-- on delete cascade -- borra sin restricciones
-- on update cascade -- lo mismo
-- on delete set null -- pone un nulo y pierdo la información
-- on update set null -- lo mismo
ON DELETE RESTRICT -- solo borra si no hay más elemntos asociados
ON UPDATE RESTRICT
;

ALTER TABLE prestamos
ADD CONSTRAINT fk_libro
FOREIGN KEY (id_libro)
REFERENCES libros(id_libro)
-- on delete cascade -- borra sin restricciones
-- on update cascade -- lo mismo
-- on delete set null -- pone un nulo y pierdo la información
-- on update set null -- lo mismo
ON DELETE RESTRICT -- solo borra si no hay más elemntos asociados
ON UPDATE RESTRICT
;

DESCRIBE libros;
USE biblioteca;

-- De los libros en prestamo cual es el titulo, la editorial y la población, vamos a crear una vista
CREATE OR REPLACE VIEW vista AS
SELECT DISTINCT li.titulo, ed.nombre_editorial, po.nombre_poblacion -- , pr.fecha_prestamo
FROM libros li
NATURAL JOIN prestamos pr
NATURAL JOIN editoriales ed
NATURAL JOIN poblaciones po
;

SELECT * FROM vista;
-- DROP VIEW vista;

-- Procedimientos almacenados
DELIMITER $$
CREATE PROCEDURE insertEditorial(poblacion varchar(50), nombreEditorial varchar(100))
BEGIN
	# Miramos si existe la editorial
	set @id_editorial = (select id_editorial from editoriales e where e.nombre_editorial = nombreEditorial);
	if @id_editorial is null THEN
		# Miramos is existe la población
		set @id_poblacion = (select id_poblacion from poblaciones p where p.nombre_poblacion = poblacion);
		if @id_poblacion is null then
			insert into poblaciones(nombre_poblacion) values (poblacion);
            set @id_poblacion = (select id_poblacion from poblaciones p where p.nombre_poblacion = poblacion);
		ELSE
			select concat('La poblacion "', poblacion, '" ya existe');
        end if;
		insert into editoriales(nombre_editorial, id_poblacion) values (nombreEditorial, @id_poblacion);
    ELSE
		select concat('La editorial "', nombreEditorial, '" ya existe');
	END IF;
END $$
DELIMITER ;

drop procedure insertEditorial;

call insertEditorial ("París", "Oh la la");
delete from editoriales where nombre_editorial = "Oh la la" ;
delete from poblaciones where nombre_poblacion = "París" ;


-- El usuario con id 4 hace un prestamo del libro con id 4
INSERT INTO prestamos(id_usuario, id_libro)
VALUES (4, 2);
SELECT * FROM prestamos;