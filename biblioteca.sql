# Hay que crear una BD llamada 'biblioteca'

CREATE DATABASE IF NOT EXISTS biblioteca;
USE biblioteca;

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

DESCRIBE libros;

# Inserta este libro:
# Cien años de soledad
# Gabriel
# García Marquez
# 1990
# Tusquets
# 3

INSERT INTO libros(titulo, autor_nombre, autor_apellido, editorial, year_edition, ejemplares) 
VALUES ("Cien años de soledad", "Gabriel", "García Marquez", "Tusquets", 1990, 3);

INSERT INTO libros(titulo, autor_nombre, autor_apellido, editorial, year_edition, ejemplares) 
VALUES ("El coronel no tiene quien le escriba", "Gabriel", "García Marquez", "Tusquets", 1995, 2);

INSERT INTO libros(titulo, autor_nombre, autor_apellido, editorial, year_edition, ejemplares) 
VALUES ("Python", "Guido", "Van Rossum", "Anaya  Multimedia", 2024, 4);

INSERT INTO libros(titulo, autor_nombre, editorial, year_edition, ejemplares) 
VALUES ("La Odisea", "Homero", "Catedra", 2024, 2);

SELECT * FROM libros;

# Seleccionar los libros cuyo nombre de autor empieza por "G"
SELECT titulo
FROM libros
WHERE autor_nombre like "G%";

# Cuántos libros diferentes tenemos en la biblioteca
# Hay que crear una BD llamada 'biblioteca'

CREATE DATABASE IF NOT EXISTS biblioteca;
USE biblioteca;

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

DESCRIBE libros;

# Inserta este libro:
# Cien años de soledad
# Gabriel
# García Marquez
# 1990
# Tusquets
# 3

INSERT INTO libros(titulo, autor_nombre, autor_apellido, editorial, year_edition, ejemplares) 
VALUES ("Cien años de soledad", "Gabriel", "García Marquez", "Tusquets", 1990, 3);

INSERT INTO libros(titulo, autor_nombre, autor_apellido, editorial, year_edition, ejemplares) 
VALUES ("El coronel no tiene quien le escriba", "Gabriel", "García Marquez", "Tusquets", 1995, 2);

INSERT INTO libros(titulo, autor_nombre, autor_apellido, editorial, year_edition, ejemplares) 
VALUES ("Python", "Guido", "Van Rossum", "Anaya  Multimedia", 2024, 4);

INSERT INTO libros(titulo, autor_nombre, editorial, year_edition, ejemplares) 
VALUES ("La Odisea", "Homero", "Catedra", 2024, 2);

SELECT * FROM libros;

# Seleccionar los libros cuyo nombre de autor empieza por "G"
SELECT titulo
FROM libros
WHERE autor_nombre like "G%";

# Cuántos libros diferentes tenemos en la biblioteca
# Hay que crear una BD llamada 'biblioteca'

CREATE DATABASE IF NOT EXISTS biblioteca;
USE biblioteca;

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

DESCRIBE libros;

# Inserta este libro:
# Cien años de soledad
# Gabriel
# García Marquez
# 1990
# Tusquets
# 3

INSERT INTO libros(titulo, autor_nombre, autor_apellido, editorial, year_edition, ejemplares) 
VALUES ("Cien años de soledad", "Gabriel", "García Marquez", "Tusquets", 1990, 3);

INSERT INTO libros(titulo, autor_nombre, autor_apellido, editorial, year_edition, ejemplares) 
VALUES ("El coronel no tiene quien le escriba", "Gabriel", "García Marquez", "Tusquets", 1995, 2);

INSERT INTO libros(titulo, autor_nombre, autor_apellido, editorial, year_edition, ejemplares) 
VALUES ("Python", "Guido", "Van Rossum", "Anaya  Multimedia", 2024, 4);

INSERT INTO libros(titulo, autor_nombre, editorial, year_edition, ejemplares) 
VALUES ("La Odisea", "Homero", "Catedra", 2024, 2);

SELECT * FROM libros;

# Seleccionar los libros cuyo nombre de autor empieza por "G"
SELECT titulo
FROM libros
WHERE autor_nombre like "G%";

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

SELECT titulo, ejemplares
FROM libros
WHERE ejemplares = (SELECT MIN(ejemplares)
FROM libros);

