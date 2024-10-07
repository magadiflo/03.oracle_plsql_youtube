/*-- TRIGGERS --*/
DROP TABLE libros;
DROP TABLE control;

CREATE TABLE libros(
    codigo NUMBER(6),
    titulo VARCHAR2(40),
    autor VARCHAR2(30),
    editorial VARCHAR2(20),
    precio NUMBER(6,2)
);

CREATE TABLE control(
    usuario VARCHAR2(30),
    fecha DATE
);

--Creando un trigger, se ejecutará antes de insertar datos en la tabla libros
CREATE OR REPLACE TRIGGER tr_ingreso_libros
BEFORE INSERT
ON libros
    BEGIN
        INSERT INTO control(usuario, fecha)
        VALUES(USER, SYSDATE);
    END tr_ingreso_libros;

--Ejecutando un insert, se disparará el trigger creado
INSERT INTO libros(codigo, titulo, autor, editorial, precio)
VALUES(1, 'El caballero Carmelo', 'Abraham Valdelomar', 'Bruño', 12.50);

--Verificamos la tabla control que fue usada por el trigger creado
SELECT * FROM control;


