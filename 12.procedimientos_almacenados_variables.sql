/*-- PROCEDIMIENTOS ALMACENADOS - VARIABLES --*/
SET SERVEROUTPUT ON;

CREATE TABLE tabla_1(
    titulo VARCHAR2(40),
    precio NUMBER(6,2)
);

SELECT * 
FROM libros;

CREATE OR REPLACE PROCEDURE sp_autor_libro(p_titulo IN VARCHAR2)
AS  
    v_autor VARCHAR2(20);
    BEGIN
        SELECT autor 
        INTO v_autor 
        FROM libros
        WHERE titulo = p_titulo;
        
        INSERT INTO tabla_1(titulo, precio)
        SELECT titulo, precio
        FROM libros
        WHERE autor = v_autor;
            
    END sp_autor_libro;
    
SELECT * 
FROM tabla_1;
    
EXECUTE sp_autor_libro('El quijote');
