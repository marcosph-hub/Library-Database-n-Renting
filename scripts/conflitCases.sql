-- Tabla articulo
-- Stock Negativo
INSERT INTO articulo (titulo, tipo, subtitulo, fchPublicacion, portada, stock) 
VALUES 
  ('Articulo_1','libro','Subtitulo_1', '2022-10-01', E'\\x89504e470d0a1a0a0000', -1);

-- Tipo de Articulo erroneo
INSERT INTO articulo (titulo, tipo, subtitulo, fchPublicacion, portada, stock) 
VALUES 
  ('Articulo_1','OtroTipo','Subtitulo_1', '2022-10-01', E'\\x89504e470d0a1a0a0000', 1);

-- Fecha de publicacion de articulo mayor que fecha actual
INSERT INTO articulo (titulo, tipo, subtitulo, fchPublicacion, portada, stock) 
VALUES 
  ('Articulo_1','libro','Subtitulo_1', '2099-10-01', E'\\x89504e470d0a1a0a0000', 1);


-- Tabla generoArticulo
-- Genero no Existente
INSERT INTO generoArticulo (idArticulo, genero) 
VALUES
  (2, 'OtroGenero');

-- Evitar Duplicidad de Datos
INSERT INTO generoArticulo (idArticulo, genero) 
VALUES 
  (1, 'Historia'),
  (1, 'Historia');

-- Tabla libro
-- Introducir un libro cuyo idArticulo no se encuentre en Articulo
INSERT INTO libro (idArticulo, editorial, numPaginas, estilo, sinopsis, idAutor)
VALUES 
  (0, 'Editorial1', 300, 'Narrativo', 'Sinopsis del libro 1', 1);

-- Evitar Duplicidad de Datos
INSERT INTO libro (idArticulo, editorial, numPaginas, estilo, sinopsis, idAutor)
VALUES 
  (1, 'Editorial1', 300, 'Narrativo', 'Sinopsis del libro 1', 1),
  (1, 'Editorial1', 300, 'Narrativo', 'Sinopsis del libro 1', 1);

-- Insertar un articulo que no sea de tipo libro en la tabla libro
INSERT INTO libro (idArticulo, editorial, numPaginas, estilo, sinopsis, idAutor)
VALUES 
  (11, 'Editorial1', 300, 'Lirico', 'Recopilación de noticias ', 1);

-- Tabla materialPeriodico
-- Insertar un Libro en la tabla materialPeriodico
INSERT INTO materialPeriodico (idArticulo, editorial, numPaginas, tipo)
VALUES 
  (1, 'Editorial3', 20, 'Libro');

-- Tabla materialAudiovisual
-- Insertar cualquier artículo que no sea audiovisual (Pelicula, Documental, Serie)
INSERT INTO materialAudiovisual (idArticulo, duracion, categoria, tipo)
VALUES 
  (1, '02:30:00', 'Libro', 'DVD');

-- Tabla autor_materialAudiovisual
-- Evitar Duplicidad de Datos
INSERT INTO autor_materialAudiovisual (idMaterialAudiovisual, idAutor)
VALUES 
  (21, 25),
  (21, 25);

-- Tabla trabajadores
-- Evitar Introducir un DNI con un formato no aceptado
INSERT INTO trabajador (dni, nombre, apellido1, apellido2, fchNacimiento, nombreUsuario, sexo, contrasena, edad, fchHoraRegistro)
VALUES 
  ('X999BX', 'Tester', 'Tester', 'Tester', '1990-05-15', 'userTester', 'M', 'psswdTester', 32, '2013-11-18 09:30:00');

-- No existe un trabajador cuya fecha de registro sea superior a su fecha de nacimiento
INSERT INTO trabajador (dni, nombre, apellido1, apellido2, fchNacimiento, nombreUsuario, sexo, contrasena, edad, fchHoraRegistro)
VALUES 
  ('99999999X', 'Tester', 'Tester', 'Tesster', '2000-05-15', 'userTester', 'M', 'psswdTester', 32, '1950-11-18 09:30:00');

-- Trabajador con contraseña vacía
INSERT INTO trabajador (dni, nombre, apellido1, apellido2, fchNacimiento, nombreUsuario, sexo, contrasena, edad, fchHoraRegistro)
VALUES 
  ('99999999X', 'Tester', 'Tester', 'Tesster', '1990-05-15', 'userTester', 'M', NULL, 32, '2013-11-18 09:30:00');

-- Evitar nombres de usuarios repetidos;
INSERT INTO trabajador (dni, nombre, apellido1, apellido2, fchNacimiento, nombreUsuario, sexo, contrasena, edad, fchHoraRegistro)
VALUES 
  ('09999999X', 'Tester', 'Tester', 'Tesster', '1990-05-15', 'juanito123', 'M', 'psswdTester', 32, '2013-11-18 09:30:00');