SELECT titulo, ejemplares
FROM libros
WHERE ejemplares = 2;

ALTER TABLE libros ADD COLUMN genero varchar(20) NOT NULL;

ALTER TABLE libros MODIFY COLUMN genero varchar(20) NOT NULL;

describe libros;
-- Todos los libros son del genero ficción, menos pyhthon que es programación
select * from libros;

-- UPDATE libros SET genero = 'ficción';
-- UPDATE libros SET genero = 'programación' where titulo = 'Python';
-- UPDATE libros SET autor_nombre = 'Paco' where id =6 ;
-- UPDATE libros SET autor_apellido = 'Martinez Diaz' where id =6 ;
-- UPDATE libros SET editorial = 'Amazon' where id =6 ;
-- UPDATE libros SET year_edition = 2018 where id =6 ;
-- UPDATE libros SET ejemplares = 6 where id =6 ;


-- Añadir 10 titulos más :
-- 2 de programación 
-- 2 de poesia
-- 3 de historia
-- 3 de arte

-- INSERT INTO libros(titulo, autor_nombre, autor_apellido, editorial, year_edition, ejemplares, genero) 
-- VALUES ("Aprende C", "Pepe", "García Lopez", "Anaya", 2004, 2, "programación"),
-- ("Aprende C", "Pepe", "García Lopez", "Anaya", 2004, 2, "programación")
-- ;

-- INSERT INTO biblioteca.libros(titulo, autor_nombre, autor_apellido, editorial, year_edition, ejemplares, genero) 
-- VALUES 
-- ("Grandes Liadas de la Historia: Desastres históricos, narrados con fidelidad y algo de mala leche", "Jesús", "Barranco Reyes", "SINGULARIDAD", 2024, 5, "historia"),
-- ("Locos por la historia: 125 curiosidades de la historia que nunca antes te habían contado", "Bonalletra", "Alcompàs", "Shackleton Kids", 2021, 2, "historia"),
-- ("Una historia de España (Best Seller)", "Arturo", "Pérez-Reverte", "DeBolsillo", 2022, 2, "historia"),
-- ("Historia del mundo mapa a mapa (Enciclopedia visual)", "DK", " ", "DK", 2019, 1, "historia")
-- ;

-- INSERT INTO biblioteca.libros(titulo, autor_nombre, autor_apellido, editorial, year_edition, ejemplares, genero) 
-- VALUES 
-- ("Monet", " Christoph", "Heinrich", "Taschen", 2023, 2, "arte"),
-- ("London. Portrait of a City", "Reuel", "Golden", "Taschen", 2023, 1, "arte"),
-- ("Van Gogh. La Obra Completa. Pintura", " Rainer", "Metzger", "Taschen", 2015, 3, "arte")
-- ;

-- select titulo, genero from biblioteca.libros where genero = 'arte' or genero = 'historia' or genero = 'programacion';
-- select titulo, genero from biblioteca.libros where genero not in ('arte', 'historia', 'programacion');

-- Libros cuya cantidad de ejemplares está entre 2 y 4
select titulo, ejemplares
from biblioteca.libros
where ejemplares between 2 and 4 order by ejemplares asc
;

-- Necesitamos una tabla nueva para las editoriales
create table tbl_editoriales (
id_editorial int not null auto_increment primary key,
nombre_editorial varchar(100) not null,
ciudad_editorial varchar(100) null
);
use biblioteca;

describe tbl_editoriales;

select editorial from libros;

insert into tbl_editoriales (nombre_editorial)
select distinct editorial from libros;

select * from tbl_editoriales ;

--  Añadir una columna en la tabla libros (id_editorial) con los ids
alter table libros add id_editorial int not null;
-- Eliminar la columna editorial y rellenar la columna id
select * from libros ;

select libros.titulo, editoriales.nombre_editorial
from libros, editoriales;

select li.titulo, ed.nombre_editorial
from libros as li, editoriales as ed;

select li.titulo, ed.nombre_editorial
from libros li, tbl_editoriales ed
where li.editorial = ed.nombre_editorial
;

select li.titulo, ed.nombre_editorial
from libros li
join tbl_editoriales ed on li.editorial = ed.nombre_editorial
;

update libros li, tbl_editoriales ed
set li.id_editorial = ed.id_editorial
where li.editorial = ed.nombre_editorial
;

