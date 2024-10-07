/*-- PROCEDIMIENTOS ALMACENADOS --*/
SET SERVEROUTPUT ON;

/*EJERCICIO 01. Crear un procedimiento almacenado que imprima un saludo*/
--Creando stored procedure sp_saludo
CREATE OR REPLACE PROCEDURE sp_saludo
AS
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Hola a todos');
    END sp_saludo;
    
--1° Forma de ejecutar el Stored Procedure
EXECUTE sp_saludo;

--2° Forma de ejecutar el Stored Procedure
BEGIN
    sp_saludo;
END;

/*EJERCICIO 02. Crear un procedimiento que aumente el precio del libro en 10%*/
CREATE TABLE libros(
    id INTEGER PRIMARY KEY,
    titulo VARCHAR2(100),
    autor VARCHAR2(100),
    precio NUMBER(8,2)
);

INSERT INTO libros(id, titulo, autor, precio)
VALUES(1, 'El quijote', 'Miguel de Cervantes', 454.50);
INSERT INTO libros(id, titulo, autor, precio)
VALUES(2, 'Cien años de soledad', 'Gabriel García Marquez', 545.40);
INSERT INTO libros(id, titulo, autor, precio)
VALUES(3, 'El alquimista', 'Paulo Cohelo', 636.30);

SELECT * FROM libros;

--Creando el procedimiento almacenado
CREATE OR REPLACE PROCEDURE sp_aumenta_precio
AS
    BEGIN
        UPDATE libros 
        SET precio = precio * 1.10;
    END sp_aumenta_precio;

--Ejecutamos el Procedimiento almacenado
EXECUTE sp_aumenta_precio;

--Eliminando Stored Procedures
DROP PROCEDURE sp_saludo;