-- Tabla telefonoTrabajador
-- No existen dos números repetidos 
INSERT INTO telefonoTrabajador (dniTrabajador, telefono)
VALUES
  ('12345678A', '987654321'),
  ('34567890F', '987654321');

-- Evitar Duplicidad de Datos
INSERT INTO telefonoTrabajador (dniTrabajador, telefono)
VALUES
  ('12345678A', '123456789'),
  ('12345678A', '123456789');

-- Tabla emailTrabajador 
-- No existen dos emails repetidos 
INSERT INTO emailTrabajador (dniTrabajador, email)
VALUES
  ('12345678A', 'juan.perez@example.com'),
  ('98765432B', 'juan.perez@example.com');

-- Evitar Duplicidad de Datos
INSERT INTO emailTrabajador (dniTrabajador, email)
VALUES
  ('12345678A', 'juan.perez@example.com'),
  ('12345678A', 'juan.perez@example.com');

-- Tabla telefonoUsuario
-- No puede existir un telefono para un usuarioAdulto y el mismo telefono para un usuarioMenor
INSERT INTO telefonoUsuario (idUsuarioAdulto, idUsuarioMenor, telefono)
VALUES
  (1, 1, '012012012');

-- Tabla horario
-- No se pueden solapar los periodos de trabajo para un mismo trabajador
INSERT INTO horario (dniTrabajador, fchInicio, fchFin) 
VALUES
  ('12345678A', '2022-03-12', '2023-01-15'),
  ('12345678A', '2022-11-02', '2023-01-01');

-- Tabla prestacion
-- Una prestacion debe ser creada por un trabajador Existente
INSERT INTO prestacion (idArticulo, dniTrabajador, idUsuarioAdulto, idUsuarioMenor, fchInicio, fchFin, fchDevolucion)
VALUES 
  (1, '99999999A', 1, NULL, '2022-10-01', '2022-10-15', NULL);

-- Una prestacion no puede ser para dos tipos de usuarios distintos a la vez
INSERT INTO prestacion (idArticulo, dniTrabajador, idUsuarioAdulto, idUsuarioMenor, fchInicio, fchFin, fchDevolucion)
VALUES 
  (1, '12345678A', 1, 1, '2022-10-01', '2022-10-15', NULL);

-- Un estudiante no puede tener tener mas de 7 prestaciones vigentes, no puede sacar mas de 7 articulos de la biblioteca
INSERT INTO prestacion (idArticulo, dniTrabajador, idUsuarioAdulto, idUsuarioMenor)
VALUES 
  (5, '78901234D', 5, NULL),
  (6, '78901234D', 5, NULL),
  (7, '78901234D', 5, NULL),
  (8, '78901234D', 5, NULL),
  (9, '78901234D', 5, NULL),
  (10, '78901234D', 5, NULL),
  (11, '78901234D', 5, NULL);

-- Un usuario adulto no puede tener mas de 5 prestaciones vigentes, no puede sacar mas de 5 articulos de la biblioteca
INSERT INTO prestacion (idArticulo, dniTrabajador, idUsuarioAdulto, idUsuarioMenor)
VALUES 
  (5, '78901234D', 4, NULL),
  (6, '78901234D', 4, NULL),
  (7, '78901234D', 4, NULL),
  (8, '78901234D', 4, NULL),
  (11, '78901234D', 4, NULL);

-- Un usuario menor no puede sacar mas de 7 prestaciones vigentes, no puede sacar mas de 5 articulos de la biblioteca
INSERT INTO prestacion (idArticulo, dniTrabajador, idUsuarioAdulto, idUsuarioMenor)
VALUES 
  (5, '78901234D', NULL, 2),
  (6, '78901234D', NULL, 2),
  (7, '78901234D', NULL, 2),
  (8, '78901234D', NULL, 2),
  (9, '78901234D', NULL, 2),
  (10, '78901234D', NULL, 2),
  (11, '78901234D', NULL, NULL);

-- Tras crear una prestacion el stock del articulo disminuye
SELECT id, stock FROM articulo WHERE id = 21;
INSERT INTO prestacion (idArticulo, dniTrabajador, idUsuarioAdulto, idUsuarioMenor, fchDevolucion) 
VALUES 
  (21, '12345678A', 2, NULL, NULL);
SELECT id, stock FROM articulo WHERE id = 21;

-- Tras devolver una prestacion el stock del articulo aumenta
SELECT id, stock FROM articulo WHERE id = 21;
UPDATE prestacion SET fchdevolucion = '2023-12-28' WHERE idArticulo = 21;
SELECT id, stock FROM articulo WHERE id = 21;