alter table libros
drop editorial;

select li.titulo, ed.nombre_editorial, ed.ciudad_editorial
from libros li
join tbl_editoriales ed
on li.id_editorial = ed.id_editorial
;

-- Necesitamos una tabla para las poblaciones
-- poblacion varchar(50)
-- id_poblacion
-- Que se vinculará a la tabla editoriales

create table tbl_poblaciones (
id_poblacion int not null auto_increment primary key,
nombre_poblacion varchar(100) not null
);

alter table tbl_editoriales add id_poblaciones int not null;

ALTER TABLE tbl_editoriales RENAME COLUMN id_poblaciones to id_poblacion;

select * from libros;
select * from tbl_editoriales;
select * from tbl_poblaciones;

insert into tbl_poblaciones (nombre_poblacion)
select distinct ciudad_editorial from tbl_editoriales;

update tbl_editoriales ed, tbl_poblaciones po
set ed.id_poblacion = po.id_poblacion
where ed.ciudad_editorial = po.nombre_poblacion
;

alter table tbl_editoriales
drop ciudad_editorial;

select li.titulo, li.ejemplares, ed.nombre_editorial, po.nombre_poblacion
from libros li
join tbl_editoriales ed
on li.id_editorial = ed.id_editorial
join tbl_poblaciones po
on ed.id_poblacion = po.id_poblacion
;

-- Vamos a incorporar los usuarios
-- id_usuario
-- nombre
-- apellido
-- fecha de nacimiento (aaaa-mm-dd)
-- numero de carnet SELECT FLOOR(RAND()*(b-a+1))+a
-- SELECT FLOOR(RAND()*(99999999-10000000+1))+10000000 as carnet;
-- fecha de inscripcion

create table tbl_usuarios (
id_usuario int not null auto_increment primary key,
numero_carnet int unique not null,
nombre_usuario varchar(20) not null,
apellido_usuario varchar(30) not null,
fecha_nacimiento date not null,
fecha_inscripcion timestamp DEFAULT CURRENT_TIMESTAMP
);

describe tbl_usuarios;

-- Cambiar id de la tabla libros a id_libro

ALTER TABLE libros RENAME COLUMN id to id_libro;

-- Vamos a crear la tabla prestamos
-- id_prestamo
-- id_usuario
-- id_libro
-- fecha_prestamo

create table tbl_prestamos (
id_prestamo int not null auto_increment primary key,
id_usuario int unique not null,
id_libro int unique not null,
fecha_prestamo timestamp DEFAULT CURRENT_TIMESTAMP
);

describe tbl_prestamos;

-- Vamos a insertar usuarios
INSERT INTO tbl_usuarios(numero_carnet, nombre_usuario, apellido_usuario, fecha_nacimiento)
VALUES (FLOOR(RAND()*(99999999-10000000+1))+10000000, "Pepe", "García Lopez", "2004-02-13")
;

INSERT INTO tbl_usuarios(numero_carnet, nombre_usuario, apellido_usuario, fecha_nacimiento)
VALUES (FLOOR(RAND()*(99999999-10000000+1))+10000000, "Paco", "Lopez Martinez", "2000-04-22"),
(FLOOR(RAND()*(99999999-10000000+1))+10000000, "Pedro", "Rodriguez Gomez", "1999-01-18"),
(FLOOR(RAND()*(99999999-10000000+1))+10000000, "Marta", "Azuara", "1960-06-22"),
(FLOOR(RAND()*(99999999-10000000+1))+10000000, "Elena", "Garcia Garcia", "2000-04-22"),
(FLOOR(RAND()*(99999999-10000000+1))+10000000, "Adria", "Lopez Martinez", "2000-04-22"),
(FLOOR(RAND()*(99999999-10000000+1))+10000000, "Andres", "Lopez Martinez", "2000-04-22"),
(FLOOR(RAND()*(99999999-10000000+1))+10000000, "Jordi", "Lopez Martinez", "2000-04-22"),
(FLOOR(RAND()*(99999999-10000000+1))+10000000, "Manuela", "Lopez Martinez", "2000-04-22"),
(FLOOR(RAND()*(99999999-10000000+1))+10000000, "Pedro", "Lopez Martinez", "2000-04-22")
;

select * from tbl_usuarios;
